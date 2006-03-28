Received: from mga02.intel.com ([134.134.136.20] helo=orsmga101-1.jf.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FOEuO-0006DD-Hq
	for linux-mtd@lists.infradead.org; Tue, 28 Mar 2006 09:11:14 -0500
Message-ID: <442943A3.6060807@intel.com>
Date: Tue, 28 Mar 2006 18:09:39 +0400
From: "Alexey, Korolev" <alexey.korolev@intel.com>
MIME-Version: 1.0
To: Nicolas Pitre <nico@cam.org>
References: <Pine.LNX.4.64.0603101044290.3274@localhost.localdomain>
	<44200D27.2060404@intel.com>
	<Pine.LNX.4.64.0603211002250.3631@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0603211002250.3631@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] cfi: Fixup of write errors on XIP
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nicolas,

I've made some more investigations for the write errors issue on XIP.
The issue takes place when I attempt to write some data to one chip and 
erase data from another.

I collected a debug log describing the issue. Please see it below:
XIP udelay start waiting for WRITE
IRQ while WRITE
XIP udelay start waiting for ERASE
IRQ while ERASE
IRQ while ERASE
IRQ while ERASE
IRQ while ERASE
IRQ while ERASE (45 times)
...
WRITE 1 buffer write error (status timeout)
IRQ while ERASE
IRQ while ERASE
ERASE DONE

So there are two processes which have the same priority.
Rescheduling happens not so often. Once writing process has been 
switched to erasing process, next switch may not happen for very long 
time >1/2sec.
The problem here that cond_resched call doesn't switch processes often. 
(I mean if we have two processes of the same priority, cond_resched will 
switch active process with some low probability.)

Another problem here if I try to use several processes of the same 
priority.
In this case the probability to switch back to write procedure is much 
lower than before .
I made very simple test:

dd if=rnd of=/dev/mtd3 bs=1k count=16k&
flash_eraseall /dev/mtd10&
flash_eraseall /dev/mtd11&
where:
mtd3 is mapped to the first flash chip
mtd10, mtd11 are mapped to the second flash chips.
This case I was able to reproduce the "buffer write error (status 
timeout)" issue within first 20 seconds of test.

I'm afraid that this issue can be easily reproduced in case of system 
overload.
I think it's rather probable to face the situation on embedded platform 
when you have several high priority threads consuming 99% of CPU and 
writing thread (for example logging thread).

I found two possible ways for fixing this issue:
1. Which has been sent before.
Add lines in waiting cycle of do_write_buffer.
===============
--- c/drivers/mtd/chips/cfi_cmdset_0001.c 2006-02-22 20:58:05.869203280 
+0300
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c 2006-02-22 20:55:42.272033368 
+0300
@@ -1571,6 +1571,7 @@
/* GO GO GO */
map_write(map, CMD(0xd0), cmd_adr);
chip->state = FL_WRITING;
+ chip->write_suspended = 0;

INVALIDATE_CACHE_UDELAY(map, chip, cmd_adr,
adr, len,
@@ -1592,6 +1593,12 @@
continue;
}

+ /* Somebody suspended write. We should reset timeo. */
+ if (chip->write_suspended) {
+ chip->write_suspended = 0;
+ timeo = jiffies + (HZ/2);
+ }
+
status = map_read(map, cmd_adr);
if (map_word_andequal(map, status, status_OK, status_OK))
break;
=============

2. Fixup in xip_udelay function.
xip_udelay already check's the status. So this function will not wait 
more than required.
=============
--- a/drivers/mtd/chips/cfi_cmdset_0001.c 2006-02-09 04:02:07.000000000 
+0300
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c 2006-03-28 17:35:02.747532640 
+0400
@@ -913,6 +913,7 @@
struct cfi_pri_intelext *cfip = cfi->cmdset_priv;
map_word status, OK = CMD(0x80);
unsigned long suspended, start = xip_currtime();
+ int exit_timeo = max(usec,1000000);
flstate_t oldstate, newstate;

do {
@@ -933,7 +934,7 @@
*/
map_write(map, CMD(0xb0), adr);
map_write(map, CMD(0x70), adr);
- usec -= xip_elapsed_since(start);
+ exit_timeo -= xip_elapsed_since(start);
suspended = xip_currtime();
do {
if (xip_elapsed_since(suspended) > 100000) {
@@ -1004,7 +1005,7 @@
}
status = map_read(map, adr);
} while (!map_word_andequal(map, status, OK, OK)
- && xip_elapsed_since(start) < usec);
+ && xip_elapsed_since(start) < exit_timeo);
}

#define UDELAY(map, chip, adr, usec) xip_udelay(map, chip, adr, usec)
=============

I'd like to know what solution do you prefer? If you have another it 
would be interesting to look at too.


Thanks,
Alexey

PS I'd like to note that the issue of "buffer write error (status 
timeout)" may seriously affect on file systemы because this case MTD 
reports "a lie" to upper levels. MTD successfully writes data to flash 
but it reports that write error has occurred.
