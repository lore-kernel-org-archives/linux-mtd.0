Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BF8C02181
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jan 2025 11:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jdhPtVNONTGLhdJAVIa9FZ9H6QY7PGe1suxBMzpWmhw=; b=h5HkVQ8A5DNZP4
	qMxBA4Ujmos2mic1mGQfyFFwyG1IY4ec9zIHbr9PB77G/fvA7wfIALsxF6/r2BqvvPCgdQnELudaJ
	3GlRy/JAwDVkqoemvAKW5oFRWEswX6SvBMQ0PNhzGTJi5zabyR7rP6DppZdJSuEwTW1SipBh6sIDo
	lHbtB/cLWfo2tA0pfno+5nVg/9djg64ljVMSAY967lahBH+LjqUQTBn7jhCg83huKgGzSHbcyG+52
	/0EjOvdlcIx2qOAfobA9rVFJZzzXY9LBrZrSJKZYb7WhKctJIsd1ap15+KQ7bhjfulIzZkN2MFb0T
	vzzVZRcXNMpNbBgMG0oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZpjg-00000005PJ4-1aJt;
	Mon, 20 Jan 2025 11:14:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZpjd-00000005PIi-22MX
	for linux-mtd@lists.infradead.org;
	Mon, 20 Jan 2025 11:14:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 782165C5789;
	Mon, 20 Jan 2025 11:13:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8231BC4CEDD;
	Mon, 20 Jan 2025 11:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737371662;
	bh=FiHZfJm5It3gk48uNfqcMkMMJxtfqEgunXWxKM6w8SE=;
	h=From:To:Cc:Subject:Date:From;
	b=S97EuSm+r0GyShL0gCTOG5XD11jlw1diPqVo5g0D3lUyA/bS10iu63vld0tpbivVR
	 2IkPNA0FNmcJ6q6JOGXEFj/JBtO0sPBsyqbepcxsHe/8vMItLTaQu62E3wiIHX7+8J
	 H1r+3lh3BulFVKQIX5OfmuUtp/2pPWGE8Syi33Tm3OOcAfMOHhcvZRsvMtGiETOJrn
	 gUHRTPg/4dVlIcbsEak7wvY6yIfc0GoT/vKTyp20maYqqwmTFAlW23wMlOOMvlVo7b
	 oDVvMVyfCjRmmmEsOlTAaKKTr83Mv1U+lVjiv4y7gKsVjkwFpOXl+pZM+8Z4yRDCGB
	 1UcHWLW2LsEjQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>, linux-mtd@lists.infradead.org
Subject: [GIT PULL] mtd: spi-nor: changes for v6.14
Date: Mon, 20 Jan 2025 11:14:20 +0000
Message-ID: <mafs0sepd4u0j.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_031425_593942_3FEE996E 
X-CRM114-Status: UNSURE (   8.78  )
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

