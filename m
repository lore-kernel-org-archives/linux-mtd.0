Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0350CC4451B
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2026 15:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3E0ryRc13lmir1Yf1sPy7cxjV5Km+1Wmpa4y4YWXCsE=; b=SkhhVRMtvoRIKr
	70TavH322hkBa7OgTf769xVXYt95Si7am2IY2A0HJiQ5wpHvVzO2P33mciwSAPjL3dS/CQTWEj3rg
	bHyfPzXdkhD0PpUm9tyUbFlSCuJ8xLWcuKaedLljqsRM2/fXn2F4xFAdGCNlh+Hd2ZFKhc+WBx6WZ
	srGACVoh+OjL7HS1Ja4q/hjJ9HtwASB3jYJVIt6ipTTxoXhUhxulvQSHU7V4VulUSW7bP1zMTZ18A
	lwEt5Rl4pSPtfgTgltmQTwrqH335ylrpPUeJv9dZ9cEV0rvyHEc5ukdHJ7+zNV+8KubkQKCN+LTTs
	Db6fId8KYF9i+s/ugNow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkpr-00000002f9v-02nW;
	Fri, 17 Jul 2026 15:50:47 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkpo-00000002f8N-3c63
	for linux-mtd@lists.infradead.org;
	Fri, 17 Jul 2026 15:50:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4D5B44E40E1F;
	Fri, 17 Jul 2026 15:50:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 22A3C60361;
	Fri, 17 Jul 2026 15:50:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4B73511BD0B3F;
	Fri, 17 Jul 2026 17:50:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784303442; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9QEdUhXnOpkNw6m+PIHAktD3+IAu3Yyyek4pNRP4oFQ=;
	b=lNchfynBlEDqyTPM5NTF2tbmVqQ5kfwOLr8rHEOQGIqqXgsf1lnkwmVKFMLfArm6UzMv2k
	o5ChZav4CR9bs/h9OBLkM46FtzJns2lmnzaGBHkSC9Lwi8HQzulQ70JUey+18DT3Ny9IeJ
	jEzX3Bi9iRANZr/J+xwpeeNAd4PZSrjN0LMfJ9n99Y+b9UqUunGAtR83zhkz1oHs5hbNzq
	p1RIiYy6iqMhDk00OiYnifStrK4EaawxB5CQxkYVXYDAT8/JD7aVYY/zcg/yii+vDYUyvG
	BeAfEbDtCjamMzjr8TCGQUrhlak+QS8z1snYnJhg18dhdDtHii1HPp/FDhqxvg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Linus Walleij <linusw@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20260708014906.1463-1-pengpeng@iscas.ac.cn>
References: <20260708014906.1463-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH v2 RESEND] mtd: afs: validate v2 image info bounds
Message-Id: <178430344123.4129650.17126577356118122779.b4-ty@bootlin.com>
Date: Fri, 17 Jul 2026 17:50:41 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_085045_037730_8CC52E15 
X-CRM114-Status: UNSURE (   6.67  )
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

T24gV2VkLCAwOCBKdWwgMjAyNiAwOTo0OTowNiArMDgwMCwgUGVuZ3BlbmcgSG91IHdyb3RlOgo+
IFRoZSBBRlMgdjIgcGFyc2VyIHVzZXMgZm9vdGVyWzhdIHRvIGxvY2F0ZSB0aGUgaW1hZ2UgaW5m
b3JtYXRpb24gYmxvY2sKPiBpbnNpZGUgdGhlIGN1cnJlbnQgZXJhc2UgYmxvY2ssIHRoZW4gdXNl
cyB0aGUgaW1hZ2UgaW5mb3JtYXRpb24KPiByZWdpb25fY291bnQgdG8gd2FsayBlbnRyaWVzIGZy
b20gYSBmaXhlZCBsb2NhbCBhcnJheS4gVGhlIGZvb3RlciBvZmZzZXQKPiBhbmQgcmVnaW9uIGNv
dW50IGNvbWUgZnJvbSBmbGFzaCBjb250ZW50cyBhbmQgYXJlIG5vdCBjaGVja2VkIGFnYWluc3Qg
dGhlCj4gZXJhc2UgYmxvY2sgb3IgdGhlIGxvY2FsIGltYWdlLWluZm8gYXJyYXkgYmVmb3JlIHVz
ZS4KPiAKPiBSZWplY3QgdjIgZW50cmllcyB3aG9zZSBpbWFnZSBpbmZvcm1hdGlvbiBvZmZzZXQg
d291bGQgdW5kZXJmbG93IHRoZQo+IGVyYXNlIGJsb2NrIGNhbGN1bGF0aW9uLCBhbmQgcmVqZWN0
IHJlZ2lvbiBjb3VudHMgdGhhdCBjYW5ub3QgZml0IGluIHRoZQo+IGxvY2FsIGltYWdlLWluZm8g
YXJyYXkgYmVmb3JlIHdhbGtpbmcgcmVnaW9uIGVudHJpZXMuCj4gCj4gWy4uLl0KCkFwcGxpZWQg
dG8gbXRkL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogYWZzOiB2YWxpZGF0ZSB2MiBpbWFnZSBp
bmZvIGJvdW5kcwogICAgICBjb21taXQ6IGU5MjkwMDMxZjczNmU5OWFkMTdjMjVjMDAzMTFjOTJj
MjY2ODQzYjcKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQg
YW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBj
b21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
