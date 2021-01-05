Return-Path: <SRS0=PNEu=GI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2841C433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jan 2021 13:33:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A21AA225AC
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jan 2021 13:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A21AA225AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZefDBinu0H3KWhrsa8f7ne+7pCtM1tJxwLzllkDWT/A=; b=sdCfBTk7R27qkG0U7tWJzxbvw
	AdZl8YC9gUc5DtpDDlZ/pz192tFm1V0f7YYvOaojCsJnPkZY2GbB9+FOo+vsdxLz8IzM8GoDr+CzT
	3F38I7S5PfLzPHN33qSrtnRaxp82Cwg4BkuA1jmS0ZwXAiCQcb22NotjzpTkF6JAdEw6Lkae9iJyr
	uvRo405ds1fFYHRkPgRSQxa7YCeL74i0AtMbEigcfsqfhLIZL/m3m2qkFrUJjsPRQD/D5fSdO0BBi
	JXCK203RYwla6ky8adgQhHgPoDv038zmKXKCzPt7gvYJGxV0/r5AtJWQXz8TZmo0AmStbVo8YZQvH
	kDVxcUkxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwmRU-0005u2-9q; Tue, 05 Jan 2021 13:32:08 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwmRQ-0005tT-Iv
 for linux-mtd@lists.infradead.org; Tue, 05 Jan 2021 13:32:05 +0000
