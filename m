Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7B1606A33A
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 13:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lUnmKbcN;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=IVzG4INh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=MJtNRRFc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YN+gUus8udp+8rOLj+zR+ZW2iNZuZsaiY5G2I99dQRA=; b=lUnmKbcNB5h23EUjOIPA+EeT4q
	/oGwG+25FAEAYE++9+IFH0ombCtF1vt6zEFON9CA0woVRvDd6loQ4pqN8zJSQl3Q3vQq16WlVkhwm
	0yxjaVKK2sxGw54ofr3lVAyxS8Wwt7l++jK4l4YU1rz5T0IWRkqoXBuZRDFKe45IXUEqF+ZZyegyM
	OIz0x/QxU8BkvstSZ53Xea7JbWQeLRDhcEU16KmWBti/iI7FKgEO17UYBowPGUeXFAeZBU7az7nsH
	mGD5afKQB7TT/gsPVu7caB41m9OCph2+oQRZpU36k3i1Re9Ybn1Fo0qgQlV+hIsEK1452OS5eNBSH
	kyEvBR4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJNs-00000005yXy-0JzC;
	Tue, 17 Nov 2026 13:38:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJNf-00000005yOC-3thx;
	Tue, 17 Nov 2026 13:37:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=95IDR58HGwZG11mkyszy3LrlBW4ox835eXVGsWRIs2A=; b=IVzG4INhIz3hI/zTKr26cof5WK
	RrMQcW9hQyxBZrbFiM93K5Z2WjKlah8UMOu1mYsPnTUXeUOwl1OGKipcIA8LNLen+Fe9I+xVRmnan
	2EFLiteyrM2Eb61B1hOFwAAtcGSmDoDMRNENeuLoIm8rM3i2R5S0NgJt6qIJLl8GhSBZocefZeMos
	oOXrnllXhiLb8F7YijnrJUevJmo70S02p5wgJjuoET1d16u3li4FZqKLT+S03Ihj0vXCw4LcKnvAn
	on2UIbENRJk51EBY+Opnb6P/qsUV6WaVcRIZNs2f8nJZQAt/dW4nNJ7jTt/qWUNy5KkTfEtevfVjT
	07gMA1Kg==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJNb-0000000F0qH-0xJ1;
	Tue, 17 Nov 2026 13:37:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4AFC6C4CBCE;
	Tue, 17 Nov 2026 13:37:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC3B95FC81;
	Tue, 17 Nov 2026 13:37:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8813C11BC0008;
	Tue, 17 Nov 2026 14:37:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794922665; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=95IDR58HGwZG11mkyszy3LrlBW4ox835eXVGsWRIs2A=;
	b=MJtNRRFcuFTij/dHGe2SFqarmegUKRHo8XTzH4/Mfvwvu9eBL7QNbBYpTKkLJ+tCexjhOe
	Cz/twhKTJXtovEYcBZlewk+qr6u335s3XClL6Y2Widfi0iHnodn056ihqX2tSTLK9n85AE
	f3/pDeRFXrv00JdTkuAnWzaeTt4x2NDaQVkF6QUGuIxDLfdJlCjdF62lZKyZkhFP/OmDkL
	rOQj0gD4GEqvrKBz6SUW9fN+viNdWYAsLjKx11c1/0h2BwNCb7OglGZTyyrG88W91UWAV6
	blxUl9veO8xg8Bj8ukjcUpW0/w6D+dsn5vnTUwCMsj7bXNTsrVXjvaCnsXcf8A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Paul Cercueil <paul.cercueil@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Stefan Agner <stefan@agner.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Maxim Levitsky <maximlevitsky@gmail.com>
In-Reply-To: <20261117093751.14988-1-paul.cercueil@bootlin.com>
References: <20261117093751.14988-1-paul.cercueil@bootlin.com>
Subject: Re: [PATCH v2 00/12] mtd: Remove #ifdef guards for PM functions
Message-Id: <179492266246.2237190.12954805423683969784.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 14:37:42 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_133747_227780_6B7D7585 
X-CRM114-Status: GOOD (  11.71  )
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

