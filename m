Received: from cluster-h.mailcontrol.com ([208.87.234.190])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MOAcM-0005EO-Sy
	for linux-mtd@lists.infradead.org; Tue, 07 Jul 2009 13:22:01 +0000
Received: from rly31h.srv.mailcontrol.com (localhost.localdomain [127.0.0.1])
	by rly31h.srv.mailcontrol.com (MailControl) with ESMTP id
	n67DLqTv023995
	for <linux-mtd@lists.infradead.org>; Tue, 7 Jul 2009 14:21:53 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by rly31h.srv.mailcontrol.com (MailControl) id n67DLc32021809
	for <linux-mtd@lists.infradead.org>; Tue, 7 Jul 2009 14:21:38 +0100
Subject: Re: ubiattach problem
From: Oren <oren_s3@VERIFONE.com>
To: dedekind@infradead.org
In-Reply-To: <1246971115.20721.308.camel@localhost.localdomain>
References: <baa101c9fe67$d7b31f0a$b65b1ec0@verifone.com>
	<1246947926.20721.299.camel@localhost.localdomain>
	<1246962761.1775.7.camel@tlvorens3lnx>
	<1246963327.20721.306.camel@localhost.localdomain>
	<1246968515.2208.4.camel@tlvorens3lnx>
	<1246971115.20721.308.camel@localhost.localdomain>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Tue, 7 Jul 2009 16:21:32 +0300
Message-ID: <1246972892.2208.5.camel@tlvorens3lnx>
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

ubinize: LEB size:      126976
ubinize: PEB size:      131072
ubinize: min. I/O size: 2048
ubinize: sub-page size: 2048
ubinize: VID offset:    2048
ubinize: data offset:   4096
ubinize: loaded the ini-file "images/ubinize.cfg"
ubinize: count of sections: 1

ubinize: parsing section "ubifs"
ubinize: mode=ubi, keep parsing
ubinize: volume type: dynamic
ubinize: volume ID: 0
ubinize: volume size: 16777216 bytes
ubinize: volume name: NAND-block1
ubinize: volume alignment: 1
ubinize: autoresize flags found
ubinize: adding volume 0
ubinize: writing volume 0
ubinize: image file: images/ubifs_ncomp.img

ubinize: writing layout volume
ubinize: done

On Tue, 2009-07-07 at 15:51 +0300, Artem Bityutskiy wrote:
> On Tue, 2009-07-07 at 15:08 +0300, Oren wrote:
> > mkfs.ubifs/mkfs.ubifs -r ~/BRCMLinux/Linux_2_6_27/mtd-utils/myrfs
> > --compr="none" -m 2048 -e 129024 -c 2047 -o images/ubifs_ncomp.img
> > ubi-utils/ubinize -o images/ubi_ncomp.img -m 2048 -p 128KiB -s 2048
> > images/ubinize.cfg
> > 
> > 
> > ubinize.cfg:
> > 
> > [ubifs]
> > mode=ubi
> > image=images/ubifs_ncomp.img
> > vol_id=0
> > vol_size=16MiB
> > vol_type=dynamic
> > vol_name=rootfs
> > vol_flags=autoresize
> > 
> 
> Can you add -v to ubinize and see if there is a
> "writing layout volume" print?
> 
