Return-Path: <SRS0=sITD=N5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66707C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Sep 2021 07:06:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C31C6103E
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Sep 2021 07:06:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C31C6103E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jpa9NB61frKHdwsHlpQOc0ye1OGAnH+cnivqnXrVd88=; b=qrJBIDtBV81EoK
	jZcXfhPox2pfRt9vMxjPDAyoho5+AFKFoMXiCBldyxqeIvTYyp3IoV5/sj5+WJD/ZgGw9fVqCODYH
	5hHLulrdVoONr+JeG0aMbvEdeMktakecR8rC8+YDGveA5tgDPBuEISmkInrFPfXXue+5qyaGxQJnh
	qIrglurNkSM8Ibyy8CGjZxH4ENYFhLk7CIC5EHQ5YdYFFX/wPDzwxq+iN0wVqcn/2+DGdTxZBP/N0
	wDfdXMzj6fc79Z9blBNS1APHEeX8YZ9Zj615rtQuW54zot5XshCyykj7qPykapWuy5Vv9Z92IRoky
	Nvp2IluHS4LuM8AW6/OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNVBS-002enE-9n; Tue, 07 Sep 2021 07:06:18 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNVBP-002emd-Nh
 for linux-mtd@lists.infradead.org; Tue, 07 Sep 2021 07:06:17 +0000
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 07 Sep 2021 00:06:15 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 07 Sep 2021 00:06:14 -0700
X-QCInternal: smtphost
Received: from mdalam-linux.qualcomm.com ([10.201.2.71])
 by ironmsg02-blr.qualcomm.com with ESMTP; 07 Sep 2021 12:36:02 +0530
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
 id AC9D5222D3; Tue,  7 Sep 2021 12:36:01 +0530 (IST)
From: Md Sadre Alam <mdalam@codeaurora.org>
To: miquel.raynal@bootlin.com, mani@kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: mdalam@codeaurora.org,
	sricharan@codeaurora.org,
	stable@kernel.org
Subject: [PATCH V6] mtd: rawnand: qcom: Update code word value for raw read
Date: Tue,  7 Sep 2021 12:35:57 +0530
Message-Id: <1630998357-1359-1-git-send-email-mdalam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_000615_877875_F756F0BC 
X-CRM114-Status: GOOD (  11.90  )
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

