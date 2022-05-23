Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2EAC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 23 May 2022 16:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fYdbLedt/7ke0svMyckyKxyIUaNqKlvCqNyFd8wKX0U=; b=gIVGxlSs8qc7uK
	JDesmj6/GzJJBRW8xdbaFy0uFBbwLN1xZ0TFiCvr8fHciAB7oujLL0gm7PKRrhcN7J7GRhCcCvG+m
	0wReQBflwedFjxhIztvndocC/ibpeciRI3f9cxp1M00NkjxzdC6xJeSzExc1hC1aR0Ej+Ra/+hwZK
	zAIM+M7E/Fjsbpgroy2GYhhofONQesabr6Hmszc0+sTqMfqSpc52S1bTh3jKDFB/mPFn0nalXBI8o
	GQoSFtVY27MaQsMtx85HBkCEWWJqXnLrNplsc4W8iwS4B9clpnLnm9KWN17KOQZayFP3E6gKK8s9w
	tRIUpWov7u1abg6m/gQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntAcc-0058IM-Lr; Mon, 23 May 2022 16:09:30 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntAcZ-0058Fq-6z
 for linux-mtd@lists.infradead.org; Mon, 23 May 2022 16:09:28 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-312-qy4YyiMNMmOP33diHOjiWA-1; Mon, 23 May 2022 17:09:21 +0100
X-MC-Unique: qy4YyiMNMmOP33diHOjiWA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.36; Mon, 23 May 2022 17:09:20 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.036; Mon, 23 May 2022 17:09:20 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Petr Malat' <oss@malat.biz>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Joern
 Engel" <joern@lazybastard.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: RE: [PATCH] mtd: phram: Map RAM using memremap instead of ioremap
Thread-Topic: [PATCH] mtd: phram: Map RAM using memremap instead of ioremap
Thread-Index: AQHYbrHUf5tSa7gm6kqFegI33HIF660si3RA///5tQCAABqkgA==
Date: Mon, 23 May 2022 16:09:20 +0000
Message-ID: <e33f91a3eacc4aa3a08e6465fef9265c@AcuMS.aculab.com>
References: <20220523142825.3144904-1-oss@malat.biz>
 <3cab9a7f4ed34ca0b742a62c2bdc3bce@AcuMS.aculab.com>
 <Youn9AmqY6/EExDw@ntb.petris.klfree.czf>
In-Reply-To: <Youn9AmqY6/EExDw@ntb.petris.klfree.czf>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_090927_560197_60D9D366 
X-CRM114-Status: GOOD (  16.27  )
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

From: Petr Malat
> Sent: 23 May 2022 16:28
> 
> Hi!
> 
> On Mon, May 23, 2022 at 02:51:41PM +0000, David Laight wrote:
> > From: Petr Malat
> > > Sent: 23 May 2022 15:28
> > >
> > > One can't use memcpy on memory obtained by ioremap, because IO memory
> > > may have different alignment and size access restriction than the system
> > > memory. Use memremap as phram driver operates on RAM.
> >
> > Does that actually help?
> > The memcpy() is still likely to issue unaligned accesses
> > that the hardware can't handle.
> 
> Yes, it solves the issue. Memcpy can cause unaligned access only on
> platforms, which can handle it. And on ARM64 it's handled only for
> RAM and not for a device memory (__pgprot(PROT_DEVICE_*)).

Does mapping it as memory cause it to be cached?
So the hardware only sees cache line reads (which are aligned)
and the cpu support for misaligned memory accesses then
stop the faults?

On x86 (which I know a lot more about) memcpy() has a nasty
habit of getting implemented as 'rep movsb' relying on the
cpu to speed it up.
But that doesn't happen for uncached addresses - so you get
very slow byte copies.
OTOH misaligned PCIe transfers generate TLP that have the
correct byte enables for the end words.
Provided the PCIe target isn't broken they are fine.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
