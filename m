Received: from protonic.xs4all.nl ([213.84.116.84] helo=protonic.prtnl)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EchvN-0006G5-JH
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2005 06:27:31 -0500
Received: from localhost (localhost [127.0.0.1])
	by protonic.prtnl (Postfix) with ESMTP id 6C9CF29EBB
	for <linux-mtd@lists.infradead.org>;
	Thu, 17 Nov 2005 12:25:48 +0100 (CET)
Received: from protonic.prtnl ([127.0.0.1])
	by localhost (protonic [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 28867-05 for <linux-mtd@lists.infradead.org>;
	Thu, 17 Nov 2005 12:25:47 +0100 (CET)
Received: from linux.local (linux.prtnl [192.168.1.97])
	by protonic.prtnl (Postfix) with ESMTP id D747428067
	for <linux-mtd@lists.infradead.org>;
	Thu, 17 Nov 2005 12:25:46 +0100 (CET)
From: David Jander <david.jander@protonic.nl>
To: MTD mailing list <linux-mtd@lists.infradead.org>
Date: Thu, 17 Nov 2005 13:27:20 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200511171227.20593.david.jander@protonic.nl>
Subject: Performance of wear-levelling in JFFS2.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,

I am wondering about how good wear-levelling really is in JFFS2. I have made 
an experiment which ended with a "MTD do_write_buffer(): software timeout", 
which really looks like flash is taking too long to write data because of it 
beeing near end of life. Only thing is, although the experiment has lasted 
quite long already (in terms of amount of data (re-)written), it doesn't seem 
anyway near as long as expected, when making some "educated guesses" about 
the perfomrance of jffs2. This is the experiment along with the results so 
far:

I have set-up a system as described in the README of the "checkfs" tool that 
is contained in mtd CVS source-code.
The system is a MPC852T based SBC with 32Mbyte of Spansion Mirror-bit flash in 
a single 16-bit-wide chip (S29GL256M11).
Power is yanked by a relais. Checkfs had to be fixed, because it was not 
big-endian compatible (trivial fix), filesize is 4...1024 bytes random, 100 
different files being constantly rewitten (one at a time).

Until now I have the following (hopefully interesting statistics) to share:

Number of reboots so far: 18490
Number of times there was 1 crc error in a file: 66
Number of times there was more than 1 crc error in a file: 0

Total number of times a file was rewritten: 13000000 (13 million).
Size of flash partition: 6 Mbyte, df showed 9% full at the end.

So, what am I thinking, to say the above:
File-data is random data, average file-size is around 500 bytes, add no 
compression (random data doesn't compress), some overhead (headers and stuff) 
and we get maybe some 600 bytes average of new data being written each time. 
Directory i-node also has to be re-written, so let's say for simplicity that 
its also around that amount of data. 
Concluding assumption so far: For every re-write, two chinks of 600 bytes each 
are added to the flash and two equally sized chunks are invalidated.

So, each eraseblock is 64k, that's around 109 such chunks per eraseblock. 
There are around 80 or so eraseblocks that can be shuffled around for 
wear-levelling, so if those are 100% optimally used (neglecting gc overhead) 
we can do 4360 file-rewrites before a single eraseblock is erased for the 
second time (that's 80*109/2)
Ok, so now 13000000/4360 = 2981, is the amount of times a given erase-block 
should have been re-written under this assumtion, and we already have 
worn-out blocks!

The datasheet says 100.000 erase-cycles typical. In practice, it can be less 
of course, but 2981 is rather far less IMHO.

I know my assumptions are pretty simplistic, but can anyone explain how the 
results I am getting are _that_ far off?

Btw: The experiment is continuing, and there are already showing off more such 
time-outs. This is how the part of the logfile looks like:

----------------------------[...] --------------------------
... Creating File:file65. MTD do_write_buffer(): software timeout
Write of 68 bytes at 0x0057603c failed. returned -5, retlen 0
Not marking the space at 0x0057603c as dirty because the flash driver returned 
retlen zero
MTD do_write_buffer(): software timeout
Write of 68 bytes at 0x0057603c failed. returned -5, retlen 0
Not marking the space at 0x0057603c as dirty because the flash driver returned 
retlen zero
Error: Unable to truncate file.: Input/output error
--------------------------[...]-----------------------------

Regards,

-- 
David Jander
Protonic Holland.
