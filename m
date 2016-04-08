Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aoQmL-00025K-HL
 for linux-mtd@lists.infradead.org; Fri, 08 Apr 2016 07:24:30 +0000
Received: by mail-wm0-x22a.google.com with SMTP id f198so53106479wme.0
 for <linux-mtd@lists.infradead.org>; Fri, 08 Apr 2016 00:24:08 -0700 (PDT)
From: Arnaud Mouiche <arnaud.mouiche@invoxia.com>
To: Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 boris.brezillon@free-electrons.com, peterpansjtu@gmail.com
Cc: Arnaud Mouiche <arnaud.mouiche@invoxia.com>
Subject: [RFC] UBI torture test fails to detect some bad blocks.
Date: Fri,  8 Apr 2016 09:23:33 +0200
Message-Id: <1460100214-31298-1-git-send-email-arnaud.mouiche@invoxia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all.

Just some details about what I experience recently with some bad blocs on 
a MX35LF1GE4AB spinand device (SLC, 1Gb, 4bits ECC per 512 sub-page), 
where a UBI partition is attached to manage rootfs & co  (as usual).

I get the hand on some devices refusing to boot.
The analyse of the Erase Counters shows that some of them where erased 
more than 100K, while the majority have an EC below 20 !

Looking at the bad one, they run the following scenario nearly in loop:
- linux read some file inside the rootfs
- a bitflip is detected
- scrubbing is scheduled.
- the scrubbing target a PEB with a pretty high EC,
- this high EC is also due to frequent bitflip in the target PEB in the past.
- while the PEB data are moved, a bitflip is detected scheduling a torture test.
- the torture test *ALWAYS* pass (whereas bitflip are *VERY* frequent for 
  the same PEB when the read comes filesystem read).

So, it seems obvious the PEBs in question are bad PEBs.
The question is now why the torture test pass.

Reproducing the pattern test by hand on this block shows the same result.
But applying different patterns on different pages within the block shows that 
the content of some pages are affected by the content of the other pages.
In particularly, for this block, if the first page is full of FF and the rest 
of the block is full of 00, I can count  more than 100 bitflips (!)

What kind of pattern should be added to detect those kind of issues ?
We can think of testing every page one by one, but given the relatively large 
number of pages in a block, it doesn't sound realistic.
The easiest way could be to use a random pattern, and try it a relative low 
number of times.
Indeed, this simple random test is efficient to detect every bad block of this device.
If the random test pass once (because this is a random test), there are chances 
that the next bit flip detection will trigger a new torture test, and at the end, 
it will be finally detected as bad.

And the implementation is pretty obvious...

Arnaud


PS:
Yes, I know, spinand is not supported yet, but since there is a pending
effort for refactoring bbt & stuff for spinand inclusion, my driver implementation
is pretty meaningless. If somebody want a look, no problem... 
But my future role will be better to test and support various spinand devices since 
I own some samples from various manufacturers.



Arnaud Mouiche (1):
  UBI: harden torture_peb to miss less bad blocks.

 drivers/mtd/ubi/io.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

-- 
1.9.1
