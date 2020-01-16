Return-Path: <SRS0=QXPY=3F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D72D4C33CB1
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2020 15:37:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB899206D9
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2020 15:37:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="keClM4Kz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=aliyun.com header.i=@aliyun.com header.b="jgHQJAFh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB899206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aliyun.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H7PkFK8HpPTEJKk/eB54599264d7VSS0ZIrORpxUHl8=; b=keClM4Kzl/1g52
	wsJ4BsNF6AeoLUvqnFWOVPtk5pgk6wxd9KXMmEAS71VtLLCAnvjajG5nWv4ou+RxghjYv7YknUgyR
	jYZUcMqHACB423IRjZ0AELPvXuTlCo0hghgtl3TQn4LLQ2e+j4AewWA6qsvkr09Z1/8K1pV4LwIFt
	d8yqDdAu2BEJdz301uDIqiKEtmRpuGtBW6rps1c9PoHWNFnwl+36zGTrnXlD+yfFhMXbJaYN6ekEU
	7VwnMPOwyo+kcPYg8kOEsK1HCL6ApxYrxqWh2xkj3gzaYeYpj9jlZqprdIRBVVxEngpdub7E7vIE0
	WZ47S+fiFqnu6RDImI4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is7Cf-0000LE-IM; Thu, 16 Jan 2020 15:37:01 +0000
