Return-Path: <SRS0=9fF3=LE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 343B2C48BCD
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 08:22:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB9CE611CC
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 08:22:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB9CE611CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wjytW+fh7eFxa62FQXfuEuA6ccgQmpd/8j7s6rNTqpk=; b=pYhQoF2/XoAdYy
	3RBRC1sMQOBtBYTwwH1zkE+2qCG24ZPE2Ru1kSOBlwKhcMVgksHuKDSPwiGjxDtB8EKkWC8vwi0iQ
	5m9fXgpyTpwCi94nTcthsSQiPnHvqFgyLNcNr/Toon0DqqZCTZlNf1khcrMRctmBcyT1UU8/baPbs
	6U/6U3bmdpIACe5qIXcq72RbaYE9qt6s/HUt66yvLniH+ZtdYytMY1kNI/z2AHNrHB56YEnvhFtZw
	hx7tQWYyO9ldugBREJbB9JEovjmHuFbafso3yxFUQIHkl21bqZScAmrGKULt74uRhjFB4YSJUE3zm
	PUsLamJeTvW8ri86ixWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrFwR-00HSCE-Gt; Thu, 10 Jun 2021 08:21:31 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrFvl-00HRvQ-1o; Thu, 10 Jun 2021 08:20:51 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id C976720008;
 Thu, 10 Jun 2021 08:20:40 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 helmut.grohne@intenta.de, Srinivas Goud <sgoud@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v23 00/18] ARM Primecell PL35x support
Date: Thu, 10 Jun 2021 10:20:22 +0200
Message-Id: <20210610082040.2075611-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_012049_384043_59012B15 
X-CRM114-Status: GOOD (  10.59  )
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

