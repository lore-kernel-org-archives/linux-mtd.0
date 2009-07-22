Received: from cluster-a.mailcontrol.com ([85.115.52.190])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MTWug-0005yx-4I
	for linux-mtd@lists.infradead.org; Wed, 22 Jul 2009 08:11:03 +0000
Received: from mailserver.mta.int (mail.mta.it [89.96.171.250])
	by rly02a.srv.mailcontrol.com (MailControl) with ESMTP id
	n6M8AsQH003356
	for <linux-mtd@lists.infradead.org>; Wed, 22 Jul 2009 09:10:55 +0100
From: Canella Matteo <Matteo.Canella@mta.it>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Wed, 22 Jul 2009 10:10:36 +0200
Subject: RE: UBI FS mounting time
Message-ID: <BD9F3F3F5A6CCF4BA032B9FED4DD312E5D09531F0B@mta-digimail.MTA.INT>
References: <531B6536C9F737458807DF75064873C8303DD7D768@mta-digimail.MTA.INT>
	<4A66B547.6020207@nokia.com>
In-Reply-To: <4A66B547.6020207@nokia.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Just to understand if we're doing things in the right way...
we need more than 6 secs to mount 1 GB Nand Flash.=20
Does this sound a normal timing?
This is the dmesg of the flash mounting:

[    6.694626] UBI: attaching mtd10 to ubi2
[    6.698594] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[    6.705712] UBI: logical eraseblock size:    126976 bytes
[    6.711154] UBI: smallest flash I/O unit:    2048
[    6.715894] UBI: sub-page size:              512
[    6.720533] UBI: VID header offset:          2048 (aligned 2048)
[    6.726564] UBI: data offset:                4096
[   12.802282] UBI: attached mtd10 to ubi2
[   12.806179] UBI: MTD device name:            "nand"
[   12.814531] UBI: MTD device size:            1024 MiB
[   12.820304] UBI: number of good PEBs:        8185
[   12.825069] UBI: number of bad PEBs:         7
[   12.829495] UBI: max. allowed volumes:       128
[   12.834144] UBI: wear-leveling threshold:    4096
[   12.838891] UBI: number of internal volumes: 1
[   12.843425] UBI: number of user volumes:     1
[   12.847860] UBI: available PEBs:             0
[   12.852325] UBI: total number of reserved PEBs: 8185
[   12.857340] UBI: number of PEBs reserved for bad PEB handling: 81
[   12.863479] UBI: max/mean erase counter: 6/3
[   12.867807] UBI: background thread "ubi_bgt2d" started, PID 911


Thank you
Regards

Matteo Canella=20
