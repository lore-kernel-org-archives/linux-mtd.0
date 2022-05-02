Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10856C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  2 May 2022 08:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p1JhDj6JN54QBnuXjdEiUuTuBHjbueb+GGvMxkZO5WA=; b=G+mwXax4ZFeM9f
	RspwfDinbpSsiPJdkPtRc+mLtiFOxBUtxbBCec+FwcR1Tkv6rm2EGElo0KswVC5NnoOo0JLwCR7+l
	c0wFsa9WzxnR3Hg8R7vzDOWIowoVvRsF74uVDfNd5QU53UxUmAdc//6h28Oz9KLFkZkY0ijckdWVJ
	USueGVn5KF6HkfjZBC34FP4gqt01H62iCs48qyz4kpyO3dTG3hGaPGXAyqTkn5JU6kiIpyvmstdG1
	HnogrieRCU5/39uHsVHKnP4jXbGm7cREL5bOkSO7dVOP4+ROAkmqWLaUzUF79inRdh2V0jhN+9hHz
	DlL0qZ+2mEJjrgt7kGGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlRE4-000H2n-6O; Mon, 02 May 2022 08:16:12 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlRCE-000Ful-TT; Mon, 02 May 2022 08:14:21 +0000
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KsG8T4Zx9z4xXk;
 Mon,  2 May 2022 18:14:17 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KsG8N2D3yz4x7Y;
 Mon,  2 May 2022 18:14:12 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Tao Ren <rentao.bupt@gmail.com>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Subject: [PATCH v5 04/11] spi: aspeed: Add support for direct mapping
Date: Mon,  2 May 2022 10:13:34 +0200
Message-Id: <20220502081341.203369-5-clg@kaod.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502081341.203369-1-clg@kaod.org>
References: <20220502081341.203369-1-clg@kaod.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_011420_091551_27DDC2E3 
X-CRM114-Status: GOOD (  17.91  )
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