Received: from xps13 (lfbn-tou-1-1535-bdcst.w90-89.abo.wanadoo.fr
 [90.89.98.255]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id A9B69100018;
 Tue,  5 Jan 2021 13:31:58 +0000 (UTC)
Date: Tue, 5 Jan 2021 14:31:57 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <mdalam@codeaurora.org>
Subject: Re: [PATCH V2] mtd: rawnand: qcom: update last code word register
Message-ID: <20210105143157.6262f7d5@xps13>
In-Reply-To: <1609785078-22310-1-git-send-email-mdalam@codeaurora.org>
References: <1609785078-22310-1-git-send-email-mdalam@codeaurora.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_083204_722259_2ED2376A 
X-CRM114-Status: GOOD (  17.83  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 manivannan.sadhasivam@linaro.org, sricharan@codeaurora.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpNZCBTYWRyZSBBbGFtIDxtZGFsYW1AY29kZWF1cm9yYS5vcmc+IHdyb3RlIG9uIFR1
ZSwgIDUgSmFuIDIwMjEKMDA6MDE6MTggKzA1MzA6Cgo+IEZyb20gUVBJQyB2ZXJzaW9uIDIuMCBv
bndhcmRzIG5ldyByZWdpc3RlciBnb3QgYWRkZWQgdG8KPiByZWFkIGxhc3QgY29kZXdvcmQuIFRo
aXMgY2hhbmdlIHdpbGwgdXBkYXRlIHRoZSBzYW1lLgo+IAo+IEZvciBmaXJzdCB0aHJlZSBjb2Rl
IHdvcmQgUkVBRF9MT0NBVElPTl9uIHJlZ2lzdGVyIHdpbGwgYmUKPiB1c2UuRm9yIGxhc3QgY29k
ZSB3cm9kIFJFQURfTE9DQVRJT05fTEFTVF9DV19uIHJlZ2lzdGVyIHdpbGwgYmUKCnMvd3JvZC93
b3JkCgo+IHVzZS4KPiAKClBsZWFzZSBhZGQgYSBGaXhlcyB0YWcgaGVyZQoKPiBTaWduZWQtb2Zm
LWJ5OiBNZCBTYWRyZSBBbGFtIDxtZGFsYW1AY29kZWF1cm9yYS5vcmc+Cj4gLS0tCj4gW1YyXQo+
ICAqIEZpeGVkIGFsaWdubWVudCBmb3IgTkFORF9SRUFEX0xPQ0FUSU9OX0xBU1RfQ1dfbiByZWcg
bWFjcm8KPiAgKiBDaGFuZ2VkIG51bWJlciBvZiByZWdpc3RlciB3cml0ZSB0byAxIHdoZW4gTkFO
RF9SRUFEX0xPQ0FUSU9OX0xBU1RfQ1dfbiByZWdpc3RlciB3aWxsIHVzZQo+ICBkcml2ZXJzL210
ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMgfCAxMCArKysrKy0tLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21f
bmFuZGMuYwo+IGluZGV4IGVhZWY1MWQuLjllODkyMzYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9t
dGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNv
bV9uYW5kYy5jCj4gQEAgLTQ4LDEwICs0OCwxMCBAQAo+ICAjZGVmaW5lCU5BTkRfUkVBRF9MT0NB
VElPTl8xCQkweGYyNAo+ICAjZGVmaW5lCU5BTkRfUkVBRF9MT0NBVElPTl8yCQkweGYyOAo+ICAj
ZGVmaW5lCU5BTkRfUkVBRF9MT0NBVElPTl8zCQkweGYyYwo+IC0jZGVmaW5lIE5BTkRfUkVBRF9M
T0NBVElPTl9MQVNUX0NXXzAgICAgMHhmNDAKPiAtI2RlZmluZSBOQU5EX1JFQURfTE9DQVRJT05f
TEFTVF9DV18xICAgIDB4ZjQ0Cj4gLSNkZWZpbmUgTkFORF9SRUFEX0xPQ0FUSU9OX0xBU1RfQ1df
MiAgICAweGY0OAo+IC0jZGVmaW5lIE5BTkRfUkVBRF9MT0NBVElPTl9MQVNUX0NXXzMgICAgMHhm
NGMKPiArI2RlZmluZQlOQU5EX1JFQURfTE9DQVRJT05fTEFTVF9DV18wCTB4ZjQwCj4gKyNkZWZp
bmUJTkFORF9SRUFEX0xPQ0FUSU9OX0xBU1RfQ1dfMQkweGY0NAo+ICsjZGVmaW5lCU5BTkRfUkVB
RF9MT0NBVElPTl9MQVNUX0NXXzIJMHhmNDgKPiArI2RlZmluZQlOQU5EX1JFQURfTE9DQVRJT05f
TEFTVF9DV18zCTB4ZjRjCgpJdCBsb29rcyBsaWtlIHlvdSBmb3Jnb3QgdG8gc3F1YXNoIHRoaXMg
dG8geW91IG9yaWdpbmFsIHBhdGNoIDopCgo+ICAKPiAgLyogZHVtbXkgcmVnaXN0ZXIgb2Zmc2V0
cywgdXNlZCBieSB3cml0ZV9yZWdfZG1hICovCj4gICNkZWZpbmUJTkFORF9ERVZfQ01EMV9SRVNU
T1JFCQkweGRlYWQKPiBAQCAtMTEyNSw3ICsxMTI1LDcgQEAgY29uZmlnX25hbmRfY3dfcmVhZChz
dHJ1Y3QgcWNvbV9uYW5kX2NvbnRyb2xsZXIgKm5hbmRjLCBib29sIHVzZV9lY2MpCj4gIAlpZiAo
bmFuZGMtPnByb3BzLT5pc19iYW0pIHsKPiAgCQlpZiAobmFuZGMtPnByb3BzLT5xcGljX3YyKQo+
ICAJCQl3cml0ZV9yZWdfZG1hKG5hbmRjLCBOQU5EX1JFQURfTE9DQVRJT05fTEFTVF9DV18wLAo+
IC0JCQkJICAgICAgNCwgTkFORF9CQU1fTkVYVF9TR0wpOwo+ICsJCQkJICAgICAgMSwgTkFORF9C
QU1fTkVYVF9TR0wpOwo+ICAJCXdyaXRlX3JlZ19kbWEobmFuZGMsIE5BTkRfUkVBRF9MT0NBVElP
Tl8wLCA0LAo+ICAJCQkgICAgICBOQU5EX0JBTV9ORVhUX1NHTCk7Cj4gIAl9CgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
