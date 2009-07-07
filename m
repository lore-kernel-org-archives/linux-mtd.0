Received: from cluster-g.mailcontrol.com ([208.87.233.190])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MO9Tf-0007Ms-Sp
	for linux-mtd@lists.infradead.org; Tue, 07 Jul 2009 12:08:58 +0000
Received: from rly23g.srv.mailcontrol.com (localhost.localdomain [127.0.0.1])
	by rly23g.srv.mailcontrol.com (MailControl) with ESMTP id
	n67C8j2F011125
	for <linux-mtd@lists.infradead.org>; Tue, 7 Jul 2009 13:08:49 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by rly23g.srv.mailcontrol.com (MailControl) id n67C8dq9010085
	for <linux-mtd@lists.infradead.org>; Tue, 7 Jul 2009 13:08:39 +0100
Subject: Re: ubiattach problem
From: Oren <oren_s3@VERIFONE.com>
To: dedekind@infradead.org
In-Reply-To: <1246963327.20721.306.camel@localhost.localdomain>
References: <baa101c9fe67$d7b31f0a$b65b1ec0@verifone.com>
	<1246947926.20721.299.camel@localhost.localdomain>
	<1246962761.1775.7.camel@tlvorens3lnx>
	<1246963327.20721.306.camel@localhost.localdomain>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Tue, 7 Jul 2009 15:08:35 +0300
Message-ID: <1246968515.2208.4.camel@tlvorens3lnx>
MIME-Version: 1.0
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mkfs.ubifs/mkfs.ubifs -r ~/BRCMLinux/Linux_2_6_27/mtd-utils/myrfs
--compr="none" -m 2048 -e 129024 -c 2047 -o images/ubifs_ncomp.img
ubi-utils/ubinize -o images/ubi_ncomp.img -m 2048 -p 128KiB -s 2048
images/ubinize.cfg


ubinize.cfg:

[ubifs]
mode=ubi
image=images/ubifs_ncomp.img
vol_id=0
vol_size=16MiB
vol_type=dynamic
vol_name=rootfs
vol_flags=autoresize


On Tue, 2009-07-07 at 13:42 +0300, Artem Bityutskiy wrote:
> On Tue, 2009-07-07 at 13:32 +0300, Oren wrote:
> > ubiformat /dev/mtd0 -s 2048 -f ubi_ncomp.img
> > ubiformat: mtd0 (nand), size 16777216 bytes (16.0 MiB), 128 eraseblocks of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
> 
> Err, wait, you flash an image. Then the image propbably
> does not have the volume table. How do you generate the
> image?
> 
