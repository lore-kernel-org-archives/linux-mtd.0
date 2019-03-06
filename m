Return-Path: <SRS0=kH4D=RJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4BA1C43381
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Mar 2019 14:00:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B51DC20661
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Mar 2019 14:00:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L7jQ0i3k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B51DC20661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QIrYsg6UqHiqEVdem3Dyo7I052y00rRxu+ClB+XdGs0=; b=L7jQ0i3k0irJWq
	EWwX3QWCsciIvxVSVry4b3DxIQiptrPIIehmEn7Xpm/dOMxV75AY838XSRaAqA9fvTYx4iQEsm8mG
	fcjVWfdkdBwZXIY5D5vI3QqaJ3hIy6bPpef4zbeg2BCgnKfxxBiMt0z1IKh4oDizLlRXhVtkpA/Q6
	+G49Jh0XWpswTkJC5qCgr+mHII8Q3pb+/8P05yqJ032N/aUa9BQ2lYbnoDK7NA9t6KUU4wryO6Lv3
	LIK4NIPa/caDSTARNDWdugZBi8dU4wVBYB1DTMwX/3blwIgn/2hNiBphiiSgtZ8i7ZCFjRHEXiE6o
	qIUMSYjvTAbLS35LKudg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1X5r-00047Z-3p; Wed, 06 Mar 2019 14:00:23 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1X5i-00046S-SF
 for linux-mtd@lists.infradead.org; Wed, 06 Mar 2019 14:00:21 +0000
X-Originating-IP: 90.88.150.179
Received: from xps13 (aaubervilliers-681-1-31-179.w90-88.abo.wanadoo.fr
 [90.88.150.179]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id CCFB3240021;
 Wed,  6 Mar 2019 14:00:02 +0000 (UTC)
Date: Wed, 6 Mar 2019 14:59:42 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wolfgang Grandegger <wg@grandegger.com>
Subject: Re: i.MX28 nand driver broken in Linux 4.18
Message-ID: <20190306145942.625b5c87@xps13>
In-Reply-To: <17beb0d3-6202-00ee-ff42-a656c4d8cb23@grandegger.com>
References: <8ec3f0b1-b288-d208-c0e4-431b49719d08@grandegger.com>
 <20190304125435.0e33d362@xps13>
 <e5450dfe-9228-569a-2c59-3b6f7bb05d2d@grandegger.com>
 <17beb0d3-6202-00ee-ff42-a656c4d8cb23@grandegger.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190306_060015_069732_96EB5C34 
X-CRM114-Status: UNSURE (   6.88  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgV29sZmdhbmcsCgpXb2xmZ2FuZyBHcmFuZGVnZ2VyIDx3Z0BncmFuZGVnZ2VyLmNvbT4gd3Jv
dGUgb24gVHVlLCA1IE1hciAyMDE5CjE1OjUyOjUyICswMTAwOgoKPiBIZWxsbywKPiAKPiBJIHdp
bGwgYmlzZWN0IHRoZSBwcm9ibGVtIG5leHQgd2VlayB3aGVuIEkgaGF2ZSBhY2Nlc3MgdG8gdGhl
Cj4gaGFyZHdhcmUuLi4gbW9yZSBzb29uLi4uCj4gCgpHcmVhdCwgdGhhbmtzLgoKUGxlYXNlIGRv
bid0IGZvcmdldCB0byBrZWVwIE1URCBtYWludGFpbmVycyBpbiBDYzogdG8gc3BlZWQgdXAgdGhl
CmRpc2N1c3Npb24uCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
