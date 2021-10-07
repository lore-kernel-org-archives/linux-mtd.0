Return-Path: <SRS0=3zw0=O3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CFA0C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 07:19:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD5A56101E
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 07:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BD5A56101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kOzX7IUUXfxhOT4w35S8UlCX+qInqn1X/2sQz5zy2wI=; b=ZQF7D+ZgUnvdnI
	XkqV7zGa/VCIF+CHwIdXnirxA7vIqDs9+pt6zHV+rlCBEfq/rizYxH1T5dzTUf1ZFLzYlEEHRyRda
	FEcI/lspEw7ShIXKZAGmj+eyMdYFMdk5OPURaZMQMo6ztraHwmaJqj1lHBUh7S1PlLHLLCniFQ4iK
	1Q+oeFXH9shzm0UnuHaoai0ILAqflbd7p+swEFVIHPV3qb8WE1PfMQtlgXe05ihRq2GHbFUn1/er9
	N4Bryr1HPFLJLDgMZZlVtCGv8VvlTZnOfN2YSGRLnKdZnNHdpb5rthMYfXdCAOY/D34GQtJnZckS/
	gXNw8D7f2Bfr643MN39A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYNfn-00GP5o-5M; Thu, 07 Oct 2021 07:18:35 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYNfk-00GP4y-LK
 for linux-mtd@lists.infradead.org; Thu, 07 Oct 2021 07:18:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1633591112; x=1665127112;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uScYYFUX8iG0TWB1RqIb8XXKjjNY6/uZlWQo8MkDwlo=;
 b=aHMnbusEAZcWo2y63iCsQvF4kqkOb7jI9G+KHcOISx4Tgv+pKlQ8vEXc
 D9FDojM+9uAsNBqEPQZf2DLEfbFK05UMC7m1DY/nJJ9AJSrW5qxpu2Wvp
 +jA+30Qf96Yr////K6RUPCH2daJIORI/2cpk+q3J7wpkaIcn1KdxYk7gP
 tMe4L9VBnRQBZ0dD1WJ1ZpEeSS4CNnxEIPNDiOXwb8UsdfY/3ZP2hLX68
 LT2/FqyfZvK5Y38uoX/RvSl+Frrwygue05k62bdW6Hdm2LOTrF0a8xN5V
 pFQH1nOQbHeOqOGliX6JTfD8lWKTRGxtZ8tyDu177W7sR7jY8aXvO9U1q A==;
X-IronPort-AV: E=Sophos;i="5.85,354,1624312800"; d="scan'208";a="19910223"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 07 Oct 2021 09:18:25 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 07 Oct 2021 09:18:25 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 07 Oct 2021 09:18:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1633591105; x=1665127105;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uScYYFUX8iG0TWB1RqIb8XXKjjNY6/uZlWQo8MkDwlo=;
 b=SZ5F1wclGGxBTyZbeYQbiYWKd7FJHY3Mi/0iF6o3P5EjVnNLR7H3I3x/
 doL0zsLtsJpJYnourchCsFxOh7Vu7h8doPNXkn25DHXe7zv//rO9+Xy9b
 B1pWnd5y5OcRANs0jsyDnUi87D47DlFwpyY2gJZ5fBjj8zqYtdNfbG1H2
 8lkdSe9lUB5Yfwb+RHkhYpphDxUskhXPIYPYbwSKWfqJhqzcYA3HXjHlo
 5SECyST0JbydlQh4UYDN5JzEJxS2ptaP+Je5PYHi0r8KYY++aJH1GbMqq
 4oYfvwASbiC8oMGqIxTiNY9Xcl93nic7EDArYWSKjTy5CbseDjGuhbv0y g==;
X-IronPort-AV: E=Sophos;i="5.85,354,1624312800"; d="scan'208";a="19910222"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 07 Oct 2021 09:18:25 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
 [10.121.48.12])
 by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 02C4B280065;
 Thu,  7 Oct 2021 09:18:24 +0200 (CEST)
Message-ID: <0e2ad27b00d85c1dfa489d91b54d2a3af41f5edb.camel@ew.tq-group.com>
Subject: Re: (EXT) Re: (EXT) Re: [PATCH 1/2] mtd: spi-nor: micron-st: sync
 flags of mt25ql02g and mt25qu02g with other mt25q
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>,  Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 07 Oct 2021 09:18:22 +0200
In-Reply-To: <969e9169b77bb314aaa2e97789c76c00@walle.cc>
References: <c7b6c666aef9a8a2195acabe9954a417f04b6582.1627039534.git.matthias.schiffer@ew.tq-group.com>
 <f3dbab898e9f1946129e5733095bdf3c@walle.cc>
 <3258026683c916a3a42e98ba76628228cddacb23.camel@ew.tq-group.com>
 <969e9169b77bb314aaa2e97789c76c00@walle.cc>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_001833_057079_08793E4D 
X-CRM114-Status: GOOD (  26.78  )
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

On Thu, 2021-10-07 at 09:08 +0200, Michael Walle wrote:
> Am 2021-10-06 14:32, schrieb Matthias Schiffer:
> > On Tue, 2021-07-27 at 09:09 +0200, Michael Walle wrote:
> > > Am 2021-07-23 13:27, schrieb Matthias Schiffer:
> > > > All mt25q variants have the same features.
> > > > 
> > > > Unlike the smaller variants, no n25q with 2G exists, so we don't need
> > > > to
> > > > match on the extended ID to distinguish n25q and mt25q series for these
> > > > models.
> > > 
> > > But why shouldn't we? What if there will be another flash with
> > > the same first three id bytes?
> > 
> > How do you suggest we proceed here? At the moment there are entries
> > matching on 0x20b[ab]22 (ignoring the extended ID) with the name
> > mt25q[lu]02g.
> > 
> > Should I change these entries to match on on the extended ID
> > 0x20b[ab]22 / 0x104400 instead when I add the bits for the features
> > specific to the variant, removing support for other 0x20b[ab]22
> > variants that may or may not actually exist? Keeping both entries (with
> > and without extended ID match) would preserve compatiblity with such
> > variants, but this approach seems problematic to me as well, as I can't
> > even give a name to the more generic entries (and there is no natural
> > extension of the n25q naming scheme to a 2G variant).
> 
> Mh, what do you think of adding three entries and make the last one,
> the one with the short id, as a fallback so to speak. This should
> retrain backwards compatibility, right? It should probably have a
> comment because the order will matter then.
> 
> -michael

Is it okay for multiple entries to use the same value for the "name"
field? In the existing definitions I couldn't find any example of
different ID matches mapping to the same name.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
