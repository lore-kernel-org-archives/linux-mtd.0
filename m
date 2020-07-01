Return-Path: <SRS0=6ot8=AM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 170DAC433DF
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jul 2020 09:37:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCE70206C3
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jul 2020 09:37:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iqzX665x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCE70206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DKVF32ioEXWkpcaQlNcEREyAu4qGLsPLGfsKjE6o630=; b=iqzX665xdm4UsgDR900L7RgE9Z
	+vsiM7zMr08CBk2H4ZIULDwwcmM9+/jdOw2EGNgHpLmKUScvLTW+bHQZjq2ubFAYz16mtBtCDYvAI
	LcWhiaA0frzOF8aBsVa1bUnjo/DjTLFnoklY7ZpZhzN/33zhqS4atbowue9UspaK/O8zkOgYzq/80
	i2Paz3lcm8XYp2GauSdEq5TcHoZtY7MAwciaQsvscoZyQlfgQUzf2cu2wL7ZSUws5UF1R0mpGNJsC
	ZVNCPFcs4uaI+u/yTdQ/D/AYEpy5B7ghFjFNFN+muJ8OiijykKLjX9Ww2gWDwYSHZuOXLxXteiO6V
	UKnEr6NQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqZ9G-0000XE-Rf; Wed, 01 Jul 2020 09:35:23 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqZ5s-00071D-Rv
 for linux-mtd@lists.infradead.org; Wed, 01 Jul 2020 09:31:54 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 5578593866925948708A;
 Wed,  1 Jul 2020 17:31:45 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Wed, 1 Jul 2020
 17:31:33 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <yi.zhang@huawei.com>
Subject: [PATCH] ubifs: Fix a potential space leak problem while linking
 tmpfile
