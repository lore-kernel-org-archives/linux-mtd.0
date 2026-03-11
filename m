Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE771125842
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 15:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sLW0W3Crs0rJ/ltSDEeRVDkwbyaVhE9lwH+blMu5R4U=; b=rkooaUShGg8A37
	ox6WJxx6jeUkRpU4T4qkVcxJx/Jx9BDwO3hHmUaM9FUjwJN1VsdjUHheowSpJ6joTnAlc7O6+1E1B
	1mZ/VJ9ymQ2g1uTSSAajBLsZrN4cAgSNntUe51fMOYtSDdkordeXc66nODSvPCcXUCzNvpuuFWNwM
	YJyYm418tkRd8VdHQ0nz1OYJxq+Tv5LKYhqfBSEfB1g5+aNJyayL0XBcgE33lDRnB8SUpMgNu9rez
	YCy0bTd3AkHRtyd9GD1TGIQukW1g9wIouEG6Qv4pPrh/tp33be4RDAZe5DL1ELwtWRor7FQmU6MUn
	EhFrtF5VbOrGKBl0xdfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Lc4-0000000BpzB-3gKh;
	Wed, 11 Mar 2026 15:36:44 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Lc2-0000000BpyM-0bNa
	for linux-mtd@lists.infradead.org;
	Wed, 11 Mar 2026 15:36:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 975B81A2D72;
	Wed, 11 Mar 2026 15:36:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6CBF160004;
	Wed, 11 Mar 2026 15:36:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 78F8E10368F58;
	Wed, 11 Mar 2026 16:36:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773243399; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bRzNGIBOQ+/dgYoF2yQzuyXFgaXa8jyPOv+ICqwHJRA=;
	b=ipLwyGPGFa2mroBiBEt64yFhxICmWh3QJRSISXk2PXq0y2NAh+JA6j6hoTHP1Qm9FoczZR
	I1Lrhc+m9COOcNnZPiEMOu0roF9E/b2GwzaccVAAKwyls/MqdqcpwYAYnbuRmV/VOhO1kR
	YYbpG/zvW9ZgUe9uPCpzQXAGpL+q7dZDbPKU3sdYQtAolRwj9hwtOQNVVjtCxNjefgn2mY
	jyMdFvdtQYFD2km/VwQTyT6VK2b2xmVUh8LVp8ycgtUSeYXLRrZk39EMFth2uAWOq7VoLq
	KYOibLYC9McmAfxGjKC7eWSWFffyrZW8pzCAPCg9WJvT6MREJRhI9fn8cuDAxQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Lyu <richard.lyu@suse.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>, 
 Markus Stockhausen <markus.stockhausen@gmx.de>, 
 Thomas Gleixner <tglx@kernel.org>, Kees Cook <kees@kernel.org>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260310163036.300392-1-richard.lyu@suse.com>
References: <20260310163036.300392-1-richard.lyu@suse.com>
Subject: Re: [PATCH] mtd: nand: Use scoped_guard for mutex in nand_resume
Message-Id: <177324339632.696314.14862612303561284625.b4-ty@bootlin.com>
Date: Wed, 11 Mar 2026 16:36:36 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_083642_312985_431A2966 
X-CRM114-Status: UNSURE (   9.15  )
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

T24gV2VkLCAxMSBNYXIgMjAyNiAwMDozMDo0MyArMDgwMCwgUmljaGFyZCBMeXUgd3JvdGU6Cj4g
UmVmYWN0b3IgbmFuZF9yZXN1bWUoKSB0byB1c2Ugc2NvcGVkX2d1YXJkKCkgaW5zdGVhZCBvZiBl
eHBsaWNpdAo+IG11dGV4X2xvY2svdW5sb2NrLiBUaGlzIGltcHJvdmVzIGNvZGUgc2FmZXR5IGJ5
IGVuc3VyaW5nIHRoZSBtdXRleAo+IGlzIGFsd2F5cyByZWxlYXNlZCB0aHJvdWdoIHRoZSBSQUlJ
LWJhc2VkIGNsZWFudXAgaW5mcmFzdHJ1Y3R1cmUuCj4gCj4gVGhlIGJlaGF2aW9yIGlzIGZ1bmN0
aW9uYWxseSBlcXVpdmFsZW50LiBUaGUgbXV0ZXggaXMgcmVsZWFzZWQgYXQgdGhlCj4gZW5kIG9m
IHRoZSBzY29wZWQgYmxvY2ssIGFmdGVyIHdoaWNoIHdha2VfdXBfYWxsKCkgaXMgY2FsbGVkIHRv
Cj4gcHJlc2VydmUgdGhlIG9yaWdpbmFsIGxvY2tpbmcgc2VtYW50aWNzLgo+IAo+IFsuLi5dCgpB
cHBsaWVkIHRvIG5hbmQvbmV4dCwgdGhhbmtzIQoKWzEvMV0gbXRkOiBuYW5kOiBVc2Ugc2NvcGVk
X2d1YXJkIGZvciBtdXRleCBpbiBuYW5kX3Jlc3VtZQogICAgICBjb21taXQ6IDUyMDg4NmExYTZj
YTE2ODYyYTA0MzdiNGE4ZmFlMTMzYTg5NWE5YjgKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxh
YmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJv
dmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1p
cXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
