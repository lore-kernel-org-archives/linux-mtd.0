Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97653EB64DD
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Aug 2023 08:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e8sk6FhFlW4ZzSsN/0NZqHZX+y5GWmjt1D6D5x9QLtU=; b=DqWJOoyO1LNSpy
	y4ZV5Nftf96TDMDfZTrVpl8QxooEWS/O6AZubgnefXQYISS3Xtc3MsbO4ylCIUd4ShVJaAqsNpRFj
	TsOHceHUGDmxQdBJuSvF97ke4huu8jZ9NmLRm9p52p3cHZSkorfFSwAw62mGSNxR/7OeTMk80yMZr
	l6BAfeXvemxbV9MZtS1c1eatlJCxohxKwQAsGtaqCmg8mJyQXUcP8hKhw0+nNGKwrlTX2fDh0wLcR
	6lOxV4T61uQQp8IkU6Co/6GRdpQeuDddOFnUdyMJAjmdh3mHKU+dpKJE21OTuKgMk53syOYKurCD7
	vhc2Ox3aL4bT+g0tVXXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUNdC-009rkP-1k;
	Fri, 11 Aug 2023 08:36:26 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qUNd8-009rjw-26;
	Fri, 11 Aug 2023 08:36:22 +0000
Date: Fri, 11 Aug 2023 01:36:22 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: Christoph Hellwig <hch@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Stephan Wurm <stephan.wurm@a-eberle.de>,
	stable <stable@vger.kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Oliver Neukum <oliver@neukum.org>, Ali Akcaagac <aliakc@web.de>,
	Jamie Lenehan <lenehan@twibble.org>,
	James Bottomley <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-scsi <linux-scsi@vger.kernel.org>
Subject: Re: [PATCH 1/7] ubi: block: Refactor sg list processing for highmem
Message-ID: <ZNXzBnDLQzT7FT5s@infradead.org>
References: <20230810160019.16977-1-richard@nod.at>
 <20230810160019.16977-2-richard@nod.at>
 <ZNUK8nWnUYB6B4Kg@infradead.org>
 <298860961.5257332.1691684136772.JavaMail.zimbra@nod.at>
 <ZNUOjQVivR/5pFKE@infradead.org>
 <164102534.5258032.1691697286622.JavaMail.zimbra@nod.at>
 <ZNXtdpUbhj7mVu11@infradead.org>
 <156807159.5281174.1691742892935.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <156807159.5281174.1691742892935.JavaMail.zimbra@nod.at>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Aug 11, 2023 at 10:34:52AM +0200, Richard Weinberger wrote:
> ----- Urspr=FCngliche Mail -----
> > Von: "Christoph Hellwig" <hch@infradead.org>
> > On Thu, Aug 10, 2023 at 09:54:46PM +0200, Richard Weinberger wrote:
> >> > But why add the bounce buffering first if you can avoid it from the
> >> > very beginning by just using kmap_local instead of adding a new
> >> > caller for the deprecate kmap_atomic?
> >> =

> >> Because I want this fix also in all stable trees. kmap_local() is rath=
er
> >> new. When back porting patch 1/7, bounce buffers and kmap_atomic()
> >> are needed anyway.
> >> By doing this in patch 1/7 I avoid backport troubles and keep the
> >> delta between upstream and stable trees minimal.
> > =

> > Just use plain kmap for the historic backports.
> =

> Hm, yes. For UBIblock kmap should be too expensive.

?  kmap is a no-op for !highmem.  And it will always be way cheaper
than bounce buffering for the case where you are actually fed highmem
pages.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