T24gVHVlLCAxNyBOb3YgMjAyNiAxMDozNzozOCArMDEwMCwgUGF1bCBDZXJjdWVpbCB3cm90ZToK
PiBUaGlzIGlzIHRoZSB2MiBvZiBteSBwYXRjaHNldCB0aGF0IHVwZGF0ZXMgdGhlIE1URCBjb3Jl
IC8gTkFORCBjb3JlIGFzCj4gd2VsbCBhcyBzZXZlcmFsIGRyaXZlcnMgdG8gZ2V0IHJpZCBvZiB0
aGUgI2lmZGVmIENPTkZJR19QTSBndWFyZHMuCj4gCj4gSW5zdGVhZCwgdGhlIGNvZGUgdGhhdCBk
ZXBlbmRzIG9uIFBNIG9yIHJ1bnRpbWUgUE0gd2lsbCBiZQo+IGdhcmJhZ2UtY29sbGVjdGVkIGJ5
IHRoZSBjb21waWxlciBhdXRvbWF0aWNhbGx5IGlmIHRoaXMgY29uZmlnIG9wdGlvbiBpcwo+IG5v
dCBzZXQuCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbXRkL25leHQsIHRoYW5rcyEKClswMS8xMl0g
bXRkOiBSZW1vdmUgI2lmZGVmIGd1YXJkcyBmb3IgUE0gcmVsYXRlZCBmdW5jdGlvbnMKICAgICAg
ICBjb21taXQ6IDdmYjNlYTMxMWYxZGE2YTZlZjEzZWQ0YjRkYWI3ZmU3NGI4MmYxNjEKWzAyLzEy
XSBtdGQ6IHJhd25hbmQ6IHZmNjEwOiBSZW1vdmUgI2lmZGVmIGd1YXJkcyBmb3IgUE0gcmVsYXRl
ZCBmdW5jdGlvbnMKICAgICAgICBjb21taXQ6IGFiMTI4NDcxOTZmZGNhYzdlNzJlNDZjNTM2NjAz
NmMwMjRiMGZkOGYKWzAzLzEyXSBtdGQ6IHNwZWFyX3NtaTogUmVtb3ZlICNpZmRlZiBndWFyZHMg
Zm9yIFBNIHJlbGF0ZWQgZnVuY3Rpb25zCiAgICAgICAgY29tbWl0OiAyYTM3OTI0ZjVjODE1MmMy
NWJiNDg1Y2E4NDE5MzE3ZTA4NmExOWFhClswNC8xMl0gbXRkOiBwaHlzbWFwOiBSZW1vdmUgI2lm
ZGVmIGd1YXJkcyBhcm91bmQgc2h1dGRvd24gY2FsbGJhY2sKICAgICAgICBjb21taXQ6IGE1NGNl
ZmY2OTc2ZTIzOTY2NmY4ZjE5ZmZiYmVlYTUwYWU1Y2EzZTAKWzA1LzEyXSBtdGQ6IG1hcHM6IHB4
YTJ4eDogUmVtb3ZlICNpZmRlZiBndWFyZHMgYXJvdW5kIHNodXRkb3duIGNhbGxiYWNrCiAgICAg
ICAgY29tbWl0OiAzOTdkMjIzMDgzNzliNjQ0NTg5MDgxMWExMDdkYzk1MGQ0ZmJlYzA1ClswNi8x
Ml0gbXRkOiBuYW5kOiBtdGs6IFJlbW92ZSAjaWZkZWYgZ3VhcmRzIGZvciBQTSByZWxhdGVkIGZ1
bmN0aW9ucwogICAgICAgIGNvbW1pdDogNWQxODgzZjY5ZGY1MzdlNmVkMzRiYmEwOThjZjQ5ZjU1
OTVkZmViNgpbMDcvMTJdIG10ZDogcmF3bmFuZDogZnNtYzogUmVtb3ZlICNpZmRlZiBndWFyZHMg
Zm9yIFBNIHJlbGF0ZWQgZnVuY3Rpb25zCiAgICAgICAgY29tbWl0OiA4MWY3Y2JkYjA0MGU3Njhi
ZWQ4ZGI1NDMyMjFhMjE0YTVkZjIwNDJlClswOC8xMl0gbXRkOiByYXduYW5kOiBoaXNpNTA0OiBS
ZW1vdmUgI2lmZGVmIGd1YXJkcyBmb3IgUE0gcmVsYXRlZCBmdW5jdGlvbnMKICAgICAgICBjb21t
aXQ6IDc2YWQwMDM0ZTMwMTNkOGEwM2E3OWU2ODIwZTk3ZTk1MzdiNzY5ZDgKWzA5LzEyXSBtdGQ6
IHJhd25hbmQ6IG10azogUmVtb3ZlICNpZmRlZiBndWFyZHMgZm9yIFBNIHJlbGF0ZWQgZnVuY3Rp
b25zCiAgICAgICAgY29tbWl0OiA0MWU1OTgyNmZhMzg3YjRhMTUxY2M5N2MyOTA3ZTBkNzFhYTZi
ZDY0ClsxMC8xMl0gbXRkOiByYXduYW5kOiBvbWFwX2VsbTogUmVtb3ZlICNpZmRlZiBndWFyZHMg
Zm9yIFBNIHJlbGF0ZWQgZnVuY3Rpb25zCiAgICAgICAgY29tbWl0OiBjZTc0NTVjOGIyZmQ2OTNj
YWRiNjUwNzhkNjI1YzdlYWM5ODRlYTFiClsxMS8xMl0gbXRkOiByYXduYW5kOiByODUyOiBSZW1v
dmUgI2lmZGVmIGd1YXJkcyBmb3IgUE0gcmVsYXRlZCBmdW5jdGlvbnMKICAgICAgICBjb21taXQ6
IDZkYmM3YzMyNjcxMzI2MTgxMjUzMTEzNDA4NWM3YTNkMjNhYmYzYmUKWzEyLzEyXSBtdGQ6IHJh
d25hbmQ6IHR4eDluZGZtYzogUmVtb3ZlICNpZmRlZiBndWFyZHMgZm9yIFBNIHJlbGF0ZWQgZnVu
Y3Rpb25zCiAgICAgICAgY29tbWl0OiBkYzg4ZTE4MGVkNDg1YTdjOGM5N2UwNmM2ZjdlMGVmODk2
OTkyMjkwCgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFu
ZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29t
cGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
