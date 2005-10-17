Received: from protonic.xs4all.nl ([213.84.116.84] helo=protonic.prtnl)
	by pentafluge.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EROv0-0003Sb-Qx
	for linux-mtd@lists.infradead.org; Mon, 17 Oct 2005 07:56:55 +0100
Received: from localhost (localhost [127.0.0.1])
	by protonic.prtnl (Postfix) with ESMTP id EB90629EC6
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 Oct 2005 08:49:43 +0200 (CEST)
Received: from protonic.prtnl ([127.0.0.1])
	by localhost (protonic [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 12257-09 for <linux-mtd@lists.infradead.org>;
	Mon, 17 Oct 2005 08:49:42 +0200 (CEST)
Received: from linux.local (linux.prtnl [192.168.1.97])
	by protonic.prtnl (Postfix) with ESMTP id 99F7128067
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 Oct 2005 08:49:42 +0200 (CEST)
From: David Jander <david.jander@protonic.nl>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Disposition: inline
Date: Mon, 17 Oct 2005 08:51:14 +0200
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200510170851.14579.david.jander@protonic.nl>
Subject: jffs2 robustness against powerfailure
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,

We have a custom embedded linux board, based on a MPC852T processor, running 
2.4.25 kernel from denx. Jffs2 has certain backported patches after cvs from 
03/2005.
I wanted to try some stress-testing the flash using jffs2 and the "checkfs" 
tool which comes as part of the jffs2 sources. I setup a "power-cycle-box" as 
described in the README and started logging everything the system produced.
Since jffs2 claims to be robust against power-failures I set the threshold for 
maximum number of corrupt files allowed to 0. The test procedure rewrites all 
testfiles using a single write() call for each file, so that should be ok.
After 279 power-cycles, it stopped with a CRC error in "file13". Of course 
"file13" was the one being written to when power was cut off the last time.

Question: Is this a known shorcoming of jffs2, or must I assume that my 
hardware is broken?

The latter is relatively unlikely, once I try to explain the contents of the 
file:

diskles9:/flash # hexdump file13
0000000 0000 0300 0000 036d 0000 0942 0000 20b0
0000010 0000 08dd 0000 0715 0000 1da1 0000 043c
0000020 0000 05c2 0000 228d 0000 10ad 0000 1c35
...
00002e0 0000 14f1 0000 0d94 0000 1911 0000 12dd
00002f0 0000 09e9 0000 0686 0000 2380 0000 2294
0000300 0000 18f1 0000 01be 0000 25bb 0000 1af9
0000310 0000 1b94 0000 02b0 0000 2511 0000 1f79
0000320 0000 1f97 0000 0b53 0000 1eb7 0000 10bb
0000330 0000 2529 0000 2130 0000 0361 0000 0ff8
0000340 0000 1428 0000 10ab 0000 0364 0000 1b89
0000350 b110

As one can easily see, the first int (0x00000300) indicates the file-length, 
of 0x0300 bytes, after which the 16-bit CRC should be placed. At offset 
0000300 in the file there seems to be just more random data (a CRC of 0x0000 
is unlikely and known wrong in this case).
At the end of the file (offset 0x0000350) there is something that looks more 
like a checksum.
Apparently the previous file was 0x0352 bytes long and the new file was going 
to be 0x0302 bytes long, but was never written completely. 
How comes I get a to see a valid file containing a mix of old and new data if 
it was written with a single write() call?????
Shouldn't jffs2 throw away the new incomplete node and keep the old version of 
the file?

Can anyone please explain what happened here??

Greetings,

-- 
David Jander
