Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EBA606A33E
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 13:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z9Mpg06g;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=PW7Gjjda
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sPbk5S6TsyDkY90D93O7YZPHWn7EA9MCcfE+VtxqnxM=; b=Z9Mpg06g456HAUFHTsnfvX9a9N
	k5Cxk7jdyUxBzgNrELr8pvLWBjGdvw2cU9T9JvCaMyq3LwuHLc2CAvyBOfk6IvpetvDGfpx0JYH/X
	oQ21ij+QbTILNcHBv0PJKGv8BSvx/r8rwvOQcipb8IrBrJPDLnPxDRXM8ZOPl6wmkbMpM+FeLAbjS
	I2Qwe8bYTbRkWb8O6H5kzkKUB6jLEF5nQOI+giJC+iGNr7Rer6cSNrT2Ylwm4a9KhXubk9MWWpSAh
	AQqwXsCgkslwnbIYNA1wheFKqqogknEqPFmeatdDQk34mC2DPczBczAwSNIx5yop5FUHg/w6jt8Jr
	6ytg8nXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJND-00000005xxc-3i2r;
	Tue, 17 Nov 2026 13:37:23 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJNB-00000005xvZ-27WV
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 13:37:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AB0BC4E4156A;
	Tue, 17 Nov 2026 13:37:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 789945FC81;
	Tue, 17 Nov 2026 13:37:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3D5DF11BC0026;
	Tue, 17 Nov 2026 14:37:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794922634; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nRITdBhip+rPBa8gXy4noT3SIKJ/ipRLqJOeEQwoUFA=;
	b=PW7GjjdawZqKohT3YbHhB6aHdlEkXLdbLt+fdJzMqQGQoMbf1mrwFjhwdaJbovT6U0mjt8
	YsUSPtTZhp3z2npTvl6CgdJr8Gj+L4zvonIEcVZLMQyee2XHOcmUREIPvBiiKg5Orc3Fwa
	ha4ZuI3hLlCopF02gL8mLNP5YsQXvl2zWxhYCUF+TPFrtJchCBHnUpv9i0o6ie0A+DF4VQ
	HQfGw4pfO+PTP4j6+vgxsWHY9ahkdyNUcy6fgdnRGC4D04YthJpFuytdWBEtLdsfVm6Ig/
	wt6QdvkYlhe3hxyt60LrQhhd50VPYnNQQTlApld7FL4e/1VbkCrbc36YiIMAMw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, 
 Vishal Satle <vishalsatleit24@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20261027104345.172612-1-vishalsatleit24@gmail.com>
References: <20261027104345.172612-1-vishalsatleit24@gmail.com>
Subject: Re: [PATCH] mtd: virt_concat: Fix device_node reference leaks in
 mtd_virt_concat_create_item()
Message-Id: <179492263415.2237190.16195566122827499239.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 14:37:14 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_053721_688049_1492B087 
X-CRM114-Status: UNSURE (   6.73  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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

T24gVHVlLCAyNyBPY3QgMjAyNiAxNjoxMzo0NSArMDUzMCwgVmlzaGFsIFNhdGxlIHdyb3RlOgo+
IEluIG10ZF92aXJ0X2NvbmNhdF9jcmVhdGVfaXRlbSgpLCBzZXZlcmFsIGRldmljZV9ub2RlIHJl
ZmVyZW5jZSBjb3VudCBsZWFrcwo+IGFuZCBsaWZlY3ljbGUgYnVncyBleGlzdDoKPiAKPiAxLiBv
Zl9wYXJzZV9waGFuZGxlKCkgcmV0dXJucyBhIGRldmljZV9ub2RlIHdpdGggaXRzIHJlZmNvdW50
IGluY3JlbWVudGVkLgo+ICAgIFRoZSB2YWxpZGF0aW9uIGxvb3AgY2FsbHMgbXRkX2lzX3BhcnRf
Y29uY2F0KCkgZGlyZWN0bHkgb24gdGhlIHJldHVybmVkCj4gICAgcG9pbnRlciB3aXRob3V0IHJl
bGVhc2luZyBpdCwgbGVha2luZyB0aGUgbm9kZSByZWZlcmVuY2Ugb24gZXZlcnkKPiAgICBpdGVy
YXRpb24gYW5kIG9uIGVhcmx5IHJldHVybi4KPiAKPiBbLi4uXQoKQXBwbGllZCB0byBtdGQvbmV4
dCwgdGhhbmtzIQoKWzEvMV0gbXRkOiB2aXJ0X2NvbmNhdDogRml4IGRldmljZV9ub2RlIHJlZmVy
ZW5jZSBsZWFrcyBpbiBtdGRfdmlydF9jb25jYXRfY3JlYXRlX2l0ZW0oKQogICAgICBjb21taXQ6
IGQyYTY4MWVlZDgxNTQ5MDBlZDY2YzRmNzdiMzJkODYwYjcxZDQ0Y2MKClBhdGNoZShzKSBzaG91
bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUg
bmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5k
IHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
