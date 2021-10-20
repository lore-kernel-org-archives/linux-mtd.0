Return-Path: <SRS0=lu4o=PI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70E60C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 09:03:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41826610D0
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 09:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 41826610D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gMHCGrtL5TqbnfUFsT/43cdNpOERJYcN9wWjdM9JyNM=; b=Cl+6gxlCKiR63D
	ZF1gZhfUQme8+JzBARJhIXwjnRVJDdqaAinhuwoBhpp80YLFmGIlNz3ZXrm3c7Mw8kDb8WnZTitrJ
	0TL/XDWlVgZ+kVuCF4J3raBEN5wvVxOmQi+yveo7zop2E3aTQ0kmbuib7Nu2IsAdr9tkAnmEgSKzg
	9GykUZnH4MB+78DQ6bY3vvOyMfcTIQcid4YCeyrjZZmSM3sIE5HkXJw1sA7tCrVQPNNhBTqGCNMjD
	Y0CCc48cQjHr3BufeJvfqj6uCADK/d6846YwMquEO089jAPW88CRp5OV2G5EUTrlesNGsc5WGjCh0
	CIX7X1D0wuisrQtJ5uYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md7V8-003vJ8-Ak; Wed, 20 Oct 2021 09:03:10 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md7V6-003vIW-1s
 for linux-mtd@lists.infradead.org; Wed, 20 Oct 2021 09:03:09 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8F0421F43F56;
 Wed, 20 Oct 2021 10:03:06 +0100 (BST)
Date: Wed, 20 Oct 2021 11:03:03 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] mtd: rawnand: nand_bbt: hide suspend/resume
 hooks while scanning bbt
Message-ID: <20211020110303.6f21c057@collabora.com>
In-Reply-To: <20211020090132.zuxojg6cnwsm4dwg@skn-laptop>
References: <20211020084534.2472305-1-sean@geanix.com>
 <20211020084534.2472305-2-sean@geanix.com>
 <20211020105326.0dca864a@collabora.com>
 <20211020090132.zuxojg6cnwsm4dwg@skn-laptop>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_020308_259105_E9D84915 
X-CRM114-Status: GOOD (  16.08  )
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

On Wed, 20 Oct 2021 11:01:32 +0200
Sean Nyekjaer <sean@geanix.com> wrote:

> On Wed, Oct 20, 2021 at 10:53:26AM +0200, Boris Brezillon wrote:
> > On Wed, 20 Oct 2021 10:45:31 +0200
> > Sean Nyekjaer <sean@geanix.com> wrote:
> >   
> > > From: Boris Brezillon <boris.brezillon@collabora.com>
> > > 
> > > The BBT scan logic use the MTD helpers before the MTD layer had a
> > > chance to initialize the device, and that leads to issues when
> > > accessing the uninitialized suspend lock. Let's temporarily set the
> > > suspend/resume hooks to NULL to skip the lock acquire/release step.
> > > 
> > > Fixes: 013e6292aaf5 ("mtd: rawnand: Simplify the locking")
> > > Tested-by: Sean Nyekjaer <sean@geanix.com>  
> > 
> > It's missing our Signed-off-by tags.
> >   
> 
> Patch is from you ;)
> If you are okay with it, I will add your Signed-off-by tag.

You should add both (mine and yours).


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
