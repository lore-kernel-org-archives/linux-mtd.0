Received: from bulldog.adcon.at ([193.83.244.62] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ZtJp-0006o6-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 14:15:13 +0100
Received: from adcon.at (gca@aurora.adcon.at [193.83.244.110])
	by bulldog.adcon.at (8.8.7/8.8.7) with ESMTP id PAA06514
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 15:15:11 +0200
Message-ID: <3D47E2DE.F0D84D2F@adcon.at>
Date: Wed, 31 Jul 2002 15:15:10 +0200
From: Gerhard Chvatal <G.Chvatal@adcon.at>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: "Read-only file system" error while writing]
References: <20020731141035.B17800@penguin.adcon.at>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi!

Few months ago a had a similar problem.

gromit1463@mailworks.org said:
> [...]
> I have a set of STMicro flash chips (M28W320CT) that use the Intel
> Extended CFI command set (0001) [...]

The M28W320CT is not really 100% compatible with the Intel Chips.
There is a small difference in the state machine:

 As stated in the data sheet of the INTEL 28F320C3 "APPENDIX A, 
 WSM CURRENT/NEXT STATES" on page 40, the device will present the status
 when in "Lock Oper. (Done) state" (usually after sending 60H followed
by
 D0h to the command interface).

 The M28W320CB _does_not_ present the status - it presents the array
data
 when read in this state.

Unfortunately, the Linux MTD Driver (Kernel 2.4.0-rmk2-bluemug1) 
assumes to have the status available after UNLOCK Operation.
(around line: 1365-1379 in cfi_cmdset_0001.c:do_unlock_oneblock()).

After 

  [...]
  cfi_write(map, CMD(0x60), adr);
  cfi_write(map, CMD(0x01), adr);
  chip->state = FL_UNLOCKING;
  [...]

do a

  cfi_write(map, CMD(0x70), cmd_addr);

to switch the state machine to READ_STATUS mode. Real Intel Chips will
ignore this.

I have never changed this, because we are still using INTEL chips in our
design, but if it works, it would be nice to have a feedback.

Gerhard
-- 
ADCON TELEMETRY AG    ( ( (  /|\  ) ) )   Smart Wireless Solutions
Inkustraﬂe 24, A-3400 Klosterneuburg
Tel:+43 (0)2243 38280-0
Fax:+43 (0)2243 38280-6