Date: Wed, 1 Jul 2020 17:32:27 +0800
Message-ID: <20200701093227.674945-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_053153_258696_FC9729CB 
X-CRM114-Status: UNSURE (   7.13  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhlcmUgaXMgYSBwb3RlbnRpYWwgc3BhY2UgbGVhayBwcm9ibGVtIHdoaWxlIGxpbmtpbmcgdG1w
ZmlsZSwgaW4gd2hpY2gKY2FzZSwgaW5vZGUgbm9kZSAod2l0aCBubGluaz0wKSBpcyB2YWxpZCBp
biB0bmMgKG9uIGZsYXNoKSwgd2hpY2ggbGVhZHMKdG8gc3BhY2UgbGVhay4gTWVhbndoaWxlLCB0
aGUgY29ycmVzcG9uZGluZyBkYXRhIG5vZGVzIHdvbid0IGJlIHJlbGVhc2VkCmZyb20gdG5jLiBG
b3IgZXhhbXBsZSwgKEEgcmVwcm9kdWNlciBjYW4gYmUgZm91bmQgaW4gTGluayk6CgokIG1vdW50
IFVCSUZTCiAgW3Byb2Nlc3MgQV0gICAgICAgICAgICBbcHJvY2VzcyBCXSAgICAgICAgIFtUTkNd
ICAgICAgICAgW29ycGhhbiBhcmVhXQoKIHViaWZzX3RtcGZpbGUgICAgICAgICAgICAgICAgICAg
ICAgICAgIGlub2RlX0EgKG5saW5rPTApICAgICBpbm9kZV9BCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgZG9fY29tbWl0ICAgICBpbm9kZV9BIChubGluaz0wKSAgICAgaW5vZGVfQQoJCQkgICAg
ICAg4oaRCiAgICAgIChjb21tZW50OiBJdCBtYWtlcyBzdXJlIG5vdCByZXBsYXkgaW5vZGVfQSBp
biBuZXh0IG1vdW50KQogdWJpZnNfbGluayAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW5v
ZGVfQSAobmxpbms9MCkgICAgIGlub2RlX0EKICAgdWJpZnNfZGVsZXRlX29ycGhhbiAgICAgICAg
ICAgICAgICAgIGlub2RlX0EgKG5saW5rPTApCiAgICAgICAgICAgICAgICAgICAgICAgICAgZG9f
Y29tbWl0ICAgICBpbm9kZV9BIChubGluaz0wKQogICAgICAgICAgICAgICAgICAgICAgICAgICAt
LS0+IFBPV0VSQ1VUIDwtLS0KICAgKHViaWZzX2pubF91cGRhdGUpCgokIG1vdW50IFVCSUZTCiAg
aW5vZGVfQSB3aWxsIG5laXRoZXIgYmUgcmVwbGF5ZWQgaW4gdWJpZnNfcmVwbGF5X2pvdXJuYWwo
KSBub3IKICB1Ymlmc19tb3VudF9vcnBoYW5zKCkuIGlub2RlX0EgKG5saW5rPTApIHdpdGggaXRz
IGRhdGEgbm9kZXMgd2lsbAogIGFsd2F5cyBvbiB0bmMsIGl0IG9jY3VweSBzcGFjZSBidXQgaXMg
bm9uLXZpc2FibGUgZm9yIHVzZXJzLgoKQ29tbWl0IGVlMTQzOGNlNWRjNGQgKCJ1YmlmczogQ2hl
Y2sgbGluayBjb3VudCBvZiBpbm9kZXMgd2hlbiBraWxsaW5nCm9ycGhhbnMuIikgaGFuZGxlcyBw
cm9ibGVtIGluIG1pc3Rha2VubHkgZGVsZXRpbmcgcmVsaW5rZWQgdG1wZmlsZQp3aGlsZSByZXBs
YXlpbmcgb3JwaGFuIGFyZWEuIFNpbmNlIHRoYXQsIHRtcGZpbGUgaW5vZGUgc2hvdWxkIGFsd2F5
cwpsaXZlIGluIG9ycGhhbiBhcmVhIGV2ZW4gaXQgaXMgbGlua2VkLiBGaXggaXQgYnkgcmV2ZXJ0
aW5nIGNvbW1pdAozMmZlOTA1YzE3ZjAwMSAoInViaWZzOiBGaXggT19UTVBGSUxFIGNvcm5lciBj
YXNlIGluIHViaWZzX2xpbmsoKSIpLgoKU2lnbmVkLW9mZi1ieTogWmhpaGFvIENoZW5nIDxjaGVu
Z3poaWhhbzFAaHVhd2VpLmNvbT4KQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgpGaXhlczog
MzJmZTkwNWMxN2YwMDEgKCJ1YmlmczogRml4IE9fVE1QRklMRSBjb3JuZXIgY2FzZSBpbiB1Ymlm
c19saW5rKCkiKQpMaW5rOiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dp
P2lkPTIwODQwNQotLS0KIGZzL3ViaWZzL2Rpci5jIHwgNyAtLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9mcy91Ymlmcy9kaXIuYyBiL2ZzL3ViaWZz
L2Rpci5jCmluZGV4IGVmODVlYzE2N2E4NC4uOTUzNGM0YmI1OThmIDEwMDY0NAotLS0gYS9mcy91
Ymlmcy9kaXIuYworKysgYi9mcy91Ymlmcy9kaXIuYwpAQCAtNzIyLDExICs3MjIsNiBAQCBzdGF0
aWMgaW50IHViaWZzX2xpbmsoc3RydWN0IGRlbnRyeSAqb2xkX2RlbnRyeSwgc3RydWN0IGlub2Rl
ICpkaXIsCiAJCWdvdG8gb3V0X2ZuYW1lOwogCiAJbG9ja18yX2lub2RlcyhkaXIsIGlub2RlKTsK
LQotCS8qIEhhbmRsZSBPX1RNUEZJTEUgY29ybmVyIGNhc2UsIGl0IGlzIGFsbG93ZWQgdG8gbGlu
ayBhIE9fVE1QRklMRS4gKi8KLQlpZiAoaW5vZGUtPmlfbmxpbmsgPT0gMCkKLQkJdWJpZnNfZGVs
ZXRlX29ycGhhbihjLCBpbm9kZS0+aV9pbm8pOwotCiAJaW5jX25saW5rKGlub2RlKTsKIAlpaG9s
ZChpbm9kZSk7CiAJaW5vZGUtPmlfY3RpbWUgPSBjdXJyZW50X3RpbWUoaW5vZGUpOwpAQCAtNzQ3
LDggKzc0Miw2IEBAIHN0YXRpYyBpbnQgdWJpZnNfbGluayhzdHJ1Y3QgZGVudHJ5ICpvbGRfZGVu
dHJ5LCBzdHJ1Y3QgaW5vZGUgKmRpciwKIAlkaXItPmlfc2l6ZSAtPSBzel9jaGFuZ2U7CiAJZGly
X3VpLT51aV9zaXplID0gZGlyLT5pX3NpemU7CiAJZHJvcF9ubGluayhpbm9kZSk7Ci0JaWYgKGlu
b2RlLT5pX25saW5rID09IDApCi0JCXViaWZzX2FkZF9vcnBoYW4oYywgaW5vZGUtPmlfaW5vKTsK
IAl1bmxvY2tfMl9pbm9kZXMoZGlyLCBpbm9kZSk7CiAJdWJpZnNfcmVsZWFzZV9idWRnZXQoYywg
JnJlcSk7CiAJaXB1dChpbm9kZSk7Ci0tIAoyLjI1LjQKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
