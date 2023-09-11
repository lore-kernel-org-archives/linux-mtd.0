Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4683EE57DF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Sep 2023 15:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2dwVTf3/terw/r5Nk5PP4gHclB52k3oCXD4SR9TwX10=; b=AfbpuI/R9vES3h
	9hRjDMNrREjNOGDI1RNIPqARjOlae3AYm83nufPXG1UsG5m08VJYc4nO7qngkVfFuFgJocKLvl1+y
	PsF/YKSQdf0JH6kL5KLHGISodkvmRdBgngy5U1GaQwlblrp9PLsRr1K8noGpxgCS5lcY00wXmgVlV
	5wa22D4SCwIR+oTOOzuhwCnXaYct/1hhpmn17cCipOimMbTFZecyjRtrTBREKLJOeOxTHQCSnRK55
	llhyKGuA18Ft+ZBUqYP9Bcz+EWrPUaw7ZYISMqC3KPVuTjfFIZ6laGGb1GlMgFNQQraq4bOb094n8
	oUHUxfAhVKXfX1NpeRfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfj34-000v1p-1F;
	Mon, 11 Sep 2023 15:42:02 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfj30-000v18-2k
	for linux-mtd@lists.infradead.org;
	Mon, 11 Sep 2023 15:42:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BF6F6E0018;
	Mon, 11 Sep 2023 15:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694446915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8eGFlRAiKwz7g/fasY8Jk6HfMvuOa7JI1wixiyPB1o0=;
	b=kr2EVhvMPtWMwb5y+Kvze/QsqQazMWGPWzFvc5PrkpprxXZfVN3kthJ9G9iHjOAx3BuS6Z
	wA4IUI8fg/NmFxbGJ1cmQoXP4ReVJp+NKp3ii5ILXwKto5dFoCjC5KiQ18HfSwcTltQ7oN
	1B+sZIAQHqL9yxkPnTL2xU3gH7nFjDWNsKjNWs1q6sA1NSlKtXXTvNYxy0z1eLM5TIhZdP
	E3k8wrl6yxNiNr6zgiXmLRj7WMkm+r+00R6w0hVYKCsdat0maMi0xBkkRSIjib5oP8T8Y5
	bPQHCa/IGCq2UNjzUN3qTju1uxSdXewX/xr/KFLR3+NvRrN2WTBBg2IrA42QYg==
Date: Mon, 11 Sep 2023 17:40:39 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: <mani@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
 <quic_charnte@quicinc.com>, <quic_kaushalk@quicinc.com>,
 <quic_pkondeti@quicinc.com>
Subject: Re: [PATCH v2] mtd: nand: qcom: Fix the node for nand unmap
 resource
Message-ID: <20230911174039.63f6e835@xps-13>
In-Reply-To: <20230911133026.29868-1-quic_bibekkum@quicinc.com>
References: <20230911133026.29868-1-quic_bibekkum@quicinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_084159_173967_324AC527 
X-CRM114-Status: GOOD (  14.58  )
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

SGkgQmliZWssCgpxdWljX2JpYmVra3VtQHF1aWNpbmMuY29tIHdyb3RlIG9uIE1vbiwgMTEgU2Vw
IDIwMjMgMTk6MDA6MjYgKzA1MzA6CgpUaGUgdGl0bGUgcHJlZml4IHNob3VsZCBiZSBzL25hbmQv
cmF3bmFuZC4KClRoZSB0aXRsZSBpdHNlbGYgaXMgdW5jbGVhciAiZml4IHRoZSBub2RlIiBkb2Vz
IG5vdCBtZWFuIGFueXRoaW5nIHRvIG1lLgoKPiBGaXggYWRkciBhcmd1bWVudCB0byBkbWFfdW5t
YXBfcmVzb3VyY2UoKSBpbiB0aGUgZXJyb3IgcGF0aCBvZiBwcm9iZS4KCiAgICAgIF4KTm8gYWJi
cmV2aWF0aW9uIHVubGVzcyB5b3UgYXJlIHF1b3RpbmcgdGhlIGNvZGUgZGlyZWN0bHkuCgogICAg
ICAgICAgICAgICAgICAgIG9mPyAgICAgICAgICAgICAgICAgICAgICAgICAgICBwcm9iZSBlcnJv
ciBwYXRoCgo+IFRoZSBhZGRyIGFyZ3VtZW50IHNob3VsZCBiZSBkbWEgYWRkcmVzcyBpbnN0ZWFk
IG9mIHBoeXNpY2FsIGFkZHJlc3MuCiAgICAgIF4gICAgICAgICAgICAgICAgICAgICAgXiAgICAg
ICAgICAgICAgICAgICAgICBeCiAgICAgIGRpdHRvICAgICAgICAgICAgICAgICAgdGhlPyAgICAg
ICAgICAgICAgICAgICB0aGU/Cgo+IAo+IEZpeGVzOiA3MzMwZmM1MDVhZjQgKCJtdGQ6IHJhd25h
bmQ6IHFjb206IHN0b3AgdXNpbmcgcGh5c190b19kbWEoKSIpCj4gU2lnbmVkLW9mZi1ieTogQmli
ZWsgS3VtYXIgUGF0cm8gPHF1aWNfYmliZWtrdW1AcXVpY2luYy5jb20+Cj4gLS0tCj4gdjI6IElu
Y29ycG9yYXRlZCBjb21tZW50cyBmcm9tIFBhdmFuL01hbmkuCj4gCj4gdjE6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2FsbC8yMDIzMDkwNzA5Mjg1NC4xMTQwOC0xLXF1aWNfYmliZWtrdW1AcXVp
Y2luYy5jb20vCj4gCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYyB8IDIgKy0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYyBiL2RyaXZlcnMvbXRk
L25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+IGluZGV4IDY0NDk5YzFiMzYwMy4uYjA3OTYwNWM4NGQz
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+ICsrKyBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+IEBAIC0zNDQ0LDcgKzM0NDQsNyBA
QCBzdGF0aWMgaW50IHFjb21fbmFuZGNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKPiAgZXJyX2Fvbl9jbGs6Cj4gIAljbGtfZGlzYWJsZV91bnByZXBhcmUobmFuZGMtPmNvcmVf
Y2xrKTsKPiAgZXJyX2NvcmVfY2xrOgo+IC0JZG1hX3VubWFwX3Jlc291cmNlKGRldiwgcmVzLT5z
dGFydCwgcmVzb3VyY2Vfc2l6ZShyZXMpLAo+ICsJZG1hX3VubWFwX3Jlc291cmNlKGRldiwgbmFu
ZGMtPmJhc2VfZG1hLCByZXNvdXJjZV9zaXplKHJlcyksCj4gIAkJCSAgIERNQV9CSURJUkVDVElP
TkFMLCAwKTsKPiAgCXJldHVybiByZXQ7Cj4gIH0KPiAtLQo+IDIuMTcuMQo+IAoKClRoYW5rcywK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
