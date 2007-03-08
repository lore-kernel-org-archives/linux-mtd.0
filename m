Received: from mx.dave-tech.it ([85.38.203.46])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HPFFF-0000ZG-6w
	for linux-mtd@lists.infradead.org; Thu, 08 Mar 2007 04:49:29 -0500
Message-ID: <45EFDC0D.4090409@dave-tech.it>
Date: Thu, 08 Mar 2007 10:49:01 +0100
From: R&D4 <r&d4@dave-tech.it>
MIME-Version: 1.0
To: mtd_mailinglist <linux-mtd@lists.infradead.org>
Subject: JFFS2 as transactional FS (in other words: how to be sure that data
	have been writtent correctly from userspace)
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi all MTD developers,

we are currently using an MTD partition on a NAND device, of course with
JFFS2 on it ;-) , for transaction logging purpose.
This transacion is mission critical and we cannot afford to lose data
(or, even worse, have corrupted data!)

For this reason we also use a battery-backed SRAM as temporary storage
for the transaction state machine. After the transacion has been
completed we flush the content of the SRAM to a file and (after the
written is completed) we can overwrite the temporary storage with new data.
Of course the machine can be interrupted in any moment without notice
(e.g. watchdog, power failure). Only the content of the SRAM is
guaranteed to be valid at any time.

The "main" problem, of course, is to know "when" we can say "ok the data
has been _completely_ written to the final storage".

By reading back on this mailing list, "goooogling" on internet and
reading JFFS2 FAQ
(http://www.linux-mtd.infradead.org/faq/jffs2.html#L_writewell) I think
I have found some kind of solution (I'm currently running some test on
it) depending on the storage medium (NOR vs NAND):

- on *NOR*: in our understanding, we can just use a simple fwrite()
followed by fsync() or sync(). After the sync() return the control to
the user's program, we can be sure that the data has been written on the
device. So

file = fopen(file_on_jffs2_nor)
while(isneeded) {
	while (space_available(SRAM)) {
		fill(SRAM);
	}

	fread(buffer, SRAM);
	fwrite(buffer, file);
	fsync(file);
	invalidate_SDRAM();
}
fclose(file)

(Of course I have intetionally omitted the code for resuming from a warm
reset.)

QUESTION: Is this pseudo code correct? Is fsync() needed? (O_SYNC is not
supported by JFFS2, AFAIK) or data has been _completely_ written right
before the fwrite() return (so no sync() required)?


- on *NAND*: things are a bit tricky ;-). Even if you call fsync() data
may not have been written to storage, due the fact that "it's better to
fill a NAND page before commit"
For this reason only after "a while" the (dirty) page is written to
storage even if it's not full. In the FAQ you say that this "a while" is
controlled by the standard kernel vm functions by setting
/proc/sys/vm/dirty_writeback_centisecs.

By reading this I think about use this code:

at system startup:
`echo smallvalue > /proc/sys/vm/dirty_writeback_centisecs`

file = fopen(file_on_jffs2_nand)
while(isneeded) {
	while (space_available(SRAM)) {
		fill(SRAM);
	}

	fread(buffer, SRAM);
	fwrite(buffer, file);
	fsync(file);
	sleep(smallvalue+anothervalue)
	invalidate_SDRAM();
}
fclose(file)

'smallvalue' should be something less that the standard 5 secs but
something that will not waste to much CPU or NAND storage (by using
not-completely-filled pages, correct me if I'm wrong about this point).
I was thinking about 500 millis.

'anothervalue' should be something '>>smallvalue' and it should be used
(IMHO) because Linux is not an RTOS, so timing are not tightly guaranteed.

Is this approach correct or the something better that can be done??

Of course you can still flush buffers and dirty pages but umounting the
partition but.. this is too long for our needs

BTW I have seen, in my current test, that, without the sleep(), sometime
my  "last" data is not written correctly.

Hope this (long ;-) ) email can lead to a useful discussion about this
problem! :-)

Best Regards,

Andrea
