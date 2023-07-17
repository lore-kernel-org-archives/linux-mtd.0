Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF46EB64DD
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jul 2023 02:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=utLWWbASOH0TFYXYFkfl2Qrhi35f6Hv9NKsZJanZ4Rc=; b=sITnZWiYb/HCEK
	hMuxv4xmTOQTrpo2DxEcJDF6EhiqQiOJqRiulJTxTpzsBh0r9xR9bB1sL0M0zgsSoU0wxBF4Yi9ao
	+tfysKhkz1WrrKF/HXfVbLWYx+bjWJe/1XVKKUx0noOG+bsAa6Fkg2BEMdutJDmm2WuRRj8oP3yxg
	s3RYwK3FFXXK/npcGrgjEwIkr0PLbepJ7znCCM3eDBXSIDlKZjJh5tpV0eiF6KehSrIO1//MW3Vq+
	rjSXzxBQ1xKAZwNZylyORDllag2OaR23DSExJWL354ih6KNvxn+WVPvsNedhfutKMnpzn+uWbW4wL
	JFm/CEeVCgRys3WP66nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLE0k-000rcy-1x;
	Mon, 17 Jul 2023 02:30:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLE0g-000rZk-3B;
	Mon, 17 Jul 2023 02:30:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 757EB60F08;
	Mon, 17 Jul 2023 02:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 918A7C433C7;
	Mon, 17 Jul 2023 02:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689561049;
	bh=E+xDwjpkQfi1MkqCy8R2TD6sbM4fMIj72Fr8vgjOz54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H2lwittpXEf+RkZS4ZO69yL5S9OCbU0MNRElWUIrKeuVGab+A8kn8ojilBmrzF63A
	 vO6+aynH8fC6BFPgEf0xcsEO1GutIvA9qfYGWT4L0GF4OSK7ccLr8HwFn9XCaUC0bF
	 6ocibGzhzk/YDTOs1UR1P2j16RQUq6/GFCRgPl5eh5m1iR4qglhgclPwXOvW1MDAc4
	 silbtyXs31Ubs4iK+OAX/0nu+qd495yj1vzh9tg7JfOPRixciKbJmJ97m/bUTTMOBF
	 HBbh94YP2BrO2FmPH6DHYIN2PphDmOtvUbWDyY3K5ioRvgBWeSXZ8txc09ZiaX2LWE
	 PdWxv9CUBQ45Q==
Date: Mon, 17 Jul 2023 08:00:38 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/8] mtd: rawnand: qcom: Fix a typo
Message-ID: <20230717023038.GF5996@thinkpad>
References: <20230716144612.32132-1-miquel.raynal@bootlin.com>
 <20230716144612.32132-7-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230716144612.32132-7-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_193051_067679_623729D8 
X-CRM114-Status: GOOD (  15.72  )
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

T24gU3VuLCBKdWwgMTYsIDIwMjMgYXQgMDQ6NDY6MTBQTSArMDIwMCwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPiBGaXggdGhlIGZvbGxvd2luZyBjaGVja3BhdGNoIHdhcm5pbmc6Cj4gCUNIRUNLOiAn
dHJhbmFzY3Rpb24nIG1heSBiZSBtaXNzcGVsbGVkIC0gcGVyaGFwcyAndHJhbnNhY3Rpb24nPwo+
IAo+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5j
b20+CgpBY2tlZC1ieTogTWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5pQGtlcm5lbC5vcmc+Cgot
IE1hbmkKCj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYyB8IDIgKy0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYyBiL2RyaXZlcnMvbXRk
L25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+IGluZGV4IDNhZGM0MGVmNWNmNi4uY2I2Y2NhYTE5MjI0
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+ICsrKyBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+IEBAIC0zMTQ0LDcgKzMxNDQsNyBA
QCBzdGF0aWMgaW50IHFjb21fbmFuZGNfYWxsb2Moc3RydWN0IHFjb21fbmFuZF9jb250cm9sbGVy
ICpuYW5kYykKPiAgCQkvKgo+ICAJCSAqIEluaXRpYWxseSBhbGxvY2F0ZSBCQU0gdHJhbnNhY3Rp
b24gdG8gcmVhZCBPTkZJIHBhcmFtIHBhZ2UuCj4gIAkJICogQWZ0ZXIgZGV0ZWN0aW5nIGFsbCB0
aGUgZGV2aWNlcywgdGhpcyBCQU0gdHJhbnNhY3Rpb24gd2lsbAo+IC0JCSAqIGJlIGZyZWVkIGFu
ZCB0aGUgbmV4dCBCQU0gdHJhbmFzY3Rpb24gd2lsbCBiZSBhbGxvY2F0ZWQgd2l0aAo+ICsJCSAq
IGJlIGZyZWVkIGFuZCB0aGUgbmV4dCBCQU0gdHJhbnNhY3Rpb24gd2lsbCBiZSBhbGxvY2F0ZWQg
d2l0aAo+ICAJCSAqIG1heGltdW0gY29kZXdvcmQgc2l6ZQo+ICAJCSAqLwo+ICAJCW5hbmRjLT5t
YXhfY3dwZXJwYWdlID0gMTsKPiAtLSAKPiAyLjM0LjEKPiAKCi0tIArgrq7grqPgrr/grrXgrqPg
r43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
