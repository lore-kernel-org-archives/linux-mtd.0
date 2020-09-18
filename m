Return-Path: <SRS0=UcWI=C3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F6DC43464
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 03:17:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EE1321582
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 03:17:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GhBC6ZTh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="l3r67X5o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EE1321582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qhjuAl0ePPOUwlDxbg1OYcsy38HggHjnaKrK1LemG9I=; b=GhBC6ZThakZIn9pfCWK/oOBUx
	L3H7z91Runl7CzMctaRUTGVLCTpoTEJ05n+2XttZilEWNtYBZ6qwHTsgwqlS8NO+yKvuVxSKRS5SL
	uEgbffnvYfB/Cnmmf99k5buUvpFerfOTQJTM8s2QHGNKCNfB7Kt6YMJsOwB9UGxTrGiHmHUqY+bFX
	0pjxqmTGVpNxqdi7NPxBP6/RGoxC1TLgVH5RWdG4Tgikk9GJwvSknS5glM6dKYbgSXSkuKKdQhaJX
	4CJdUnCawSFuI7cp6Y9Myf6DuI0dh4waKKTid8GlAVXXjYW7cBMZSYgA/lHrgqzKXdZ6Z1pVYjXHJ
	9acxnkqOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJ6si-0002U7-Ad; Fri, 18 Sep 2020 03:16:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJ5mO-0003nt-3N
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2020 02:05:41 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 16779238E3;
 Fri, 18 Sep 2020 02:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600394738;
 bh=TqL409WgYKpWzy5UO8kMIbz+JvY5JovFRKqmViX3KYE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l3r67X5o2YaclDueKE0aACl7zQrVK8UNVvvAJxlK7VDvX6TgqZ6sarRQuKXIOWkh6
 kESD/InXEUc/8vGU6W2gqXo9FFT8eVlo94njY+GKYjNzXzVdfrT2Q5bfrt6C7mRC2T
 5/1ZEuXM5jNfK9rGtE4OvBZQjoKKbV0t4q0LB+PY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 219/330] ubifs: Fix out-of-bounds memory access
 caused by abnormal value of node_len
