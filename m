Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298F3606A31B
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 11:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p1gzlMsj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cj1O+bRG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qE/Inf9roZd2zBYDJtgyBKga+arUsf/kaZ4+BP2SqUQ=; b=p1gzlMsjIGACNqH3jrYWUdX2ML
	Qy57By0KP71Ec2I2THwrGVDoSFQ9bcjQ27atYI1tflp3dFKltB9tmjBM8VWLe+TEu7yq+ADsmZ17n
	eXpAWHD2AOIH3p3JMNc8eOaQI8Ix8KG43d1pD1xhVGxDg2dGGzUpdBBc4yAVQ5DNodgWZb/eWDekY
	82Odj0e7NwvXxd78Ws8oe/DkaM6oslDhhRuA37pJjFGxW2fPv5zVBgcTZ+ldum9w4h6XnJqgHFOFF
	2uli3tO3rzbxbRfEhOBvaLopVcve780OnJOZ4imj1eHfrTwCma9tBQvv3ple3x1uWBuwLhXQ8PaUK
	Ewon+CFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvUA-00000008cDI-1wCK;
	Thu, 05 Nov 2026 11:18:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvU3-00000008cCH-01O7
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 11:18:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F82960DA0;
	Thu,  5 Nov 2026 11:18:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 253251F000C1;
	Thu,  5 Nov 2026 11:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793877498;
	bh=rwkoPLfqLMt8+KY9KmDINo6RWXIs/1Kdx/CcqZY0kiw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cj1O+bRGbMIw+OUOgTIrCCzEjiql24LmruT9mzBkkAiqyP5GiUrnVv4OdyMJ9nNrA
	 SsEhICNYeLEOwsY0P1TJX8JAbzFLAmGYVsTpM9DBl2LXPM5SH6y0ansl49MAsWQwpD
	 C/PhwTM2NbyPr+sAm/LcwsVpaW2DlnV/wuEp8DnOcXP0zWw4kdKpsf/LCLR/hh1/F7
	 IgnuEoc4Deld5sYyhJK/xkbmCNC0SDiybaGlxl5E3L5D7C92o3qdLexJXdS8mZD5Q5
	 +WIClJJBVL9Hv93CmUnuHf4ERtVMhJMVhXUHU3N27crP8AUCy4KGtJaNifjO/xVaG4
	 SkVWsyS4v/Hhw==
Message-ID: <sashiko-outbox-198934@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 03/19] spi: parse spi-max-post-config-frequency-hz
 into post_config_max_speed_hz
To: "Santhosh Kumar K" <s-k6@ti.com>, broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, praneeth@ti.com, sebin.francis@ti.com, u-kumar1@ti.com, srikanth.boyapally@amd.com, m-shah@ti.com
In-Reply-To: <20261105105832.2134313-4-s-k6@ti.com>
References: <20261105105832.2134313-1-s-k6@ti.com>
 <20261105105832.2134313-4-s-k6@ti.com>
