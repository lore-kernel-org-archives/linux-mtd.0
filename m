Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0896E606A330
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 13:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XwZg0q2g;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=dS7jJFla;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=giVPhq7d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UJbUWR5v8emmjdbpL6svpOvU9cXpjBFB6EoEeJR5HTY=; b=XwZg0q2gG4LtoEATlqLbaGYr07
	XTG7CZmuM7AWwBuYbaRfnwcl5d7pED7Q8NDi0JkuvdZ/Hd6gS3cCFMPsPAkpMp6xjAquKjh2m7ioE
	7E0v6Gp8L+Ey7WnQzB2Hlme9dZ6hq485HdXncIHd8bImNWhc1MadT0H+lyy3EDZEp87VMywzxvU2N
	stvrcOiZ/LwQvdvezzDr5cSyBtMyahwZAoLSGC+jG+FxRqxiwfaNCR3rkVmfRNG+kXdgY6ILKVBrJ
	BxV6GI8a9QxdN2uGbPEDwrHLFt6/lkjCuxz3DDyBax+ZDshcJ1E0OVEVTmssANB4eM18B04sLYGmh
	WnZhf8uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJNc-00000005yLf-2eBc;
	Tue, 17 Nov 2026 13:37:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJNX-00000005yF8-4A99
	for linux-mtd@bombadil.infradead.org;
	Tue, 17 Nov 2026 13:37:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kgJsbkSFQTg78psnMvY+98h+QUISiT6jPS3j4plTkYc=; b=dS7jJFlaaKGGh2VXnsH2MpA0BT
	B4V3TrINoT5tZeRFOnQf5+3z7iDeV2PtSDxuDzoXfdgiu9KLhU5whcBzjL5UgmECqk7+RoE7xgoZE
	gBBeWMb1A28irvYuvzJJc6Gdn3QRZCgUKqlneBpKXzSzv8YmprjRPfpwB/AhGIVN7xt1w9kHvpLG6
	EfsHUawJOUJ9qVKNuK/eXY8y5dfBUe90B5LLgtfCyW76SheHcHJA3XSht2zrvYbyhBbOHfqvZqPml
	h4em436qaCvsE4U7+2a/mxB34lbz2nNXqY4tP7yU2W7tRpTSUQqVqsz3fucehPGdobW0Y1EY34QHo
	KFZffZ5w==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJNU-0000000F0oS-14Zi
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 13:37:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 039324E41578;
	Tue, 17 Nov 2026 13:37:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C39125FC81;
	Tue, 17 Nov 2026 13:37:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BF44B11BC0035;
	Tue, 17 Nov 2026 14:37:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794922658; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kgJsbkSFQTg78psnMvY+98h+QUISiT6jPS3j4plTkYc=;
	b=giVPhq7dRdRoR06f4TC8RWqFklXoez/76s9uytQrMgIti7gQzK+1OGpYprp7nG50WekpZa
	DMTMNw6uui4vy6Zlw49VDko3K9MkeEHexxRxqUGa75DaN7Vr59+KeCvBN8wc4y3qgfANXy
	vf3+xYpftUopPOUNo9S77rJSh6KnCvmm6S35gk3w9c8PJGVe54Ors4jXAtxUJfOMQK1WdT
	VDwoX56wXNRd2IBbo2tswuOwpkP5RPeIG49xWCR44IGWb3S1ZX9gO6oSg9WMTcSgxpZ99D
	adIrhXGMwWcgLgdvNwEbxUrkjsaCGmwJYDbhSOTf8mIEI11TGdStSNWuzlvtJg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261111-e5624093d6-mtd-inftl@mail.sdu.edu.cn>
References: <20261111-e5624093d6-mtd-inftl@mail.sdu.edu.cn>
Subject: Re: [PATCH] mtd: inftl: Fix potential table leaks on mount failure
Message-Id: <179492265670.2237190.17140350339838790545.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 14:37:36 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_133740_376994_3DC8B921 
X-CRM114-Status: UNSURE (   8.54  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCAxMSBOb3YgMjAyNiAyMDoyMzoxMiArMDgwMCwgR3VhbmdzaHVvIExpIHdyb3RlOgo+
IElmIHRoZSB0ZW1wb3JhcnkgQU5BQyB0YWJsZSBhbGxvY2F0aW9uIGZhaWxzLCB0aGUgdW5pdCB0
YWJsZXMgYWxsb2NhdGVkCj4gYnkgZmluZF9ib290X3JlY29yZCgpIGFyZSBsZWZ0IGJlaGluZCB3
aGVuIHRoZSBjYWxsZXIgZnJlZXMgdGhlIElORlRMCj4gcmVjb3JkLiBGcmVlIGJvdGggdGFibGVz
IGJlZm9yZSByZXR1cm5pbmcgdGhlIGVycm9yLgo+IAo+IFRoaXMgaXNzdWUgd2FzIGZvdW5kIGJ5
IG91ciBzdGF0aWMgYW5hbHlzaXMgdG9vbCB1bmRlciBkZXZlbG9wbWVudC4KPiAKPiAKPiBbLi4u
XQoKQXBwbGllZCB0byBtdGQvbmV4dCwgdGhhbmtzIQoKWzEvMV0gbXRkOiBpbmZ0bDogRml4IHBv
dGVudGlhbCB0YWJsZSBsZWFrcyBvbiBtb3VudCBmYWlsdXJlCiAgICAgIGNvbW1pdDogZGQ0ZTY4
YjUwNjFlZmI1NmVlYTA5M2I2YTliN2E2ZGE0OWVmZGEwNwoKUGF0Y2hlKHMpIHNob3VsZCBiZSBh
dmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBS
IChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJk
cywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
