Return-Path: <SRS0=0HiW=ED=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90F0FC4363A
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 10:23:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0103E246B1
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 10:23:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K2cXSbxL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0103E246B1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZvL4wbOAG04/D1IZo3Q6FLXSxrzwEFnM+e7TNEhvQMA=; b=K2cXSbxLayfF5Fh2A7Rkp98eC
	U7b4EAW+Ga4R6Hcq6aetPmwFnLcaYSOU34Gkh/QwFkDlAKYCA9u/DfgZzacGuiox3/LEWpBshKvCA
	FAjMbeeWpUnnldk/xwqeiF7KyccR/jCxNqoavW6arUsPg96V9AQvjFpw7SDQHs0L0z7pkP+aZfrs+
	Rjg8qdzXXqrakdaM0BjW0rXdV7lyLmyfe/CRMYSOcWt8Cj5BQven+oAFfeKXpe3gvAyg3PvIXV2qB
	9Y9Jvtlct75WeQTn/5V17Wph+KehB/lEZJwrL7UtYNdZn7Wdee/OEsnx10//FIzHUVP900Yx1PMu1
	SO2WPlNtA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXib5-0007JJ-A8; Wed, 28 Oct 2020 10:22:27 +0000
Received: from mslow2.mail.gandi.net ([217.70.178.242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXib2-0007IP-1t
 for linux-mtd@lists.infradead.org; Wed, 28 Oct 2020 10:22:24 +0000
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 412983B2DB0
 for <linux-mtd@lists.infradead.org>; Wed, 28 Oct 2020 10:09:04 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 35AD01BF20B;
 Wed, 28 Oct 2020 10:08:36 +0000 (UTC)
Date: Wed, 28 Oct 2020 11:08:35 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Praveenkumar I <ipkumar@codeaurora.org>
Subject: Re: [PATCH] mtd: rawnand: qcom: Fix DMA sync on FLASH_STATUS
 register read
Message-ID: <20201028110835.2f319c0a@xps13>
In-Reply-To: <1602230872-25616-1-git-send-email-ipkumar@codeaurora.org>
References: <1602230872-25616-1-git-send-email-ipkumar@codeaurora.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_062224_207845_6C7CC0FE 
X-CRM114-Status: GOOD (  17.40  )
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
Cc: kathirav@codeaurora.org, vigneshr@ti.com, richard@nod.at,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, peter.ujfalusi@ti.com,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 sivaprak@codeaurora.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpQcmF2ZWVua3VtYXIgSSA8aXBrdW1hckBjb2RlYXVyb3JhLm9yZz4gd3JvdGUgb24g
RnJpLCAgOSBPY3QgMjAyMAoxMzozNzo1MiArMDUzMDoKCj4gQWZ0ZXIgZWFjaCBjb2Rld29yZCBO
QU5EX0ZMQVNIX1NUQVRVUyBpcyByZWFkIGZvciBwb3NzaWJsZSBvcGVyYXRpb25hbAo+IGZhaWx1
cmVzLiBCdXQgdGhlcmUgaXMgbm8gRE1BIHN5bmMgZm9yIENQVSBvcGVyYXRpb24gYmVmb3JlIHJl
YWRpbmcgaXQKPiBhbmQgdGhpcyBsZWFkcyB0byBpbmNvcnJlY3Qgb3Igb2xkZXIgY29weSBvZiBE
TUEgYnVmZmVyIGluIHJlZ19yZWFkX2J1Zi4KPiAKPiBUaGlzIHBhdGNoIGFkZHMgdGhlIERNQSBz
eW5jIG9uIHJlZ19yZWFkX2J1ZiBmb3IgQ1BVIGJlZm9yZSByZWFkaW5nIGl0Lgo+IAo+IEZpeGVz
OiA1YmMzNmIyYmY2ZTIgKCJtdGQ6IHJhd25hbmQ6IHFjb206IGNoZWNrIGZvciBvcGVyYXRpb24g
ZXJyb3JzIGluIGNhc2Ugb2YgcmF3IHJlYWQiKQoKSSBndWVzcyB0aGlzIGRlc2VydmVzIGEgcHJv
cGVyIENjOiBzdGFibGUgdGFnPwoKPiBTaWduZWQtb2ZmLWJ5OiBQcmF2ZWVua3VtYXIgSSA8aXBr
dW1hckBjb2RlYXVyb3JhLm9yZz4KCkkgdGhpbmsgeW91ciBmdWxsIG5hbWUgaXMgcmVxdWlyZWQg
aW4gdGhlIFNvQiBsaW5lIChzaG91bGQgbWF0Y2ggdGhlCmF1dGhvcnNoaXApLgoKT3RoZXJ3aXNl
IGxvb2tzIGdvb2QgdG8gbWUuCgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25h
bmRjLmMgfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jIGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gaW5kZXggYmQ3YTcyNTE0MjliLi41YmI4NWYxYmE4NGMg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gKysrIGIv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gQEAgLTE1NzAsNiArMTU3MCw4IEBA
IHN0YXRpYyBpbnQgY2hlY2tfZmxhc2hfZXJyb3JzKHN0cnVjdCBxY29tX25hbmRfaG9zdCAqaG9z
dCwgaW50IGN3X2NudCkKPiAgCXN0cnVjdCBxY29tX25hbmRfY29udHJvbGxlciAqbmFuZGMgPSBn
ZXRfcWNvbV9uYW5kX2NvbnRyb2xsZXIoY2hpcCk7Cj4gIAlpbnQgaTsKPiAgCj4gKwluYW5kY19y
ZWFkX2J1ZmZlcl9zeW5jKG5hbmRjLCB0cnVlKTsKPiArCj4gIAlmb3IgKGkgPSAwOyBpIDwgY3df
Y250OyBpKyspIHsKPiAgCQl1MzIgZmxhc2ggPSBsZTMyX3RvX2NwdShuYW5kYy0+cmVnX3JlYWRf
YnVmW2ldKTsKPiAgCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