SGkgTWlxdWVsLAoKSGVyZSBhcmUgdGhlIFNQSSBOT1IgY2hhbmdlcyBmb3IgdjYuMTQuCgpSZWdh
cmRzLApQcmF0eXVzaCBZYWRhdgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA0
MDM4NGM4NDBlYTE5NDRkN2M1YTM5MmU4OTc1ZWQwODhlY2YwYjM3OgoKICBMaW51eCA2LjEzLXJj
MSAoMjAyNC0xMi0wMSAxNDoyODo1NiAtMDgwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCBy
ZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvbXRkL2xpbnV4LmdpdCB0YWdzL3NwaS1ub3IvZm9yLTYuMTQKCmZvciB5b3UgdG8gZmV0
Y2ggY2hhbmdlcyB1cCB0byA5NDNlNWY4NTYwMDcwOGMzNDhmN2IyM2QzYzFjZmYxY2Y5NzYzMDMy
OgoKICBtdGQ6IHNwaS1ub3I6IHN5c2ZzOiBjb25zdGlmeSAnc3RydWN0IGJpbl9hdHRyaWJ1dGUn
ICgyMDI1LTAxLTEzIDE3OjQ3OjAzICswMDAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpTUEkgTk9SIGNoYW5nZXMgZm9y
IDYuMTQKCk5vdGFibGUgY2hhbmdlczoKCi0gQWRkIGZsYXNoIGVudHJpZXMgZm9yIEF0bWVsIEFU
MjVTRjMyMSwgU3BhbnNpb24gUzI4SEwyNTZULCBTMjhITDAyR1QuCgotIEFkZCBzdXBwb3J0IGZv
ciB2Y2Mtc3VwcGx5IHJlZ3VsYXRvcnMgYW5kIHRoZWlyIERUIGJpbmRpbmdzLgoKLSBEcm9wIG14
MjV1MjU2MzVmIGVudHJ5LiBUaGUgZmxhc2ggc2hhcmVzIGl0cyBJRCB3aXRoIG14MjV1MjU2NDVn
IGFuZAogIGJvdGggcGFydHMgaGF2ZSBhbiBTRkRQIHRhYmxlLiBSZW1vdmluZyB0aGVpciBlbnRy
eSBsZXRzIHRoZW0gYmUKICBkcml2ZW4gYnkgdGhlIGdlbmVyaWMgU0ZEUC1iYXNlZCBkcml2ZXIu
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCk1hcmN1cyBGb2xrZXNzb24gKDEpOgogICAgICBtdGQ6IHNwaS1ub3I6IGF0bWVs
OiBhZGQgYXQyNXNmMzIxIGVudHJ5CgpQYXJ0aCBQYW5jaG9saSAoMSk6CiAgICAgIG10ZDogc3Bp
LW5vcjogbWFjcm9uaXg6IHJlbW92ZSBteDI1dTI1NjM1ZiBmcm9tIHBhcnRzIGxpc3QgdG8gZW5h
YmxlIFNGRFAKClBlbmcgRmFuICgyKToKICAgICAgZHQtYmluZGluZ3M6IG10ZDogamVkZWMsc3Bp
LW5vcjogYWRkIG9wdGlvbmFsIHZjYy1zdXBwbHkKICAgICAgbXRkOiBzcGktbm9yOiBzdXBwb3J0
IHZjYy1zdXBwbHkgcmVndWxhdG9yCgpUYWthaGlybyBLdXdhbm8gKDIpOgogICAgICBtdGQ6IHNw
aS1ub3I6IHNwYW5zaW9uOiBBZGQgc3VwcG9ydCBmb3IgUzI4SEwyNTZUCiAgICAgIG10ZDogc3Bp
LW5vcjogc3BhbnNpb246IEFkZCBzdXBwb3J0IGZvciBTMjhITDAyR1QKClRob21hcyBXZWnDn3Nj
aHVoICgxKToKICAgICAgbXRkOiBzcGktbm9yOiBzeXNmczogY29uc3RpZnkgJ3N0cnVjdCBiaW5f
YXR0cmlidXRlJwoKVHVkb3IgQW1iYXJ1cyAoMyk6CiAgICAgIG10ZDogc3BpLW5vcjogbWFjcm9u
aXg6IHVzZSBub3ItPmFkZHJfbmJ5dGVzCiAgICAgIG10ZDogc3BpLW5vcjogdXNlIGxvY2FsIHZh
cmlhYmxlIGZvciBzdHJ1Y3QgZGV2aWNlCiAgICAgIG10ZDogc3BpLW5vcjogZXh0ZW5kIGRlc2Ny
aXB0aW9uIG9mIHNpemUgbWVtYmVyIG9mIHN0cnVjdCBmbGFzaF9pbmZvCgogLi4uL2RldmljZXRy
ZWUvYmluZGluZ3MvbXRkL2plZGVjLHNwaS1ub3IueWFtbCAgICAgICAgfCAgNCArKysrCiBkcml2
ZXJzL210ZC9zcGktbm9yL2F0bWVsLmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICsr
KysKIGRyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgMTkgKysrKysrKysrKysrLS0tLS0tLQogZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmggICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgNiArKysrKy0KIGRyaXZlcnMvbXRkL3NwaS1ub3Iv
bWFjcm9uaXguYyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDkgKystLS0tLS0tCiBkcml2ZXJz
L210ZC9zcGktbm9yL3NwYW5zaW9uLmMgICAgICAgICAgICAgICAgICAgICAgICB8IDEwICsrKysr
KysrKysKIGRyaXZlcnMvbXRkL3NwaS1ub3Ivc3lzZnMuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDggKysrKy0tLS0KIDcgZmlsZXMgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKSwgMTkg
ZGVsZXRpb25zKC0pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