VXNlIGRpcmVjdCBtYXBwaW5nIHRvIHJlYWQgdGhlIGZsYXNoIGRldmljZSBjb250ZW50cy4gVGhp
cyBvcGVyYXRpb24KbW9kZSBpcyBjYWxsZWQgIkNvbW1hbmQgbW9kZSIgb24gQXNwZWVkIFNvQyBT
TUMgY29udHJvbGxlcnMuIEl0IHVzZXMgYQpDb250cm9sIFJlZ2lzdGVyIGZvciB0aGUgc2V0dGlu
Z3MgdG8gYXBwbHkgd2hlbiBhIG1lbW9yeSBvcGVyYXRpb24gaXMKcGVyZm9ybWVkIG9uIHRoZSBm
bGFzaCBkZXZpY2UgbWFwcGluZyB3aW5kb3cuCgpJZiB0aGUgd2luZG93IGlzIG5vdCBiaWcgZW5v
dWdoLCBmYWxsIGJhY2sgdG8gdGhlICJVc2VyIG1vZGUiIHRvCnBlcmZvcm0gdGhlIHJlYWQuCgpE
aXJlY3QgbWFwcGluZyBmb3Igd3JpdGVzIHdpbGwgY29tZSBsYXRlciB3aGVuIHZhbGlkYXRlZC4K
ClJldmlld2VkLWJ5OiBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1PgpUZXN0ZWQtYnk6IEpv
ZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+ClRlc3RlZC1ieTogVGFvIFJlbiA8cmVudGFvLmJ1
cHRAZ21haWwuY29tPgpUZXN0ZWQtYnk6IEphZSBIeXVuIFlvbyA8cXVpY19qYWVoeW9vQHF1aWNp
bmMuY29tPgpTaWduZWQtb2ZmLWJ5OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgot
LS0KIGRyaXZlcnMvc3BpL3NwaS1hc3BlZWQtc21jLmMgfCA2OCArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2OCBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLWFzcGVlZC1zbWMuYyBiL2RyaXZlcnMvc3BpL3NwaS1h
c3BlZWQtc21jLmMKaW5kZXggY2I1YTA2NTJlNWE0Li41MGNjN2JkN2JhM2UgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvc3BpL3NwaS1hc3BlZWQtc21jLmMKKysrIGIvZHJpdmVycy9zcGkvc3BpLWFzcGVl
ZC1zbWMuYwpAQCAtNDExLDEwICs0MTEsNzggQEAgc3RhdGljIGludCBhc3BlZWRfc3BpX2NoaXBf
c2V0X2RlZmF1bHRfd2luZG93KHN0cnVjdCBhc3BlZWRfc3BpX2NoaXAgKmNoaXApCiAJcmV0dXJu
IGNoaXAtPmFoYl93aW5kb3dfc2l6ZSA/IDAgOiAtMTsKIH0KIAorc3RhdGljIGludCBhc3BlZWRf
c3BpX2Rpcm1hcF9jcmVhdGUoc3RydWN0IHNwaV9tZW1fZGlybWFwX2Rlc2MgKmRlc2MpCit7CisJ
c3RydWN0IGFzcGVlZF9zcGkgKmFzcGkgPSBzcGlfY29udHJvbGxlcl9nZXRfZGV2ZGF0YShkZXNj
LT5tZW0tPnNwaS0+bWFzdGVyKTsKKwlzdHJ1Y3QgYXNwZWVkX3NwaV9jaGlwICpjaGlwID0gJmFz
cGktPmNoaXBzW2Rlc2MtPm1lbS0+c3BpLT5jaGlwX3NlbGVjdF07CisJc3RydWN0IHNwaV9tZW1f
b3AgKm9wID0gJmRlc2MtPmluZm8ub3BfdG1wbDsKKwl1MzIgY3RsX3ZhbDsKKwlpbnQgcmV0ID0g
MDsKKworCWNoaXAtPmNsa19mcmVxID0gZGVzYy0+bWVtLT5zcGktPm1heF9zcGVlZF9oejsKKwor
CS8qIE9ubHkgZm9yIHJlYWRzICovCisJaWYgKG9wLT5kYXRhLmRpciAhPSBTUElfTUVNX0RBVEFf
SU4pCisJCXJldHVybiAtRU9QTk9UU1VQUDsKKworCWlmIChkZXNjLT5pbmZvLmxlbmd0aCA+IGNo
aXAtPmFoYl93aW5kb3dfc2l6ZSkKKwkJZGV2X3dhcm4oYXNwaS0+ZGV2LCAiQ0UlZCB3aW5kb3cg
KCVkTUIpIHRvbyBzbWFsbCBmb3IgbWFwcGluZyIsCisJCQkgY2hpcC0+Y3MsIGNoaXAtPmFoYl93
aW5kb3dfc2l6ZSA+PiAyMCk7CisKKwkvKiBEZWZpbmUgdGhlIGRlZmF1bHQgSU8gcmVhZCBzZXR0
aW5ncyAqLworCWN0bF92YWwgPSByZWFkbChjaGlwLT5jdGwpICYgfkNUUkxfSU9fQ01EX01BU0s7
CisJY3RsX3ZhbCB8PSBhc3BlZWRfc3BpX2dldF9pb19tb2RlKG9wKSB8CisJCW9wLT5jbWQub3Bj
b2RlIDw8IENUUkxfQ09NTUFORF9TSElGVCB8CisJCUNUUkxfSU9fRFVNTVlfU0VUKG9wLT5kdW1t
eS5uYnl0ZXMgLyBvcC0+ZHVtbXkuYnVzd2lkdGgpIHwKKwkJQ1RSTF9JT19NT0RFX1JFQUQ7CisK
KwkvKiBUdW5lIDRCWVRFIGFkZHJlc3MgbW9kZSAqLworCWlmIChvcC0+YWRkci5uYnl0ZXMpIHsK
KwkJdTMyIGFkZHJfbW9kZSA9IHJlYWRsKGFzcGktPnJlZ3MgKyBDRV9DVFJMX1JFRyk7CisKKwkJ
aWYgKG9wLT5hZGRyLm5ieXRlcyA9PSA0KQorCQkJYWRkcl9tb2RlIHw9ICgweDExIDw8IGNoaXAt
PmNzKTsKKwkJZWxzZQorCQkJYWRkcl9tb2RlICY9IH4oMHgxMSA8PCBjaGlwLT5jcyk7CisJCXdy
aXRlbChhZGRyX21vZGUsIGFzcGktPnJlZ3MgKyBDRV9DVFJMX1JFRyk7CisJfQorCisJLyogUkVB
RCBtb2RlIGlzIHRoZSBjb250cm9sbGVyIGRlZmF1bHQgc2V0dGluZyAqLworCWNoaXAtPmN0bF92
YWxbQVNQRUVEX1NQSV9SRUFEXSA9IGN0bF92YWw7CisJd3JpdGVsKGNoaXAtPmN0bF92YWxbQVNQ
RUVEX1NQSV9SRUFEXSwgY2hpcC0+Y3RsKTsKKworCWRldl9pbmZvKGFzcGktPmRldiwgIkNFJWQg
cmVhZCBidXN3aWR0aDolZCBbMHglMDh4XVxuIiwKKwkJIGNoaXAtPmNzLCBvcC0+ZGF0YS5idXN3
aWR0aCwgY2hpcC0+Y3RsX3ZhbFtBU1BFRURfU1BJX1JFQURdKTsKKworCXJldHVybiByZXQ7Cit9
CisKK3N0YXRpYyBzc2l6ZV90IGFzcGVlZF9zcGlfZGlybWFwX3JlYWQoc3RydWN0IHNwaV9tZW1f
ZGlybWFwX2Rlc2MgKmRlc2MsCisJCQkJICAgICAgdTY0IG9mZnNldCwgc2l6ZV90IGxlbiwgdm9p
ZCAqYnVmKQoreworCXN0cnVjdCBhc3BlZWRfc3BpICphc3BpID0gc3BpX2NvbnRyb2xsZXJfZ2V0
X2RldmRhdGEoZGVzYy0+bWVtLT5zcGktPm1hc3Rlcik7CisJc3RydWN0IGFzcGVlZF9zcGlfY2hp
cCAqY2hpcCA9ICZhc3BpLT5jaGlwc1tkZXNjLT5tZW0tPnNwaS0+Y2hpcF9zZWxlY3RdOworCisJ
LyogU3dpdGNoIHRvIFVTRVIgY29tbWFuZCBtb2RlIGlmIG1hcHBpbmcgd2luZG93IGlzIHRvbyBz
bWFsbCAqLworCWlmIChjaGlwLT5haGJfd2luZG93X3NpemUgPCBvZmZzZXQgKyBsZW4pIHsKKwkJ
aW50IHJldDsKKworCQlyZXQgPSBhc3BlZWRfc3BpX3JlYWRfdXNlcihjaGlwLCAmZGVzYy0+aW5m
by5vcF90bXBsLCBvZmZzZXQsIGxlbiwgYnVmKTsKKwkJaWYgKHJldCA8IDApCisJCQlyZXR1cm4g
cmV0OworCX0gZWxzZSB7CisJCW1lbWNweV9mcm9taW8oYnVmLCBjaGlwLT5haGJfYmFzZSArIG9m
ZnNldCwgbGVuKTsKKwl9CisKKwlyZXR1cm4gbGVuOworfQorCiBzdGF0aWMgY29uc3Qgc3RydWN0
IHNwaV9jb250cm9sbGVyX21lbV9vcHMgYXNwZWVkX3NwaV9tZW1fb3BzID0gewogCS5zdXBwb3J0
c19vcCA9IGFzcGVlZF9zcGlfc3VwcG9ydHNfb3AsCiAJLmV4ZWNfb3AgPSBhc3BlZWRfc3BpX2V4
ZWNfb3AsCiAJLmdldF9uYW1lID0gYXNwZWVkX3NwaV9nZXRfbmFtZSwKKwkuZGlybWFwX2NyZWF0
ZSA9IGFzcGVlZF9zcGlfZGlybWFwX2NyZWF0ZSwKKwkuZGlybWFwX3JlYWQgPSBhc3BlZWRfc3Bp
X2Rpcm1hcF9yZWFkLAogfTsKIAogc3RhdGljIHZvaWQgYXNwZWVkX3NwaV9jaGlwX3NldF90eXBl
KHN0cnVjdCBhc3BlZWRfc3BpICphc3BpLCB1bnNpZ25lZCBpbnQgY3MsIGludCB0eXBlKQotLSAK
Mi4zNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
