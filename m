Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93185C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 08:37:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64DC060F42
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 08:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 64DC060F42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W2UE46fRAacZzAVlNpsrWop0Hh2c1r1ucG7Ij12gRmM=; b=ldXq+Vnz9KM2PV
	ldcYNf1HsFWZLdCmoEq/+rYNtedr1+gfYk/Wp7LoagRdyNXUb/xqzXT5CJjRKpGWUslAnXB5/XuMA
	RR7GdmbD5rs9mnZskeGIu8v+y573GFpLXCbvwl5MGnh+3ED5WoES5freFKMKFVdVIDVPdP8ASXhZ7
	Gi1jPiaEwciSBv+KZgnJxPZ+gb7jDLzQn8X21TGLvceBmHQzvXLgFVc3hc7+Zfsv+dkIJYVJT6kZ1
	E+47DgNSEtfz5T+ri+x/iZHO5TXyHIRCEVkbyc//dg7LHDDpHhNUryXhQibMicyT2hXBF9v9wuJU2
	cb2xY3QEVV4o9KWroHiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlS2q-009iXF-OQ; Fri, 12 Nov 2021 08:36:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlS0F-009hZ5-Fh; Fri, 12 Nov 2021 08:33:46 +0000
X-UUID: af315736b6704b5bb60ae2365aec0476-20211112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=kBQAZvjV8W8WyMKflvU3tesC8meeJTEyIZ40hgjJ0qs=; 
 b=pe1/3Q1fGin8Hiq54e3SBImsflVCGI0rcCvOge7rctHXjIj00NpqNFOYDmoiwKBwvEqrKr7wAtCMQZ5J6YbCqxjeUA67Od1qpzqWgB9/ebS/FFLIcyEpHK52QXqHFCjK9DwbhzA4c5rj77IWRhaniESIpU9vBVmtoImCJ+UE0aM=;
X-UUID: af315736b6704b5bb60ae2365aec0476-20211112
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xiangsheng.hou@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1445289391; Fri, 12 Nov 2021 01:33:38 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Nov 2021 00:33:36 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 12 Nov 2021 16:33:35 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 12 Nov 2021 16:33:34 +0800
Message-ID: <4e23bb7db6b3868531752efe644833f5817e9660.camel@mediatek.com>
Subject: Re: [RFC,v3 5/5] mtd: spinand: skip set/get oob data bytes when
 interleaved case
From: xiangsheng.hou <xiangsheng.hou@mediatek.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <broonie@kernel.org>, <benliang.zhao@mediatek.com>,
 <dandan.he@mediatek.com>, <guochun.mao@mediatek.com>,
 <bin.zhang@mediatek.com>, <sanny.chen@mediatek.com>,
 <mao.zhong@mediatek.com>, <yingjoe.chen@mediatek.com>, <donghunt@amazon.com>, 
 <rdlee@amazon.com>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Date: Fri, 12 Nov 2021 16:33:34 +0800
In-Reply-To: <20211109130518.70db0d5d@xps13>
References: <20211022024021.14665-1-xiangsheng.hou@mediatek.com>
 <20211022024021.14665-6-xiangsheng.hou@mediatek.com>
 <20211109130518.70db0d5d@xps13>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_003344_998006_2ABBDF55 
