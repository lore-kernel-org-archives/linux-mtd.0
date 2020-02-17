Return-Path: <SRS0=B4Yk=4F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E713C7619F
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 11:30:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FF36207FD
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 11:30:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lEM8ZVif"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FF36207FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aoR4yv8Aj8rbvF0nIn62Hs652SiuBBEKUzS275musSM=; b=lEM8ZVifNyCKfp
	dlbQ4LyjdGd2axzUlpxMjONM/e42i4KeJXyahDE2jXN2Lj4FxyzD1wlxuwMujBboXdaFpLKm7s9r5
	KMVO4dwaji1A46BC8wplhfKs+PofxBs2LnxcqwFldbtKNFST+sz9UKGF08nRcfdOw+MJHpsmxYWJn
	MzD0S16sYfbQoMUMN/HY1zHg454Gh1/XjEh87HCXdyoNJG8QfKAGL+f21EMi2kh5vJfU+IxUhhWE6
	cZX1rSPkdpLzNjjw/myuWH46a8CI8SpIoBYNTKNyhy3qjHYdHwKDQ6jmRGp+gh16M6c79sGNvogDk
	zlgKyi0v79HTorVF30Ng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3ebi-0007Hq-RV; Mon, 17 Feb 2020 11:30:34 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([146.101.78.151])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3ebf-0007FU-Vb
 for linux-mtd@lists.infradead.org; Mon, 17 Feb 2020 11:30:33 +0000
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-217-f6On0xLzP7ennhodhfUe9Q-1; Mon, 17 Feb 2020 11:30:18 +0000
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Mon, 17 Feb 2020 11:30:18 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Mon, 17 Feb 2020 11:30:18 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Schrempf Frieder' <frieder.schrempf@kontron.de>, Miquel Raynal
 <miquel.raynal@bootlin.com>
Subject: RE: [PATCH 3/3] mtd: spinand: Wait for the erase op to finish before
 writing a bad block marker
Thread-Topic: [PATCH 3/3] mtd: spinand: Wait for the erase op to finish before
 writing a bad block marker
Thread-Index: AQHV4PlTblnHiLQcV0asTsn4OWAZ0KgfKk6AgAALNICAABFVsA==
Date: Mon, 17 Feb 2020 11:30:18 +0000
Message-ID: <73f3002b3a5245dbbde064e1c0b1af92@AcuMS.aculab.com>
References: <20200211163452.25442-1-frieder.schrempf@kontron.de>
 <20200211163452.25442-4-frieder.schrempf@kontron.de>
 <20200217113919.0508acc4@xps13>
 <cbec4c2f-64f3-3353-b237-83345321d7a7@kontron.de>
In-Reply-To: <cbec4c2f-64f3-3353-b237-83345321d7a7@kontron.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: f6On0xLzP7ennhodhfUe9Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_033032_325829_E2119CA7 
X-CRM114-Status: GOOD (  18.25  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 liaoweixiong <liaoweixiong@allwinnertech.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jeff Kletsky <git-commits@allycomm.com>, Peter Pan <peterpandong@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Schrempf Frieder
> Sent: 17 February 2020 11:19
> > Schrempf Frieder <frieder.schrempf@kontron.de> wrote on Tue, 11 Feb
> > 2020 16:35:53 +0000:
> >
> >> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> >>
> >> Currently when marking a block, we use spinand_erase_op() to erase
> >> the block before writing the marker to the OOB area without waiting
> >> for the operation to succeed. This can lead to the marking failing
> >> silently and no bad block marker being written to the flash.
> >>
> >> To fix this we reuse the spinand_erase() function, that already does
> >> everything we need to do before actually writing the marker.
> >>
> >
> > Thanks a lot for this series!
> >
> > Yet I don't really understand the point of waiting for the erasure if
> > it failed: we don't really care as programming (1 -> 0) cells is always
> > possible. Are you sure this lead to an error?
> 
> We don't care about the result of the erase operation, but I think we
> still need to wait for it to be done and the STATUS_BUSY bit to be
> cleared. Otherwise it seems like the program operation to set the marker
> can get ignored by the chip. At least that's my explanation for the
> behavior I was observing.

Serial flash devices won't allow any accesses while an erase or write
in in progress.
So while you don't need to wait for either to finish, you do need
to remember that one is 'pending' and wait for it to finish
before any further accesses (apart from reads of the status register).

How many writes you can do to an area (that clear 1s) and the size
of the area will be device dependant.
IIRC one device I've used allows 2 writes to each 16bit word.
This allows either two separate byte writes or one write of
a 16bit (or 32bit) value followed by a second write of all 0s
the 'erase' the value without doing a erase-rewrite cycle.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