Date: Thu, 05 Nov 2026 11:18:16 +0000
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gc3BpOiB1bmNsYW1w
ZWQgcG9zdF9jb25maWdfbWF4X3NwZWVkX2h6IGluIF9fc3BpX3NldHVwKCkKLS0KCmNvbW1pdCAz
YTU3NWRiYzI2Yzc4MWUyZjNiYjRkMmU1MzNkZTZkYTkyNzE1YzUxCkF1dGhvcjogU2FudGhvc2gg
S3VtYXIgSyA8cy1rNkB0aS5jb20+CgpzcGk6IHBhcnNlIHNwaS1tYXgtcG9zdC1jb25maWctZnJl
cXVlbmN5LWh6IGludG8gcG9zdF9jb25maWdfbWF4X3NwZWVkX2h6CgpUaGlzIGNvbW1pdCBhZGRz
IHBvc3RfY29uZmlnX21heF9zcGVlZF9oeiB0byBzdHJ1Y3Qgc3BpX2RldmljZSBhbmQgcGFyc2Vz
Cml0IGZyb20gdGhlIHNwaS1tYXgtcG9zdC1jb25maWctZnJlcXVlbmN5LWh6IGRldmljZSB0cmVl
IHByb3BlcnR5IGluCm9mX3NwaV9wYXJzZV9kdCgpLiBUaGlzIGFsbG93cyBTUEkgZGV2aWNlcyB0
byBzcGVjaWZ5IGEgaGlnaGVyIHRhcmdldApjbG9jayBmcmVxdWVuY3kgdG8gYmUgdXNlZCBhZnRl
ciBjb250cm9sbGVyLXNpZGUgY29uZmlndXJhdGlvbiBzdWNoIGFzIFBIWQp0dW5pbmcuCgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9zcGkuYyBiL2RyaXZlcnMvc3BpL3NwaS5jCj4gaW5kZXgg
YzI5ZmZhYzU5YzhmMC4uM2Y2YWRkMjExNTRlZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3NwaS9z
cGkuYwo+ICsrKyBiL2RyaXZlcnMvc3BpL3NwaS5jCj4gQEAgLTI4MjUsNiArMjgyNSw4IEBAIHN0
YXRpYyBpbnQgb2Zfc3BpX3BhcnNlX2R0KHN0cnVjdCBzcGlfY29udHJvbGxlciAqY3Rsciwgc3Ry
dWN0IHNwaV9kZXZpY2UgKnNwaSwKPiAgCS8qIERldmljZSBzcGVlZCAqLwo+ICAJaWYgKCFvZl9w
cm9wZXJ0eV9yZWFkX3UzMihuYywgInNwaS1tYXgtZnJlcXVlbmN5IiwgJnZhbHVlKSkKPiAgCQlz
cGktPm1heF9zcGVlZF9oeiA9IHZhbHVlOwo+ICsJaWYgKCFvZl9wcm9wZXJ0eV9yZWFkX3UzMihu
YywgInNwaS1tYXgtcG9zdC1jb25maWctZnJlcXVlbmN5LWh6IiwgJnZhbHVlKSkKPiArCQlzcGkt
PnBvc3RfY29uZmlnX21heF9zcGVlZF9oeiA9IHZhbHVlOwoKW1NldmVyaXR5OiBNZWRpdW1dCkFz
IHJlcG9ydGVkIGJ5IFNhc2hpa28gb24gdjQgWzFdLCB3aGVuIGEgZGV2aWNlIHRyZWUgbm9kZSBz
cGVjaWZpZXMgYQpzcGktbWF4LXBvc3QtY29uZmlnLWZyZXF1ZW5jeS1oeiB2YWx1ZSB0aGF0IGV4
Y2VlZHMgdGhlIHBhcmVudCBjb250cm9sbGVyJ3MKc3BpLT5jb250cm9sbGVyLT5tYXhfc3BlZWRf
aHogbGltaXQsIGNhbiBzcGktPnBvc3RfY29uZmlnX21heF9zcGVlZF9oegpyZW1haW4gdW5jYXBw
ZWQ/CgpEdXJpbmcgZGV2aWNlIHJlZ2lzdHJhdGlvbiwgb2ZfcmVnaXN0ZXJfc3BpX2RldmljZSgp
IGNhbGxzIG9mX3NwaV9wYXJzZV9kdCgpCmFuZCB0aGVuIHNwaV9hZGRfZGV2aWNlKCkgLT4gX19z
cGlfYWRkX2RldmljZSgpIC0+IF9fc3BpX3NldHVwKCkuIEluCl9fc3BpX3NldHVwKCksIHNwaS0+
bWF4X3NwZWVkX2h6IGlzIGNsYW1wZWQgdG8gdGhlIGNvbnRyb2xsZXIncyBtYXhpbXVtCnNwZWVk
LCBidXQgc3BpLT5wb3N0X2NvbmZpZ19tYXhfc3BlZWRfaHogaXMgbm90OgoKZHJpdmVycy9zcGkv
c3BpLmM6X19zcGlfc2V0dXAoKSB7CiAgICAuLi4KCWlmIChzcGktPmNvbnRyb2xsZXItPm1heF9z
cGVlZF9oeiAmJgoJICAgICghc3BpLT5tYXhfc3BlZWRfaHogfHwKCSAgICAgc3BpLT5tYXhfc3Bl
ZWRfaHogPiBzcGktPmNvbnRyb2xsZXItPm1heF9zcGVlZF9oeikpCgkJc3BpLT5tYXhfc3BlZWRf
aHogPSBzcGktPmNvbnRyb2xsZXItPm1heF9zcGVlZF9oejsKICAgIC4uLgp9CgpTaG91bGQgX19z
cGlfc2V0dXAoKSBhbHNvIGNsYW1wIHNwaS0+cG9zdF9jb25maWdfbWF4X3NwZWVkX2h6IHRvCnNw
aS0+Y29udHJvbGxlci0+bWF4X3NwZWVkX2h6IHdoZW4gYm90aCBhcmUgbm9uLXplcm8sIHNvIHRo
YXQKcG9zdC1jb25maWd1cmF0aW9uIFNQSS1NRU0gb3BlcmF0aW9ucyBhbmQgUEhZIHR1bmluZyBk
byBub3QgcmVxdWVzdCBhCmZyZXF1ZW5jeSBhYm92ZSB0aGUgY29udHJvbGxlcidzIGhhcmR3YXJl
IGxpbWl0PwoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjA2MTgwNzU0NDUuMzg5
RTExRjAwMEU5QHNtdHAua2VybmVsLm9yZwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBz
Oi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTEwNTEwNTgzMi4yMTM0MzEzLTEtcy1rNkB0
aS5jb20/cGFydD0zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
