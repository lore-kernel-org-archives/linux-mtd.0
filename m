Received: from mu-out-0910.google.com ([209.85.134.184])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IfVaq-0005Up-R7
	for linux-mtd@lists.infradead.org; Wed, 10 Oct 2007 08:03:00 +0100
Received: by mu-out-0910.google.com with SMTP id w1so137898mue
	for <linux-mtd@lists.infradead.org>;
	Wed, 10 Oct 2007 00:02:34 -0700 (PDT)
Message-ID: <5937bed10710100002u6cadab3eq620a13fd579dabf3@mail.gmail.com>
Date: Wed, 10 Oct 2007 17:02:34 +1000
From: "Matt Callow" <mc-lists@tesco.net>
Sender: matt.callow@gmail.com
To: linux-mtd@lists.infradead.org
Subject: oob data in DOC 2000
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I've been trying to get docboot to work on a DOC 2000 and I've been
having a few problems. I've followed the instructions in the docboot
README and I found the following:

1. nandwrite fails with segfault when -o is specified (without -a) . I
think I've found the problem an can supply a patch if required
2. docboot starts to boot the machine, but does not find the kernel
image. It looks like it's not finding the expected signature in the
oob data.
I did some searching and found that there was a problem with the free
oob bytes, but should now be fixed
(http://www.infradead.org/pipermail/linux-mtd/2005-April/012324.html)
I'm using kernel 2.6.18 and nandwrite from the latest git tree.
On further investigation, it looks like the oob data is not being
written to the DOC correctly.
Using diskonchip.ko with debug=1, I did the following:

flash_erase /dev/mtd1 32768
/home/matt/docboot/nandwrite -o -s 32768 /dev/mtd1 /home/matt/docboot/test

(where test is the first 528 bytes from the doc_spl image)

I get the following debug output:

...
Oct 10 16:53:15 musicplayer kernel: writebuf of 16 bytes: ff ff ff ff
ff ff 55 55 ff ff ff ff ff ff ff ff
...
Oct 10 16:53:15 musicplayer kernel: writebuf of 512 bytes: e9 fd 03 0e
1f be e7 01 e8 74 01 fc 0e 8e 1e b3
Oct 10 16:53:15 musicplayer kernel: writebuf of 6 bytes: 3d cf 3b e1 ae 5e
Oct 10 16:53:15 musicplayer kernel: writebuf of 10 bytes: ff ff ff ff
ff ff ff ff ff ff
...

So, this looks like:
a) writing OOB data from file
b) writing 512 bytes of data from file
c) updating OOB with ecc data

Now, when I read back the file I get:

# nanddump -l 512 -s 32768 -p  /dev/mtd1
ECC failed: 0
ECC corrected: 0
Number of bad blocks: 3
Number of bbt blocks: 0
Block size 16384, page size 512, OOB size 16
Dumping data starting at 0x00008000 and ending at 0x00008200...
0x00008000: e9 fd 03 0e 1f be e7 01 e8 74 01 fc 0e 8e 1e b3
0x00008010: 01 bb 00 10 c6 47 02 85 c6 47 02 85 b0 ff e8 3b
0x00008020: 01 1f 31 ff 31 d2 e8 d0 00 ff 0e 82 02 75 f7 53
0x00008030: be 7d 02 e8 49 01 06 1f 8b 36 0e 02 81 c6 00 02
0x00008040: e8 3c 01 0e 1f be e7 01 e8 34 01 5b 06 bf 00 80
0x00008050: e8 72 00 a1 86 02 09 06 84 02 74 19 88 0e d2 01
0x00008060: a1 b5 01 a2 d3 01 88 26 d6 01 53 be 07 02 e8 0e
0x00008070: 01 5b e8 50 00 be 26 02 e8 04 01 be 00 03 e8 fe
0x00008080: 00 be 73 02 e8 f8 00 66 a1 88 02 1f 66 09 06 1c
0x00008090: 02 74 07 2e a1 b5 01 a3 1a 02 0e 58 c1 e8 04 05
0x000080a0: 03 00 a3 29 02 c6 06 11 02 81 b8 ff ff a2 10 02
0x000080b0: a3 24 02 8c db 8e e3 8e eb 8e d3 89 c4 40 83 c3
0x000080c0: 20 53 50 fa cb e8 31 00 89 c7 0e 07 be b7 01 b9
0x000080d0: 00 01 b4 87 f9 cd 15 72 04 84 e4 74 0a 0e 1f be
0x000080e0: 3c 02 e8 9a 00 eb fe 83 06 d2 01 02 80 16 d6 01
0x000080f0: 00 ff 0e 84 02 75 ce c3 5f 53 b9 04 00 bb 01 00
...
  OOB Data: e9 fd 03 0e 1f be e7 01 e8 74 01 fc 0e 8e 1e b3

Now the OOB data has been overwritten with the 1st 16 bytes of real data.

Can anyone provide any clues at to what might be wrong?

Matt
