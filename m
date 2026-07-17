Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18236C4451B
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2026 15:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S0z91/sd2FdIqIwli5DrAzbv3+PK9kaJvtyxFi3gRU8=; b=dCVqWFDr1k5KAq
	lc7PC8Wm2pws/XgDRNA6d4NCZsYR3slLRY9nZXVeuO0ZiEgHvwLczDsKs6kfOuxUcm3AKqlIrWP+Z
	nFBP7DqQgOd+IcuQskzwEmoWStgLGLsJzRb00pi1pF7oTOnJPkvYupsGiLto30f2+UpHe/pu0Nw9O
	MLIVilEy+JzoDU+h5VZtiuNA3A/kEUpPjCQXdZcxl6vV1Zx1VcrkhNv0UEDmyNBY5WbQVQyEuAuIo
	ckOx0BBuB5orB5f7ZXgYSLPOVUnlkivuGZcvMWanhbShOKzK1ztYnP5S0FWqTpFsGWrOwTKZvpxGH
	HtKGKZpllxzVrxeCFAeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkko8-00000002ej7-3wIA;
	Fri, 17 Jul 2026 15:49:00 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkko5-00000002ehX-2xew
	for linux-mtd@lists.infradead.org;
	Fri, 17 Jul 2026 15:48:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 51DB11A1067;
	Fri, 17 Jul 2026 15:48:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1FDD460361;
	Fri, 17 Jul 2026 15:48:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6F6D011BD0B3F;
	Fri, 17 Jul 2026 17:48:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784303334; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ILAZx3KiebQm3SN922353u7J34YdTY+Y5ojwzfg/Bvw=;
	b=lUx7HJYAxpgrr+azw1ZLyNkz0ti8uZaYrbeFdeVWXf6exiFI5XURmZpRE8jIyk1oFSDYMG
	yIVEKzdrrVUCFKO7dXVHsO/upQyfRPBXZr5qP3w0Ok1ZCoy2UCTIuJ7R3f7038WekjzqoO
	AOUFBW4PwlYUsF/r5DXIV//Q8KankN/FXp1OUE0tvzsfiTFtpgxO+JB5k0LkcF3xL5O1Z7
	g/x8m6Cd+FaqOMFqRQwJb7DU8kc05bQ6GKbBUF2Rj+Obl+2D6c5A5xlhAhGIUwY3mumDFZ
	TvStic2mYJy32tOG/Haya7/ccOc9+uXK7CxKAhX/0LXuTX/owJfV1QdSP2Hbbg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260707-qcom-nandc-mdm9607-v2-0-d906f7e8b814@linaro.org>
References: <20260707-qcom-nandc-mdm9607-v2-0-d906f7e8b814@linaro.org>
Subject: Re: [PATCH v2 0/4] mtd: rawnand: qcom: Add MDM9607
Message-Id: <178430333120.4128272.1902568397543487777.b4-ty@bootlin.com>
Date: Fri, 17 Jul 2026 17:48:51 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_084857_887629_52A0DF35 
X-CRM114-Status: UNSURE (   6.66  )
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

T24gVHVlLCAwNyBKdWwgMjAyNiAxMzo1NjowMCArMDIwMCwgU3RlcGhhbiBHZXJob2xkIHdyb3Rl
Ogo+IE1ETTk2MDcgaGFzIFFQSUMgdjEuNSB0aGF0IHN1cHBvcnRzIHRoZSBPUF9QQUdFX1JFQURf
T05GSV9SRUFEIGNvbW1hbmQsIGJ1dAo+IGlzIG1pc3NpbmcgdGhlIHJlc3Qgb2YgdGhlIGhhcmR3
YXJlIGNoYW5nZXMgaW4gUVBJQyB2Mi4gVGhlcmUgaXMgYWxzbyBvbmx5Cj4gYSBzaW5nbGUgY2xv
Y2sgdGhhdCBjYW4gYmUgY29udHJvbGxlZCB1c2luZyB0aGUgUlBNIGZpcm13YXJlLiBEb2N1bWVu
dCBhbmQKPiBhZGQgdGhlIG5ldyBxY29tLG1kbTk2MDctbmFuZCBjb21wYXRpYmxlIGZvciB0aGlz
IHNldHVwLgo+IAo+IAoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzRdIGR0LWJp
bmRpbmdzOiBtdGQ6IHFjb20sbmFuZGM6IEFkZCBNRE05NjA3IFFQSUMgTkFORCBjb250cm9sbGVy
CiAgICAgIGNvbW1pdDogNDUyOWFhYmFiZTQyMTJiOWI2ZDcwZTgzY2ViNmE5OWY5NjkxYzgxMQpb
Mi80XSBtdGQ6IHJhd25hbmQ6IHFjb206IE1ha2UgImFvbiIgY2xvY2sgb3B0aW9uYWwKICAgICAg
Y29tbWl0OiA1MzNlYzgxNjMxMmJhZWNkYjQ1YmJjYjhhMjc5YzY1NjFhYTcxMjE1ClszLzRdIG10
ZDogcmF3bmFuZDogcWNvbTogTWFrZSBoYXNfb25maV9yZWFkX29wIHNlcGFyYXRlIGZyb20gcXBp
Y192ZXJzaW9uMgogICAgICBjb21taXQ6IDA3MzI1OTVkMmY4Y2Y4NDZiZTMzMjdjOGM5NDUzZWIx
MGIxMGVkMzkKWzQvNF0gbXRkOiByYXduYW5kOiBxY29tOiBBZGQgTURNOTYwNyBjb21wYXRpYmxl
CiAgICAgIGNvbW1pdDogNjllM2M1MDRlMThiZjFmZWMwM2ZkZjYyOTMzMjA4NjBlYzgzMmFmOAoK
UGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBi
ZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBi
eSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