Received: from out30-15.freemail.mail.aliyun.com ([115.124.30.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is7Ca-0000Dj-TM
 for linux-mtd@lists.infradead.org; Thu, 16 Jan 2020 15:37:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliyun.com; s=s1024;
 t=1579189009; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
 bh=ULBEK3X07INGPck+V3ZOEzCSMiiJXR5xx4lYznmJwwU=;
 b=jgHQJAFhm1O+ZvwlPMyRmEd236++lS1QFOIEaomgnQAdLZXn3EJe3gdMqXxbY3r0omIWfNH5rliir6MlBp/9T6J3upfeakmz8insk5TBnLhf3wiFEJXycEbzsPkw3rkXKxTVhMWX7ERQycTv/0qaCIzg9LI9UNJQhLaS3wPej54=
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07530072|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.403136-0.02025-0.576614;
 DS=CONTINUE|ham_alarm|0.0131814-0.00254244-0.984276; FP=0|0|0|0|0|-1|-1|-1;
 HT=e01f04427; MF=fishland@aliyun.com; NM=1; PH=DS; RN=4; RT=4; SR=0;
 TI=SMTPD_---0Tnu3gYA_1579189001; 
Received: from localhost.localdomain(mailfrom:fishland@aliyun.com
 fp:SMTPD_---0Tnu3gYA_1579189001) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 16 Jan 2020 23:36:48 +0800
From: Liu Song <fishland@aliyun.com>
To: richard@nod.at
Subject: [PATCH] ubifs: Fix out-of-bounds memory access caused by abnormal
 value of node_len
Date: Thu, 16 Jan 2020 23:36:07 +0800
Message-Id: <20200116153607.11910-1-fishland@aliyun.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_073657_148179_444C545A 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 liu.song11@zte.com.cn
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJvbTogTGl1IFNvbmcgPGxpdS5zb25nMTFAenRlLmNvbS5jbj4KCkluIOKAnHViaWZzX2NoZWNr
X25vZGXigJ0sIHdoZW4gdGhlIHZhbHVlIG9mICJub2RlX2xlbiIgaXMgYWJub3JtYWwsCnRoZSBj
b2RlIHdpbGwgZ290byBsYWJlbCBvZiAib3V0X2xlbiIgZm9yIGV4ZWN1dGlvbi4gVGhlbiwgaW4g
dGhlCmZvbGxvd2luZyAidWJpZnNfZHVtcF9ub2RlIiwgaWYgaW5vZGUgdHlwZSBpcyAiVUJJRlNf
REFUQV9OT0RFIiwKaW4gInByaW50X2hleF9kdW1wIiwgYW4gb3V0LW9mLWJvdW5kcyBhY2Nlc3Mg
bWF5IG9jY3VyIGR1ZSB0byB0aGUKd3JvbmcgImNoLT5sZW4iLgoKVGhlcmVmb3JlLCB3aGVuIHRo
ZSB2YWx1ZSBvZiAibm9kZV9sZW4iIGlzIGFibm9ybWFsLCBkYXRhIGxlbmd0aApzaG91bGQgdG8g
YmUgYWRqdXN0ZWQgdG8gYSByZWFzb25hYmxlIHNhZmUgcmFuZ2UuIEF0IHRoaXMgdGltZSwKc3Ry
dWN0dXJlZCBkYXRhIGlzIG5vdCBjcmVkaWJsZSwgc28gZHVtcCB0aGUgY29ycnVwdGVkIGRhdGEg
ZGlyZWN0bHkKZm9yIGFuYWx5c2lzLgoKU2lnbmVkLW9mZi1ieTogTGl1IFNvbmcgPGxpdS5zb25n
MTFAenRlLmNvbS5jbj4KLS0tCiBmcy91Ymlmcy9pby5jIHwgMTYgKysrKysrKysrKysrKystLQog
MSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZnMvdWJpZnMvaW8uYyBiL2ZzL3ViaWZzL2lvLmMKaW5kZXggOGNlYjUxNDc4ODAwLi43
ZTRiZmFmMjg3MWYgMTAwNjQ0Ci0tLSBhL2ZzL3ViaWZzL2lvLmMKKysrIGIvZnMvdWJpZnMvaW8u
YwpAQCAtMjI1LDcgKzIyNSw3IEBAIGludCB1Ymlmc19pc19tYXBwZWQoY29uc3Qgc3RydWN0IHVi
aWZzX2luZm8gKmMsIGludCBsbnVtKQogaW50IHViaWZzX2NoZWNrX25vZGUoY29uc3Qgc3RydWN0
IHViaWZzX2luZm8gKmMsIGNvbnN0IHZvaWQgKmJ1ZiwgaW50IGxudW0sCiAJCSAgICAgaW50IG9m
ZnMsIGludCBxdWlldCwgaW50IG11c3RfY2hrX2NyYykKIHsKLQlpbnQgZXJyID0gLUVJTlZBTCwg
dHlwZSwgbm9kZV9sZW47CisJaW50IGVyciA9IC1FSU5WQUwsIHR5cGUsIG5vZGVfbGVuLCBkdW1w
X25vZGUgPSAxOwogCXVpbnQzMl90IGNyYywgbm9kZV9jcmMsIG1hZ2ljOwogCWNvbnN0IHN0cnVj
dCB1Ymlmc19jaCAqY2ggPSBidWY7CiAKQEAgLTI3OCwxMCArMjc4LDIyIEBAIGludCB1Ymlmc19j
aGVja19ub2RlKGNvbnN0IHN0cnVjdCB1Ymlmc19pbmZvICpjLCBjb25zdCB2b2lkICpidWYsIGlu
dCBsbnVtLAogb3V0X2xlbjoKIAlpZiAoIXF1aWV0KQogCQl1Ymlmc19lcnIoYywgImJhZCBub2Rl
IGxlbmd0aCAlZCIsIG5vZGVfbGVuKTsKKwlpZiAodHlwZSA9PSBVQklGU19EQVRBX05PREUgJiYg
bm9kZV9sZW4gPiBVQklGU19EQVRBX05PREVfU1opCisJCWR1bXBfbm9kZSA9IDA7CiBvdXQ6CiAJ
aWYgKCFxdWlldCkgewogCQl1Ymlmc19lcnIoYywgImJhZCBub2RlIGF0IExFQiAlZDolZCIsIGxu
dW0sIG9mZnMpOwotCQl1Ymlmc19kdW1wX25vZGUoYywgYnVmKTsKKwkJaWYgKGR1bXBfbm9kZSkg
eworCQkJdWJpZnNfZHVtcF9ub2RlKGMsIGJ1Zik7CisJCX0gZWxzZSB7CisJCQlpbnQgc2FmZV9s
ZW4gPSBtaW4zKG5vZGVfbGVuLCBjLT5sZWJfc2l6ZSAtIG9mZnMsCisJCQkJKGludClVQklGU19N
QVhfREFUQV9OT0RFX1NaKTsKKwkJCXByX2VycigiXHRwcmV2ZW50IG91dC1vZi1ib3VuZHMgbWVt
b3J5IGFjY2Vzc1xuIik7CisJCQlwcl9lcnIoIlx0dHJ1bmNhdGVkIGRhdGEgbm9kZSBsZW5ndGgg
ICAgICAlZFxuIiwgc2FmZV9sZW4pOworCQkJcHJfZXJyKCJcdGNvcnJ1cHRlZCBkYXRhIG5vZGU6
XG4iKTsKKwkJCXByaW50X2hleF9kdW1wKEtFUk5fRVJSLCAiXHQiLCBEVU1QX1BSRUZJWF9PRkZT
RVQsIDMyLCAxLAorCQkJCQlidWYsIHNhZmVfbGVuLCAwKTsKKwkJfQogCQlkdW1wX3N0YWNrKCk7
CiAJfQogCXJldHVybiBlcnI7Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
