Return-Path: <SRS0=sITD=N5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A912FC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Sep 2021 06:40:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A33660232
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Sep 2021 06:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A33660232
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3g15KjTHNxBA62OX8stwZveU6rXkMhCbtOtG1qvw80Q=; b=4d0Wrsnszd82uY
	QoTd0g5Xz8W0xPXovyK/e/IEvy0zddTKk5iCMgglrgNqHS4IJzQ//inDWUklnKRjJG4eXHDg+aLUT
	Mz6zTw/+8DvzIllARxk/kvOWH6VOC5oLfQOFqJaTaGMecfht3/hcaZiqUH5xq3VmxlxuzvLAFbvcz
	BkjeuIJWJvE9CxhYix+Irhx8C+RHzubYxp2LaSUKX6OJ26OegKyrdjxcI/nI5RhcRMO6wilc7ASoH
	3UEk+65yUwFV0jbMlnhqzzShyLdtiS9xcDA9/SrGiCxChlDq9ytf/G6LeBmiD23jgcgxGQPR8+bUk
	A1VZllmE5YZszG5WeJdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNUm0-002a5I-Nr; Tue, 07 Sep 2021 06:40:00 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNUlx-002a4Q-Ci
 for linux-mtd@lists.infradead.org; Tue, 07 Sep 2021 06:39:58 +0000
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 06 Sep 2021 23:39:53 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 06 Sep 2021 23:39:52 -0700
X-QCInternal: smtphost
Received: from mdalam-linux.qualcomm.com ([10.201.2.71])
 by ironmsg02-blr.qualcomm.com with ESMTP; 07 Sep 2021 12:09:41 +0530
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
 id EC9CD222D3; Tue,  7 Sep 2021 12:09:39 +0530 (IST)
From: Md Sadre Alam <mdalam@codeaurora.org>
To: miquel.raynal@bootlin.com, mani@kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: mdalam@codeaurora.org,
	sricharan@codeaurora.org,
	stable@kernel.org
Subject: [PATCH V5] mtd: rawnand: qcom: Update code word value for raw read
Date: Tue,  7 Sep 2021 12:09:31 +0530
Message-Id: <1630996771-29866-1-git-send-email-mdalam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_233957_530702_B374A51D 
X-CRM114-Status: GOOD (  11.89  )
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
IHRvIHN5c3RlbQptZW1vcnkuCgpGaXhlczogNTAzZWU1YWFkNDMwNTRhMjZjZmQ1Y2M1OTJhMzEy
NzBjMDU1MzljZCAoIm10ZDogcmF3bmFuZDogcWNvbTogdXBkYXRlIGxhc3QgY29kZSB3b3JkIHJl
Z2lzdGVyIikKQ2M6IHN0YWJsZUBrZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IE1kIFNhZHJlIEFs
YW0gPG1kYWxhbUBjb2RlYXVyb3JhLm9yZz4KLS0tCkNoYW5nZXMgaW4gVjU6CgogKiBJbmNvcnBv
cmF0ZWQgImhhc2ggY29tbWl0IiBjb21tZW50IGZyb20gTWFuaS4KICogVXBkYXRlZCBjb21taXQg
aGFzaAoKQ2hhbmdlcyBpbiBWNDoKCiAqIEluY29ycG9yYXRlZCAiQ2hhbmdlIGxvZyIgY29tbWVu
dCBmcm9tIE1pcXXDqGwKICogVXBkYXRlZCBjaGFuZ2UgbG9nCgpDaGFuZ2VzIGluIFYzOgogCiAq
IEluY29ycG9yYXRlZCAiRml4ZXMgdGFncyBhcmUgbWlzc2luZyIgY29tbWVudCBmcm9tIE1pcXXD
qGwKICogQWRkZWQgRml4ZXMgdGFnIEZpeGVzOjUwM2VlNWFhICgibXRkOiByYXduYW5kOiBxY29t
OiB1cGRhdGUgbGFzdCBjb2RlIHdvcmQgcmVnaXN0ZXIiKQoKCkNoYW5nZXMgaW4gVjI6CgogKiBJ
bmNvcnBvcmF0ZWQgInN0YWJsZSB0YWdzIGFyZSBtaXNzaW5nIiBjb21tZW50IGZyb20gTWlxdcOo
bAogKiBBZGRlZCBzdGFibGUgdGFncyBDYzpzdGFibGVAa2VybmVsLm9yZwoKICAKCiBkcml2ZXJz
L210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMgfCA4ICsrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L3Fjb21fbmFuZGMuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMu
YwppbmRleCBlZjBiYWRlLi4wNGU2ZjdiIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9xY29tX25hbmRjLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCkBA
IC0xNjc2LDEzICsxNjc2LDE3IEBAIHFjb21fbmFuZGNfcmVhZF9jd19yYXcoc3RydWN0IG10ZF9p
bmZvICptdGQsIHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCiAJc3RydWN0IG5hbmRfZWNjX2N0cmwg
KmVjYyA9ICZjaGlwLT5lY2M7CiAJaW50IGRhdGFfc2l6ZTEsIGRhdGFfc2l6ZTIsIG9vYl9zaXpl
MSwgb29iX3NpemUyOwogCWludCByZXQsIHJlZ19vZmYgPSBGTEFTSF9CVUZfQUNDLCByZWFkX2xv
YyA9IDA7CisJaW50IHJhd19jdyA9IGN3OwogCiAJbmFuZF9yZWFkX3BhZ2Vfb3AoY2hpcCwgcGFn
ZSwgMCwgTlVMTCwgMCk7CiAJaG9zdC0+dXNlX2VjYyA9IGZhbHNlOwogCisJaWYgKG5hbmRjLT5w
cm9wcy0+cXBpY192MikKKwkJcmF3X2N3ID0gZWNjLT5zdGVwcyAtIDE7CisKIAljbGVhcl9iYW1f
dHJhbnNhY3Rpb24obmFuZGMpOwogCXNldF9hZGRyZXNzKGhvc3QsIGhvc3QtPmN3X3NpemUgKiBj
dywgcGFnZSk7Ci0JdXBkYXRlX3J3X3JlZ3MoaG9zdCwgMSwgdHJ1ZSwgY3cpOworCXVwZGF0ZV9y
d19yZWdzKGhvc3QsIDEsIHRydWUsIHJhd19jdyk7CiAJY29uZmlnX25hbmRfcGFnZV9yZWFkKGNo
aXApOwogCiAJZGF0YV9zaXplMSA9IG10ZC0+d3JpdGVzaXplIC0gaG9zdC0+Y3dfc2l6ZSAqIChl
Y2MtPnN0ZXBzIC0gMSk7CkBAIC0xNzExLDcgKzE3MTUsNyBAQCBxY29tX25hbmRjX3JlYWRfY3df
cmF3KHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAogCQluYW5k
Y19zZXRfcmVhZF9sb2MoY2hpcCwgY3csIDMsIHJlYWRfbG9jLCBvb2Jfc2l6ZTIsIDEpOwogCX0K
IAotCWNvbmZpZ19uYW5kX2N3X3JlYWQoY2hpcCwgZmFsc2UsIGN3KTsKKwljb25maWdfbmFuZF9j
d19yZWFkKGNoaXAsIGZhbHNlLCByYXdfY3cpOwogCiAJcmVhZF9kYXRhX2RtYShuYW5kYywgcmVn
X29mZiwgZGF0YV9idWYsIGRhdGFfc2l6ZTEsIDApOwogCXJlZ19vZmYgKz0gZGF0YV9zaXplMTsK
LS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