Date: Thu, 17 Sep 2020 21:59:19 -0400
Message-Id: <20200918020110.2063155-219-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918020110.2063155-1-sashal@kernel.org>
References: <20200918020110.2063155-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_220540_288072_7D5F6A4B 
X-CRM114-Status: GOOD (  16.02  )
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
Cc: Sasha Levin <sashal@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, Liu Song <liu.song11@zte.com.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJvbTogTGl1IFNvbmcgPGxpdS5zb25nMTFAenRlLmNvbS5jbj4KClsgVXBzdHJlYW0gY29tbWl0
IGFjYzVhZjNlZmEzMDNkNWYzNmNjOGMwZjYxNzE2MTYxZjZjYTEzODQgXQoKSW4g4oCcdWJpZnNf
Y2hlY2tfbm9kZeKAnSwgd2hlbiB0aGUgdmFsdWUgb2YgIm5vZGVfbGVuIiBpcyBhYm5vcm1hbCwK
dGhlIGNvZGUgd2lsbCBnb3RvIGxhYmVsIG9mICJvdXRfbGVuIiBmb3IgZXhlY3V0aW9uLiBUaGVu
LCBpbiB0aGUKZm9sbG93aW5nICJ1Ymlmc19kdW1wX25vZGUiLCBpZiBpbm9kZSB0eXBlIGlzICJV
QklGU19EQVRBX05PREUiLAppbiAicHJpbnRfaGV4X2R1bXAiLCBhbiBvdXQtb2YtYm91bmRzIGFj
Y2VzcyBtYXkgb2NjdXIgZHVlIHRvIHRoZQp3cm9uZyAiY2gtPmxlbiIuCgpUaGVyZWZvcmUsIHdo
ZW4gdGhlIHZhbHVlIG9mICJub2RlX2xlbiIgaXMgYWJub3JtYWwsIGRhdGEgbGVuZ3RoCnNob3Vs
ZCB0byBiZSBhZGp1c3RlZCB0byBhIHJlYXNvbmFibGUgc2FmZSByYW5nZS4gQXQgdGhpcyB0aW1l
LApzdHJ1Y3R1cmVkIGRhdGEgaXMgbm90IGNyZWRpYmxlLCBzbyBkdW1wIHRoZSBjb3JydXB0ZWQg
ZGF0YSBkaXJlY3RseQpmb3IgYW5hbHlzaXMuCgpTaWduZWQtb2ZmLWJ5OiBMaXUgU29uZyA8bGl1
LnNvbmcxMUB6dGUuY29tLmNuPgpTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJp
Y2hhcmRAbm9kLmF0PgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5v
cmc+Ci0tLQogZnMvdWJpZnMvaW8uYyB8IDE2ICsrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL3Vi
aWZzL2lvLmMgYi9mcy91Ymlmcy9pby5jCmluZGV4IDhjZWI1MTQ3ODgwMGIuLjdlNGJmYWYyODcx
ZmEgMTAwNjQ0Ci0tLSBhL2ZzL3ViaWZzL2lvLmMKKysrIGIvZnMvdWJpZnMvaW8uYwpAQCAtMjI1
LDcgKzIyNSw3IEBAIGludCB1Ymlmc19pc19tYXBwZWQoY29uc3Qgc3RydWN0IHViaWZzX2luZm8g
KmMsIGludCBsbnVtKQogaW50IHViaWZzX2NoZWNrX25vZGUoY29uc3Qgc3RydWN0IHViaWZzX2lu
Zm8gKmMsIGNvbnN0IHZvaWQgKmJ1ZiwgaW50IGxudW0sCiAJCSAgICAgaW50IG9mZnMsIGludCBx
dWlldCwgaW50IG11c3RfY2hrX2NyYykKIHsKLQlpbnQgZXJyID0gLUVJTlZBTCwgdHlwZSwgbm9k
ZV9sZW47CisJaW50IGVyciA9IC1FSU5WQUwsIHR5cGUsIG5vZGVfbGVuLCBkdW1wX25vZGUgPSAx
OwogCXVpbnQzMl90IGNyYywgbm9kZV9jcmMsIG1hZ2ljOwogCWNvbnN0IHN0cnVjdCB1Ymlmc19j
aCAqY2ggPSBidWY7CiAKQEAgLTI3OCwxMCArMjc4LDIyIEBAIGludCB1Ymlmc19jaGVja19ub2Rl
KGNvbnN0IHN0cnVjdCB1Ymlmc19pbmZvICpjLCBjb25zdCB2b2lkICpidWYsIGludCBsbnVtLAog
b3V0X2xlbjoKIAlpZiAoIXF1aWV0KQogCQl1Ymlmc19lcnIoYywgImJhZCBub2RlIGxlbmd0aCAl
ZCIsIG5vZGVfbGVuKTsKKwlpZiAodHlwZSA9PSBVQklGU19EQVRBX05PREUgJiYgbm9kZV9sZW4g
PiBVQklGU19EQVRBX05PREVfU1opCisJCWR1bXBfbm9kZSA9IDA7CiBvdXQ6CiAJaWYgKCFxdWll
dCkgewogCQl1Ymlmc19lcnIoYywgImJhZCBub2RlIGF0IExFQiAlZDolZCIsIGxudW0sIG9mZnMp
OwotCQl1Ymlmc19kdW1wX25vZGUoYywgYnVmKTsKKwkJaWYgKGR1bXBfbm9kZSkgeworCQkJdWJp
ZnNfZHVtcF9ub2RlKGMsIGJ1Zik7CisJCX0gZWxzZSB7CisJCQlpbnQgc2FmZV9sZW4gPSBtaW4z
KG5vZGVfbGVuLCBjLT5sZWJfc2l6ZSAtIG9mZnMsCisJCQkJKGludClVQklGU19NQVhfREFUQV9O
T0RFX1NaKTsKKwkJCXByX2VycigiXHRwcmV2ZW50IG91dC1vZi1ib3VuZHMgbWVtb3J5IGFjY2Vz
c1xuIik7CisJCQlwcl9lcnIoIlx0dHJ1bmNhdGVkIGRhdGEgbm9kZSBsZW5ndGggICAgICAlZFxu
Iiwgc2FmZV9sZW4pOworCQkJcHJfZXJyKCJcdGNvcnJ1cHRlZCBkYXRhIG5vZGU6XG4iKTsKKwkJ
CXByaW50X2hleF9kdW1wKEtFUk5fRVJSLCAiXHQiLCBEVU1QX1BSRUZJWF9PRkZTRVQsIDMyLCAx
LAorCQkJCQlidWYsIHNhZmVfbGVuLCAwKTsKKwkJfQogCQlkdW1wX3N0YWNrKCk7CiAJfQogCXJl
dHVybiBlcnI7Ci0tIAoyLjI1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
