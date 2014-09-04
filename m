Received: from mail-wi0-x229.google.com ([2a00:1450:400c:c05::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XPVyu-0004gp-Ow
 for linux-mtd@lists.infradead.org; Thu, 04 Sep 2014 12:17:41 +0000
Received: by mail-wi0-f169.google.com with SMTP id n3so7453166wiv.2
 for <linux-mtd@lists.infradead.org>; Thu, 04 Sep 2014 05:17:16 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 4 Sep 2014 20:17:16 +0800
Message-ID: <CAOx4H9BopH3F5xwmQ-B5AckTS65SUss_mxjWi2N6ibXovnm61g@mail.gmail.com>
Subject: Question about ubiformat and how to better use UBIFS
From: t kevin <kevint324@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi ,

Currently I'm trying to create ubifs for rootfs on my device which has
a Nand flash on board.

Right now I know two approaches to do that.
1. On host,mkfs.ubifs+ubinize to generate one ubi.img. On target
board, ubiformat -f ubi.img on the MTD device, ubiattach then mount
and it's done.
or
2. On host, just tar -cz rootfs to generate root.tgz. On target board,
(for the first time)ubiformat the mtd device, ubiattach,ubimkvol, then
mount ubifs. Then untar the root.tgz to the mounted ubi volume.

Eventually the mountpoint should contain same files.

So here are my questions.
1. (Generally speaking) Which one is better? I know ubiformat is going
to erase every PEB  so right now I prefer the second approach since I
don't have to do ubiformat everytime. It sounds like the erase counter
grows slower.

2. I'm working on an embedded device which has limited CPU power so
I'd like to use compressed_method=none. It can be done by passing -x
none to mkfs.ubifs. But I don't see similar option in ubiformat or
ubimkvol. So when I go to the 2nd approach the mounted rootfs is
always compressed.
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_comproff
This method is not helping much. I want to disable compression on the
entire fs, just like mkfs.ubifs -x none did.

Thank you for your time
Kevin
