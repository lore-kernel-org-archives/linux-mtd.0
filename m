Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A871C25B74
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2024 08:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lZmbhH753U4aFR9DJ5U33qaJtwmgIROY+W6YpJKeRbM=; b=PcUIV6cTs2yklV
	6U9EBqziAS5XR2cH1qfbO6uUaZgnlAWefRHoAzKGQlhvhEHHc1FMN/BLoMFvFsUcYXCcjzkUutfo9
	AkiPVTwESNKmS1qrgb1qzO+BtlZTUrIbDnr4ueIIar96wwfBO3mKPfJgMgyBJmkin6nDiQ6zsLnCh
	xoQJTYwN0hOFlAtgMuHRnemG42HBRdOYVNV1ieGTBoqjhnZyrIqS/EWixp9i8qPuQlWn+KQgR5IOO
	FCR+G9SkJkxSaM3xMAbBPqqul5bT6h8oN3KJOr/SCOIUQrZBM7wPfHppFZ0jStTk7+N5VJJRjVcOl
	hJq06awnw4ef3QjsUr8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7WXF-00000004ABY-0VA5;
	Thu, 16 May 2024 08:32:21 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7WXC-00000004AAH-3E2T
	for linux-mtd@lists.infradead.org;
	Thu, 16 May 2024 08:32:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F9C91C0003;
	Thu, 16 May 2024 08:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715848335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2CeoEgDzrf8v+3ybZyI2qi/yVTnST3l7VSUfdHfTW0U=;
	b=NX2Z0NGaTiPVsDW8QZg3U7UpGgybZS0a7rLSrTVJbWrixdTFRo1Z51MHIfFLR7xifbA1ZM
	uQ5IQ5EZEIQJnjdRqczPADjFh5GZ8ocjCtWWOudPzbu95pScuUUeHgRzieTBLr6uCG/fKd
	3lmEWBeNtFh1wk9wHKi8BrMuEXl2QlU5HGH63cOTHP8vg8B6I1nNUuDuJz43cIswb0wUFW
	G0reP4DCvEn50JudYxHMRJCWAi30IytD/Hra4yEJbm6l7/FqTRvJ/BfUHOL/0Pl+mmPvFd
	FlMNlT6Di3t5Bm30k4ENKooN75eBxxHlrQZUnwDidyjtqMDNAV+89MCZwZJpJQ==
Date: Thu, 16 May 2024 10:32:14 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] mtd: nand: mxc_nand: implement exec_op
Message-ID: <20240516103214.57a8ce33@xps-13>
In-Reply-To: <20240514-mtd-nand-mxc-nand-exec-op-v3-2-3e6f45fd3d82@pengutronix.de>
References: <20240514-mtd-nand-mxc-nand-exec-op-v3-0-3e6f45fd3d82@pengutronix.de>
	<20240514-mtd-nand-mxc-nand-exec-op-v3-2-3e6f45fd3d82@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_013219_001361_614F1864 
X-CRM114-Status: UNSURE (   6.93  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2FzY2hhLAoKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBuYW5kX29wX3BhcnNlciBteGNuZF9v
cF9wYXJzZXIgPSBOQU5EX09QX1BBUlNFUigKPiArCU5BTkRfT1BfUEFSU0VSX1BBVFRFUk4obXhj
bmRfZG9fZXhlY19vcCwKPiArCQkJICAgICAgIE5BTkRfT1BfUEFSU0VSX1BBVF9DTURfRUxFTShm
YWxzZSksCj4gKwkJCSAgICAgICBOQU5EX09QX1BBUlNFUl9QQVRfQUREUl9FTEVNKHRydWUsIDcp
LAo+ICsJCQkgICAgICAgTkFORF9PUF9QQVJTRVJfUEFUX0NNRF9FTEVNKHRydWUpLAo+ICsJCQkg
ICAgICAgTkFORF9PUF9QQVJTRVJfUEFUX1dBSVRSRFlfRUxFTSh0cnVlKSwKPiArCQkJICAgICAg
IE5BTkRfT1BfUEFSU0VSX1BBVF9EQVRBX0lOX0VMRU0odHJ1ZSwgTUFYX0RBVEFfU0laRSkpLAoK
Q01ELCBBRERSLCBDTUQsIERBVEEgaXMgdGhlIFJORE9VVCBwYXR0ZXJuLiBTbyBpdCBpcyBub3cg
d29ya2luZyBmaW5lPwpPciBkaWQgeW91IGZvcmdldCB0byBhZGFwdCB0aGUgcGF0dGVybnMgdG8g
eW91ciB1c2UgY2FzZT8KCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
