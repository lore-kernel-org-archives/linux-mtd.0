Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E2EC44500
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2026 06:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GBDYvyIP0qUHS6w5GrMZevhFF7aHEyQdZbBal4RD+e8=; b=bRUCfWid6JidkI
	EWxcIcgtj4KcjWwRNWI3Jz6BSoysMGulFft9cwX7U46C0jM1K5BaRl3xoeaNRXvvVwf6lSE8a2/9C
	awQzS3MY+XjBkePRbN9vx4OB8IDREz6XfPmf5BzTrghpGRpoVLyN160rzuEWzeVpYor5PyVDIubye
	viBfp071OkRAy/ftgL045dVTi8cjLsLbUrJlZXAkJg5rN7Xwz7BIsk1CNWqet8/oVWHV1hiPfGS1T
	O3yBKXGw8oN53Mx836L2PFDwHmCukYSpCazNkGOnSIA8kqNuOfwB3/785jgvLOQa45YfvGPi0eeYe
	fhQR+pdk7/eB0hO/KmJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgckg-0000000Bbnq-1MVF;
	Mon, 06 Jul 2026 06:24:22 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgckc-0000000BbmH-2D6P
	for linux-mtd@lists.infradead.org;
	Mon, 06 Jul 2026 06:24:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1F6E34E40CA4;
	Mon,  6 Jul 2026 06:24:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E7A91601A2;
	Mon,  6 Jul 2026 06:24:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7E4BE11BB9890;
	Mon,  6 Jul 2026 08:24:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783319054; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3IbFos0UeA5hamgUTU74OZqNtIk1cvZ107rKx8smnWk=;
	b=wC3Qc1A6ke/5jyvpXClPdyJj6j+KsAzGM8khmdwAPlCrl7WWxNRvQOQltzSN3YNsQPz0QG
	/Jz4zseEy/9KVscxDWYrFTzh3M6rvhrjROkZ4Aw26YextQKVVqqXA4CKKBUQY4dwwYo4ap
	gsbkK7N03c7JYWdfL0vQ23jTIXb6SsGcYdaDGX0Kd67KIIYJqbaLebfQ+MjjpYarv/4AnN
	SMYOPgyo6yu/2eX5DzDB+9wpl3D9EnhUpVI/uZuzfWAX1JZcMarCkCvozdSe3jvprscHXw
	fugmy/DlsW8mqzhs6p8z/cNmhOcHJVsWnjK15bDeLOvGeUbCNtfbRxicRC6FBA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: raoxu <raoxu@uniontech.com>
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <A9EF5AD55FADC312+20260626021338.3744161-1-raoxu@uniontech.com>
References: <A9EF5AD55FADC312+20260626021338.3744161-1-raoxu@uniontech.com>
Subject: Re: [PATCH v2] mtd: virt-concat: free duplicate generated name
Message-Id: <178331905244.868671.13228037841179082405.b4-ty@bootlin.com>
Date: Mon, 06 Jul 2026 08:24:12 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_232418_699140_B6ED0410 
X-CRM114-Status: UNSURE (   5.10  )
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

T24gRnJpLCAyNiBKdW4gMjAyNiAxMDoxMzozOCArMDgwMCwgcmFveHUgd3JvdGU6Cj4gRXZlcnkg
TVREIHJlZ2lzdHJhdGlvbiBydW5zIG10ZF92aXJ0X2NvbmNhdF9jcmVhdGVfam9pbigpLiAgT25j
ZSBhCj4gdmlydHVhbCBjb25jYXQgaGFzIGFscmVhZHkgYmVlbiByZWdpc3RlcmVkLCB0aGUgZnVu
Y3Rpb24gYnVpbGRzIHRoZSBzYW1lCj4gbmFtZSBhZ2FpbiBhbmQgdGFrZXMgdGhlIGVxdWFsLW5h
bWUgYnJhbmNoLiAgVGhhdCBicmFuY2ggc2tpcHMgdG8gdGhlCj4gbmV4dCBpdGVtIHdpdGhvdXQg
ZnJlZWluZyB0aGUgbmV3bHkgYWxsb2NhdGVkIHN0cmluZy4KPiAKPiBGcmVlIHRoZSB0ZW1wb3Jh
cnkgbmFtZSBiZWZvcmUgY29udGludWluZy4KPiAKPiBbLi4uXQoKQXBwbGllZCB0byBtdGQvZml4
ZXMsIHRoYW5rcyEKClsxLzFdIG10ZDogdmlydC1jb25jYXQ6IGZyZWUgZHVwbGljYXRlIGdlbmVy
YXRlZCBuYW1lCiAgICAgIGNvbW1pdDogY2FhMGVjYmVmZjRmN2ZiZjcwZjIyYmQ4Y2E1OTg5MThi
ZmZiMWI3OAoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBh
bmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNv
bXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