RnJvbSBRUElDIFYyIG9ud2FyZHMgdGhlcmUgaXMgYSBzZXBhcmF0ZSByZWdpc3RlciB0byByZWFk
Cmxhc3QgY29kZSB3b3JkICJRUElDX05BTkRfUkVBRF9MT0NBVElPTl9MQVNUX0NXX24iLgoKcWNv
bV9uYW5kY19yZWFkX2N3X3JhdygpIGlzIHVzZWQgdG8gcmVhZCBvbmx5IG9uZSBjb2RlIHdvcmQK
YXQgYSB0aW1lLiBJZiB3ZSB3aWxsIGNvbmZpZ3VyZSBudW1iZXIgb2YgY29kZSB3b3JkcyB0byAx
IGluCmluIFFQSUNfTkFORF9ERVYwX0NGRzAgcmVnaXN0ZXIgdGhlbiBRUElDIGNvbnRyb2xsZXIg
dGhpbmtzCml0cyByZWFkaW5nIHRoZSBsYXN0IGNvZGUgd29yZCwgc2luY2UgZnJvbSBRUElDIFYy
IG9ud2FyZHMKd2UgYXJlIGhhdmluZyBzZXBhcmF0ZSByZWdpc3RlciB0byByZWFkIHRoZSBsYXN0
IGNvZGUgd29yZCwKd2UgaGF2ZSB0byBjb25maWd1cmUgIlFQSUNfTkFORF9SRUFEX0xPQ0FUSU9O
X0xBU1RfQ1dfbiIKcmVnaXN0ZXIgdG8gZmV0Y2ggZGF0YSBmcm9tIGNvbnRyb2xsZXIgYnVmZmVy
IHRvIHN5c3RlbQptZW1vcnkuCgpGaXhlczogNTAzZWU1YWFkNDMwICgibXRkOiByYXduYW5kOiBx
Y29tOiB1cGRhdGUgbGFzdCBjb2RlIHdvcmQgcmVnaXN0ZXIiKQpDYzogc3RhYmxlQGtlcm5lbC5v
cmcKU2lnbmVkLW9mZi1ieTogTWQgU2FkcmUgQWxhbSA8bWRhbGFtQGNvZGVhdXJvcmEub3JnPgot
LS0KQ2hhbmdlcyBpbiBWNjoKCiAqIEluY29ycG9yYXRlZCAiY29tbWl0IGhhc2giIGNvbW1lbnQg
ZnJvbSBNaXF1w6hsCiAqIHVwZGF0ZWQgY29tbWl0IGhhc2ggdG8gMTIgZGlnaXRzIGluIEZpeGVz
IHRhZy4KCkNoYW5nZXMgaW4gVjU6CgogKiBJbmNvcnBvcmF0ZWQgImhhc2ggY29tbWl0IiBjb21t
ZW50IGZyb20gTWFuaS4KICogVXBkYXRlZCBjb21taXQgaGFzaAoKQ2hhbmdlcyBpbiBWNDoKCiAq
IEluY29ycG9yYXRlZCAiQ2hhbmdlIGxvZyIgY29tbWVudCBmcm9tIE1pcXXDqGwKICogVXBkYXRl
ZCBjaGFuZ2UgbG9nCgpDaGFuZ2VzIGluIFYzOgogCiAqIEluY29ycG9yYXRlZCAiRml4ZXMgdGFn
cyBhcmUgbWlzc2luZyIgY29tbWVudCBmcm9tIE1pcXXDqGwKICogQWRkZWQgRml4ZXMgdGFnIEZp
eGVzOjUwM2VlNWFhICgibXRkOiByYXduYW5kOiBxY29tOiB1cGRhdGUgbGFzdCBjb2RlIHdvcmQg
cmVnaXN0ZXIiKQoKCkNoYW5nZXMgaW4gVjI6CgogKiBJbmNvcnBvcmF0ZWQgInN0YWJsZSB0YWdz
IGFyZSBtaXNzaW5nIiBjb21tZW50IGZyb20gTWlxdcOobAogKiBBZGRlZCBzdGFibGUgdGFncyBD
YzpzdGFibGVAa2VybmVsLm9yZwoKIGRyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYyB8
IDggKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jIGIvZHJp
dmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCmluZGV4IGVmMGJhZGUuLjA0ZTZmN2IgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYworKysgYi9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKQEAgLTE2NzYsMTMgKzE2NzYsMTcgQEAgcWNvbV9u
YW5kY19yZWFkX2N3X3JhdyhzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgc3RydWN0IG5hbmRfY2hpcCAq
Y2hpcCwKIAlzdHJ1Y3QgbmFuZF9lY2NfY3RybCAqZWNjID0gJmNoaXAtPmVjYzsKIAlpbnQgZGF0
YV9zaXplMSwgZGF0YV9zaXplMiwgb29iX3NpemUxLCBvb2Jfc2l6ZTI7CiAJaW50IHJldCwgcmVn
X29mZiA9IEZMQVNIX0JVRl9BQ0MsIHJlYWRfbG9jID0gMDsKKwlpbnQgcmF3X2N3ID0gY3c7CiAK
IAluYW5kX3JlYWRfcGFnZV9vcChjaGlwLCBwYWdlLCAwLCBOVUxMLCAwKTsKIAlob3N0LT51c2Vf
ZWNjID0gZmFsc2U7CiAKKwlpZiAobmFuZGMtPnByb3BzLT5xcGljX3YyKQorCQlyYXdfY3cgPSBl
Y2MtPnN0ZXBzIC0gMTsKKwogCWNsZWFyX2JhbV90cmFuc2FjdGlvbihuYW5kYyk7CiAJc2V0X2Fk
ZHJlc3MoaG9zdCwgaG9zdC0+Y3dfc2l6ZSAqIGN3LCBwYWdlKTsKLQl1cGRhdGVfcndfcmVncyho
b3N0LCAxLCB0cnVlLCBjdyk7CisJdXBkYXRlX3J3X3JlZ3MoaG9zdCwgMSwgdHJ1ZSwgcmF3X2N3
KTsKIAljb25maWdfbmFuZF9wYWdlX3JlYWQoY2hpcCk7CiAKIAlkYXRhX3NpemUxID0gbXRkLT53
cml0ZXNpemUgLSBob3N0LT5jd19zaXplICogKGVjYy0+c3RlcHMgLSAxKTsKQEAgLTE3MTEsNyAr
MTcxNSw3IEBAIHFjb21fbmFuZGNfcmVhZF9jd19yYXcoc3RydWN0IG10ZF9pbmZvICptdGQsIHN0
cnVjdCBuYW5kX2NoaXAgKmNoaXAsCiAJCW5hbmRjX3NldF9yZWFkX2xvYyhjaGlwLCBjdywgMywg
cmVhZF9sb2MsIG9vYl9zaXplMiwgMSk7CiAJfQogCi0JY29uZmlnX25hbmRfY3dfcmVhZChjaGlw
LCBmYWxzZSwgY3cpOworCWNvbmZpZ19uYW5kX2N3X3JlYWQoY2hpcCwgZmFsc2UsIHJhd19jdyk7
CiAKIAlyZWFkX2RhdGFfZG1hKG5hbmRjLCByZWdfb2ZmLCBkYXRhX2J1ZiwgZGF0YV9zaXplMSwg
MCk7CiAJcmVnX29mZiArPSBkYXRhX3NpemUxOwotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
