Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A622105F780
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2026 08:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oZaBzGCYreA/jKkschuMn8he455hKIOxjQpUCE9wnPM=; b=14+FyeKjlEVEJP
	KbHjmINMku1tJ4EZlE+Kq6N+xlaVcVUBooyAnzRGX9p11eGZS3fd3h1/kdGL0rtd1n8w9po+1LoC6
	/Xp/ETdil973aAkIYJwVRSj5IZ+fFsjMFVZ2HhiLY3KVbUpB5NhQLV89nSoNWuBv65qk4lYFACw9f
	KM9UyOvH0GFQM0u4LEfaB6D7v+aoIcevLb0hHyNbHLqCyk80yKdlEcQzvLzNaf9sgjoubRgWpirl8
	NBdUmau5GnR0LuLG/LdH+mmKKsj/rLKYD7pZdJZfDZTfXcrj6l3Tg/+HGOjl0h8mCnSwMeLZfN3Dt
	RCVzKqSGcRHN/DpCCWTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yJT-0000000HJrK-01h6;
	Fri, 13 Mar 2026 08:56:07 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yJP-0000000HJoh-09G5
	for linux-mtd@lists.infradead.org;
	Fri, 13 Mar 2026 08:56:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 991104E4266E;
	Fri, 13 Mar 2026 08:55:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6912860027;
	Fri, 13 Mar 2026 08:55:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CDB0E10369DC5;
	Fri, 13 Mar 2026 09:55:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773392156; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=C8G5zc0+/sCb6Br0wkWNI7EkWcFaxuigSoQ2wuJ+Bf4=;
	b=dsewY0/Ug5VCX+Qk1CqJ9I5HVhvACekpGVVBBsU/rLPoJnMqy8OYX0vwJofR5tgILOppXl
	tQ5z/9yRHofMCJyBlEZDx+TBIOoroFNihyrUX6pc3EEgJ3qUIye7A0qN38RYqgLq7Y2T0U
	/2mqWS6zxBc4/xso6RZIoghskfxax4mBrpndKybujufTwy7HUVkGR9ErANKred7NzKXje6
	Mfs2kTpe1VE2drFPGgDii/GZjRqHN3ZD33nDRS75eolAQryWB0QsS7efzejGddBycpxmrv
	mzHfkZaYMtSDIE1uE9ptqVKsyc1SWCdq2beGGjsXTgnSFMSW8+9C+euxkLar0A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Akhila YS <akhilayalmati@gmail.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: hisilicon,504-nfc: convert to DT schema
In-Reply-To: <20260312152851.GA3190071-robh@kernel.org> (Rob Herring's message
	of "Thu, 12 Mar 2026 10:28:51 -0500")
References: <20260307-hisi504-1-v1-1-8bf9a186faf2@gmail.com>
	<20260312152851.GA3190071-robh@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 13 Mar 2026 09:55:53 +0100
Message-ID: <87y0jwjeg6.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_015603_230738_2D60A289 
X-CRM114-Status: UNSURE (   8.95  )
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

SGVsbG8sCgo+PiArICAiI2FkZHJlc3MtY2VsbHMiOgo+PiArICAgIGNvbnN0OiAxCj4+ICsKPj4g
KyAgIiNzaXplLWNlbGxzIjoKPj4gKyAgICBjb25zdDogMAo+Cj4gVGhlc2UgY2FuIGJlIGRyb3Bw
ZWQgYXMgdGhlIGNoaWxkIChwYXJ0aXRpb25zKSBkb2Vzbid0IGhhdmUgYW4KPiBhZGRyZXNzLgoK
V2VsbCwgdGhlIGNoaWxkIHNob3VsZCwgYmVjYXVzZSBpdCBzaG91bGQgYmUgdGhlIE5BTkQgZGV2
aWNlICh3aXRoLCBhcwphZGRyZXNzLCB0aGUgY2hpcCBDUykgaW5zdGVhZCBvZiAncGFydGl0aW9u
cycuIElmIHRoZSBkcml2ZXIgaW4gZnJvbnQgb2YKdGhhdCBiaW5kaW5nIGRvZXMgbm90IHN1cHBv
cnQgdGhhdCwgcGxlYXNlIHdhaXQgZm9yIEZyYW5rIExpJ3Mgd29yayB0bwpjbGVhcmx5IGlkZW50
aWZ5IHRoZSBsZWdhY3kgYmluZGluZ3MgdG8gYmUgbWVyZ2VkIGFuZCByZWZlcmVuY2UgaXQgaW4K
dGhlIHRvcCBsZXZlbCBhbGxPZi4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