X-CRM114-Status: GOOD (  29.98  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

Firstly, I would like to introduce Mediatek HW ECC engine how it
organize the whole nand page data.

Take page size 2KB and OOB size 64B for example,

nand page standard data format:
+---------------------------+------------+
|                           |            |
|        main area          |  oob area  |
|                           |            |
+---------------------------+------------+

Mediatek HW ECC pipelined data format(sector size 1KB):
+------------+-------+-----------+-------+
|            |       |           |       |
|  sector(0) | oob(0)|  sector(1)| oob(1)|
|            |       |           |       |
+------------+-------+-----------+-------+

Mediatek HW ECC engine organize data as sector in unit.
The sector size can be 512 or 1024 bytes.
The OOB free and ecc bytes are stored right after the sector(n)
main data.

oob(n) layout:
+-------+---------+-----------+
|       |         |           |
| part1 |  part2  |   part3   |
|       |         |           |
+-------+---------+-----------+
part1: OOB bytes will be protected by ecc engine which called FDM ECC
part2: OOB bytes not be protected by ecc engine
part3: OOB bytes to store ecc parity for (sector data + FDM ECC bytes)

part1 and part2 called FDM(flash disk manage data) which can be used to
store BBM or filesystem manage data(like jffs2).

The FDM and FDM ECC can be configurable,
FDM number of bytes: 0 ~ 8 bytes
FDM ECC number of byte: 0 ~ FDM size 

Therefore, the mtk ecc driver need to handle BBM swap and OOB shift
operation before/after the write/read operation in
ecc_finish/prepare_io_req.

1. Why need BBM swap operation in mtk ecc driver?

Ensure the BBM poisition consistent with nand specification.

           main area           oob area
+---------------------------+------------+
|                           |
            |
|                           |*           |
|               
            |            |
+---------------------------+------------+

   sector(0)   oob(0)   sector(1)   oob(1)
+------------+-------+-----------+-------+
|            |       |           |       |
|            |       |       #   |       |
|            |       |           |       |
+------------+-------+-----------+-------+

(*): stand for the BBM
(#): stand for one byte main data

For the 2KB + 64B page case, the standard BBM position will be main
data in Mediatek HW ECC data format. Therefore, the BBM swap between
the BBM with one bye main data in sector(1).

The data struct when BBM swap:

   sector(0)   oob(0)   sector(1)   oob(1)
+------------+-------+-----------+-------+
|            |       |       
    |       |
|            |       |       *   |#      |
|            |  
     |           |       |
+------------+-------+-----------+-------+

2. Why need OOB shift opration in mtk ecc driver?

Since the BBM located at oob(1) 1st byte in mtk ecc data format, the
standard BBM position need at the 1st in the whole OOB area logically.

Just take the data flow in prepare_io_req when write
with MTD_OPS_AUTO_OOB for example:

source:      data buf           oob buf
+---------------------------+------------+
|                           |
            |
|                           |            |
|               
            |            |
+---------------------------+------------+

1st: mtd_ooblayout_set_databytes
        data buf              oob buf
+---------------------------+------------+
|                           |
            |
|                           |*@@@@@@     |
|               
            |            |
+---------------------------+------------+
(*): BBM, is reserve byte when set databyte
(@): the free OOB data byte

2nd: BBM swap

           data buf            oob buf
    sector(0)    sector(1)
+---------------------------+------------+
|             |             |
            |
|             |       *     |#@@@@@@     |
|             | 
            |            |
+---------------------------+------------+
(#): stand for one byte main data
(*): stand for the BBM

3rd: sector OOB shift

           data buf            oob buf
    sector(0)    sector(1)   oob(1) oob(0)
+---------------------------+------------+
|             |             |
      |     |
|             |       *     |@@@   |#@@  |
|             | 
            |      |     |
+---------------------------+------------+

The mtk ECC engine will auto place the data struct on flash
as bellow finally.

   sector(0)   oob(1)   sector(1)   oob(0)
+------------+-------+-----------+-------+
|            |       |       
    |       |
|            |@@@    |       *   |#@@    |
|            |  
     |           |       |
+------------+-------+-----------+-------+

The read data flow in finish_io_req is reverse with prepare_io_req when
write.

On Tue, 2021-11-09 at 13:05 +0100, Miquel Raynal wrote:
> Hi Xiangsheng,
> 
> Has we discussed a while ago:
> 
> 	...it is possible that I did not test with MTD_OPS_AUTO_OOB
> 	recently and indeed the ECC bytes will missing in this case. In
> 	the write path, maybe the ->prepare_io hooks should spread the
> 	user data following req->mode in req.oobbuf before computing
> 	the codes. Similar logic should be applied to the read path.
> 
> Can you please add a patch for this situation in your next iteration?
> It does not look like this situation has been handled.
> 

As talked above, I may put the set/get OOB data bytes to each ecc
driver not at the spinand driver.

This may have some advantage:
1) Some ECC engine may protect the OOB bytes not only the main data.
They will have same issue when read/write with MTD_OPS_AUTO_OOB.
For this case, the OOB data bytes must set/get in
prepare/finish_io_req.

2) For the syndrome layout, the data format on the flash may not be
consistent with nand specification. It`s better handled by the special
ecc engine.

Can you agree with this modification?
And, I will work on this and send in next iteration.

> xiangsheng.hou@mediatek.com wrote on Fri, 22 Oct 2021 10:40:21 +0800:
> 
> > For syndrome layout, ECC/free byte in oob layout and main
> > data are interleaved. For this case, it is better to set/get
> > oob data bytes in ECC engine.
> 
> I don't understand the last sentence

Just as the discussion talked above.

> > 
> > For MTK ECC engine, although it can auto place data as sector +
> > oob free + oob ecc for one page in pipelined. However, the bad
> > mark will be not fit with nand spec. Therefore, there have bad
> > mark swap operation in ecc engine.
> > 
> > But, the swap opeation(between bbm 0xff with 1byte main data) will
> > lead to more one byte than oobavailable.
> 
> Sorry but again, I don't understand what you mean.
> 

           data buf            oob buf
+---------------------------+------------+
|             |             |
            |
|             |       *     |#@@@@@@     |
|             | 
            |            |
+---------------------------+------------+
(#): stand for one byte main data
(*): stand for the BBM
(@): the free OOB data byte

Take write ooblen is mtd->oobavail for example,
the data in standard OOB area will be one more main data byte, due to
the BBM swap operation, lead to the expected OOB len as
(mtd->oobavail + 1). This is not as expected for one page.

> > Set oob databytes after
> > bad mark swap will lead to lost one oob free byte.
> 
> We don't care about free OOB bytes really.
> 

The MTD_OPS_AUTO_OOB need handle the free OOB bytes. Some filesystem
(like jffs2) also need store data at free OOB for management.

> > 
> > Therefore, just try to modify the spi nand framework for review.
> > And this may be common for the interleaved case.
> 
> I don't get how falling back to a memcpy will solve your problem? Can
> you please provide an anscii figure or something more visual to let
> us
> understand?

As talked above, the BBM swap and OOB shift handled at mtk ecc driver.
And the mtk controller will auto place data as mtk ECC data format in
pipelined.

Thanks
Xiangsheng Hou





______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
