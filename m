Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FC6C79F82
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 18:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NR606Rg+3XmOLUe/RruZjAtfsaatSFZW8P9GO5DMCPA=; b=Co6blPlYy0K751
	cDGsrQ+frj/ouvYT1EmiU5Aex7sor6640fIYZ2uoJgF3bDgrVhfLBbU8BCg3oU6tS1MlBM1wEk9sP
	a8igX7mmIFmomBNr3Yg1NtrH3TX03sHlLxp1G7K9vC1O+pDAp2smkE+PQ8vbNBGYWFzCVBgtsTwX1
	jcR4Qbb7c/Ur07nb/PS1JjewZZq6g0YHDNffmc1nQnKzcS6pSbkFEkp5ja8okQtVnOp7Q7zLD4jaM
	msqFF185B80DqJlyui+V6h9GpxG+eizYXeKGohOkFNZTpk4MxKVao2iDAgp7mZsZNN5WkOHp9RPjf
	DTnfSmq1iWsoPEDkaGOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YIE-00000002yBb-3dwo;
	Fri, 04 Sep 2026 18:05:38 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YIB-00000002yAx-3I4Z;
	Fri, 04 Sep 2026 18:05:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DD56C4E41521;
	Fri,  4 Sep 2026 18:05:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9B7A26057F;
	Fri,  4 Sep 2026 18:05:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9CFCC11C79351;
	Fri,  4 Sep 2026 20:05:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788545127; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zmnzVywuJ36UYza4cGKzEYOf2ze4aJrDgWLkLYA0zhw=;
	b=tH+vmgtvwgcX7d6mOJyu5ufzIcqG+iDtAXzIxhAzsodtwjNDtQOC4vXx6+f/o0epJN9ynN
	GNiw/GAZ5H9nbki+HkwrYR95hmCHbDDnIo+z+i8ia7j2JNYJcVavyAbecFSUuv1+UPGjHk
	zpQJyzXBuWpT1IkJ3mAG6w+B3jryoT/hDCarrjGJeXTyOccbsHSVclLgWD0lXcFtAvvxff
	6fIf1QQoFfoc+5fV0IULTLCZjJnuRTYn4isOk75D46Qe9XxHgqOtba49hn+2YddZGAhv5b
	ZeB0DclH1pUwgRmetb0jLmzqjQqTgm/8uvyosw9X52Ig2+LLragbdiZ5CRrsvA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, Han Xu <han.xu@nxp.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Hemanth Selam <hemanth.selam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260904125208.12099-1-hemanth.selam@gmail.com>
References: <20260904125208.12099-1-hemanth.selam@gmail.com>
Subject: Re: [PATCH] mtd: fix typos in comments
Message-Id: <178854511430.1515959.5653817613132272975.b4-ty@bootlin.com>
Date: Fri, 04 Sep 2026 20:05:14 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_110535_963165_E96BFF9D 
X-CRM114-Status: UNSURE (   5.67  )
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

T24gRnJpLCAwNCBTZXAgMjAyNiAxODoyMjowMyArMDUzMCwgSGVtYW50aCBTZWxhbSB3cm90ZToK
PiBGaXggdHlwb3MgaW4gY29tbWVudHMsIHJlcG9ydGVkIGJ5IHNjcmlwdHMvY2hlY2twYXRjaC5w
bCB1c2luZyB0aGUKPiBtaXNzcGVsbGluZyBsaXN0IGluIHNjcmlwdHMvc3BlbGxpbmcudHh0LiAg
T25seSB0b3VjaGVzIGNvbW1lbnRzLCBubyBjb2RlCj4gY2hhbmdlcy4KPiAKPiAKCkFwcGxpZWQg
dG8gbXRkL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogZml4IHR5cG9zIGluIGNvbW1lbnRzCiAg
ICAgIGNvbW1pdDogOTA5MzZjM2M3OTBlYzIyYjAyYzZkODYxMWE5ZGYwYWVjYjgxMzliYgoKUGF0
Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpw
YXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0
aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