SGVsbG8sCgpJIGFtIHRha2luZyBvdmVyIE5hZ2EncyBzZXJpZXMsIGhlcmUgYXJlIHRoZSBtYWpv
ciBjaGFuZ2VzOgoqIENsZWFuaW5nIG9mIHRoZSBTTUMgYnVzIGJpbmRpbmcgZmlsZSAoYW5kIHlh
bWwgY29udmVyc2lvbikKKiBTdXBlcmZpY2lhbCBjbGVhbmluZyBhbmQgZ3JlYXQgc2ltcGxpZmlj
YXRpb24gb2YgdGhlIFNNQyBidXMgZHJpdmVyCiogQWRkaXRpb24gb2YgYSB5YW1sIGZpbGUgZGVz
Y3JpYmluZyB0aGUgTkFORCBjb250cm9sbGVyCiogRnVsbCByZXdvcmsgb2YgdGhlIE5BTkQgY29u
dHJvbGxlciBkcml2ZXIuIEpGRlMyIGFuZCBVQklGUyBub3QgdGVzdGVkCiAgeWV0LCBvbmx5IGJh
cmUgdGVzdCB0b29scyBoYXZlIGJlZW4gdXNlZCB0byBwcm9vdmUgYmFzaWMgY29ycmVjdG5lc3MK
ICBvZiB0aGUgaGVscGVycy4KKiBBZGRpdGlvbiBvZiBhIGNvdXBsZSBvZiBNQUlOVEFJTkVSUyBl
bnRyaWVzLgoKQSBHaXRodWIgYnJhbmNoIG5hbWVkIHBsMzUzIGlzIGF2YWlsYWJsZSBvbiBteSBy
ZXBvc2l0b3J5OgpodHRwczovL2dpdGh1Yi5jb20vbWlxdWVscmF5bmFsL2xpbnV4LwoKVGhhbmtz
LApNaXF1w6hsCgpDaGFuZ2VzIGluIHYyMzoKLSBDb2xsZWN0ZWQgTmFnYSBBY2tlZC1ieSdzLgot
IFVzZWQgY29uc3QgaW5zdGVhZCBvZiBzaW5nbGUgZW51bSBlbnRyaWVzIGluIHRoZSBiaW5kaW5n
cy4KLSBEcm9wcGVkIHRoZSBhZGRyZXNzLWNlbGxzL3NpemUtY2VsbHMgc3VwZXJmbHVvdXMgZGVm
aW5pdGlvbnMgb3V0IG9mCiAgdGhlIE5BTkQgY29udHJvbGxlciBiaW5kaW5nLgotIEVuaGFuY2Vk
IHRoZSBTTUMgcmVnIHByb3BlcnR5IGRlc2NyaXB0aW9uIHRvIG1lbnRpb24gdGhhdCB0aGUgdmFy
aW91cwogIENTIGFyZSBkZXNjcmliZWQgaW4gdGhlIHJhbmdlcyBwcm9wZXJ0eS4KLSBGaXhlZCB0
aGUgU01DIGNoaWxkIG5vZGVzIHJlZ2V4IHRvIG1hdGNoIFJvYidzIHJlcXVpcmVtZW50cy4KCkNo
YW5nZXMgaW4gdjIyOgotIE1pc2MgdHlwbyBmaXhlcy4KLSBMaWdodCByZXdvcmRpbmcgb2YgYSBm
ZXcgY29tbWl0IHRpdGxlcy4KLSBOb3QgZm9yZ2V0dGluZyB0byBDYzogUm9iIGFuZCBLcnp5c3p0
b2YgdGhpcyB0aW1lLi4uCgpDaGFuZ2VzIGluIHYyMToKLSBBZGRlZCBSb2IncyBBY2tlZC1ieS9S
ZXZpZXdlZC1ieSB0YWdzLgotIEFkZHJlc3NlZCBhbGwgY29tbWVudHMgZnJvbSBSb2IgYW5kIE1p
Y2hhZWwgYWJvdXQgdGhlIGJpbmRpbmdzLgotIFRlc3RlZCBib3RoIEpGRlMyIGFuZCBVQklGUyB3
aXRoIHNpbXBsZSBmaWxlIEkvTy4KCk1pcXVlbCBSYXluYWwgKDE4KToKICBkdC1iaW5kaW5nOiBt
ZW1vcnk6IHBsMzUzLXNtYzogUmVwaHJhc2UgdGhlIGJpbmRpbmcKICBkdC1iaW5kaW5nOiBtZW1v
cnk6IHBsMzUzLXNtYzogRG9jdW1lbnQgdGhlIHJhbmdlIHByb3BlcnR5CiAgZHQtYmluZGluZzog
bWVtb3J5OiBwbDM1My1zbWM6IERyb3AgdGhlIHBhcnRpdGlvbmluZyBzZWN0aW9uCiAgZHQtYmlu
ZGluZzogbWVtb3J5OiBwbDM1My1zbWM6IERlc2NyaWJlIHRoZSBjaGlsZCByZWcgcHJvcGVydHkK
ICBkdC1iaW5kaW5nOiBtZW1vcnk6IHBsMzUzLXNtYzogRml4IHRoZSBleGFtcGxlIHN5bnRheCBh
bmQgc3R5bGUKICBkdC1iaW5kaW5nOiBtZW1vcnk6IHBsMzUzLXNtYzogRHJvcCB1bnN1cHBvcnRl
ZCBub2RlcyBmcm9tIHRoZSBleGFtcGxlCiAgZHQtYmluZGluZzogbWVtb3J5OiBwbDM1My1zbWM6
IEZpeCB0aGUgTkFORCBjb250cm9sbGVyIG5vZGUgaW4gdGhlCiAgICBleGFtcGxlCiAgZHQtYmlu
ZGluZzogbWVtb3J5OiBwbDM1My1zbWM6IEVuaGFuY2UgdGhlIGRlc2NyaXB0aW9uIG9mIHRoZSBy
ZWcKICAgIHByb3BlcnR5CiAgZHQtYmluZGluZzogbWVtb3J5OiBwbDM1My1zbWM6IENvbnZlcnQg
dG8geWFtbAogIG1lbW9yeTogcGwzNTMtc21jOiBGaXggc3R5bGUKICBtZW1vcnk6IHBsMzUzLXNt
YzogUmVuYW1lIGdvdG8gbGFiZWxzCiAgbWVtb3J5OiBwbDM1My1zbWM6IExldCBsb3dlciBsZXZl
bCBjb250cm9sbGVyIGRyaXZlcnMgaGFuZGxlIGluaXRzCiAgbWVtb3J5OiBwbDM1My1zbWM6IEF2
b2lkIHVzZWxlc3MgYWNyb255bXMgaW4gZGVzY3JpcHRpb25zCiAgbWVtb3J5OiBwbDM1My1zbWM6
IERlY2xhcmUgdmFyaWFibGVzIGZvbGxvd2luZyBhIHJldmVyc2UgY2hyaXN0bWFzCiAgICB0cmVl
IG9yZGVyCiAgTUFJTlRBSU5FUlM6IEFkZCBQTDM1MyBTTUMgZW50cnkKICBNQUlOVEFJTkVSUzog
QWRkIFBMMzUzIE5BTkQgY29udHJvbGxlciBlbnRyeQogIGR0LWJpbmRpbmdzOiBtdGQ6IHBsMzUz
LW5hbmQ6IERlc2NyaWJlIHRoaXMgaGFyZHdhcmUgY29udHJvbGxlcgogIG10ZDogcmF3bmFuZDog
cGwzNTM6IEFkZCBzdXBwb3J0IGZvciB0aGUgQVJNIFBMMzUzIFNNQyBOQU5EIGNvbnRyb2xsZXIK
CiAuLi4vbWVtb3J5LWNvbnRyb2xsZXJzL2FybSxwbDM1My1zbWMueWFtbCAgICAgfCAgMTMxICsr
CiAuLi4vYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL3BsMzUzLXNtYy50eHQgfCAgIDQ3IC0K
IC4uLi9iaW5kaW5ncy9tdGQvYXJtLHBsMzUzLW5hbmQtcjJwMS55YW1sICAgICB8ICAgNTMgKwog
TUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxNiArCiBk
cml2ZXJzL21lbW9yeS9wbDM1My1zbWMuYyAgICAgICAgICAgICAgICAgICAgfCAgMzE0ICstLS0t
CiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnICAgICAgICAgICAgICAgICAgfCAgICA4ICsK
IGRyaXZlcnMvbXRkL25hbmQvcmF3L01ha2VmaWxlICAgICAgICAgICAgICAgICB8ICAgIDEgKwog
ZHJpdmVycy9tdGQvbmFuZC9yYXcvcGwzNXgtbmFuZC1jb250cm9sbGVyLmMgIHwgMTE5NCArKysr
KysrKysrKysrKysrKwogaW5jbHVkZS9saW51eC9wbDM1My1zbWMuaCAgICAgICAgICAgICAgICAg
ICAgIHwgICAzMCAtCiA5IGZpbGVzIGNoYW5nZWQsIDE0MTMgaW5zZXJ0aW9ucygrKSwgMzgxIGRl
bGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvYXJtLHBsMzUzLXNtYy55YW1sCiBkZWxldGUgbW9k
ZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9s
bGVycy9wbDM1My1zbWMudHh0CiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL210ZC9hcm0scGwzNTMtbmFuZC1yMnAxLnlhbWwKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL210ZC9uYW5kL3Jhdy9wbDM1eC1uYW5kLWNvbnRyb2xsZXIuYwogZGVs
ZXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvcGwzNTMtc21jLmgKCi0tIAoyLjI3LjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
