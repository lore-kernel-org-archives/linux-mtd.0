Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EADAEC282D1
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Mar 2025 16:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KSTyS7dsTfkz5nMScrxz1hPFZUHP3QAFPptCb0VGFsw=; b=ZdL2BMso1ndn2q
	BQZRFgRLDLeQ1KBuVpwiYZD1M5t2LQOdWDJInqumHik/79wgJX649NMjO8XUSaIfPQDnt5uBdlP+G
	YRSHUBsTnlVBgx5CmGCeS5A9e9Ew0giTsuDelKyzjcmTvG3Jd5S1SGR+06fMlfQEBjf7EZjavBkTq
	SCNKL2qSmr9BEpNdTe5WNNznD6XRlgQCy4/GGEwSL8sXL7mKdWWtEL2ItFzV+ltVvitlNFn+U/30k
	1b7lJWkiZbduGsGddAcgV+cCepD8HzEQNh+2oW9qf4nbpMiPUtOvgjG8A6a1txO6cfwCgcHS3ktcW
	NDdgX97u9rmlTNI9BfJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tolrt-0000000GHVl-4C2J;
	Sun, 02 Mar 2025 16:08:42 +0000
Received: from server02.seltendoof.de ([168.119.48.163])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tolqe-0000000GHFX-18dc
	for linux-mtd@lists.infradead.org;
	Sun, 02 Mar 2025 16:07:25 +0000
From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seltendoof.de;
	s=2023072701; t=1740931628;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lrrmxCSXObAFhEIo/8fh8weOhY7nqO46PR4GZl5VqBk=;
	b=SJbl8DHfCbWjEsjgne1Kob32i8p6jeDt6GHFv4OHAtoWeQ3lqXQcKH4uFnMbjiXjMxOD6a
	0yRMpAHp77D88bW+DSL4gMGtBcz/cn0z41hBCSIhjBCucvOxUc1Ibv6JN4PdD4Dq6KUXPl
	ZaqJkLCDLg8IMc7i9s1tWJ3YLbESgH/3IhrQqjeQVb15+7Cxff/WR+OmoH+76vSvXTLDJy
	ShYO5VNs0yw2fJWUyo1hI+voMdz6a1l9KdGkua3ARXCyFgGYAy3FWIW2apEV5XIgWzPAPq
	VFeNDqXGoXU2MmvoP06ER9PS9efSClP7dAz0a9k4nAWEOazqkc6cMGnVZqroFA==
To: 
Cc: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>,
	Serge Hallyn <serge@hallyn.com>,
	Jan Kara <jack@suse.com>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	cocci@inria.fr,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH v2 06/11] ubifs: reorder capability check last
Date: Sun,  2 Mar 2025 17:06:42 +0100
Message-ID: <20250302160657.127253-5-cgoettsche@seltendoof.de>
In-Reply-To: <20250302160657.127253-1-cgoettsche@seltendoof.de>
References: <20250302160657.127253-1-cgoettsche@seltendoof.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_080724_455781_76B48E4E 
X-CRM114-Status: GOOD (  12.03  )
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
Reply-To: cgzones@googlemail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJvbTogQ2hyaXN0aWFuIEfDtnR0c2NoZSA8Y2d6b25lc0Bnb29nbGVtYWlsLmNvbT4KCmNhcGFi
bGUoKSBjYWxscyByZWZlciB0byBlbmFibGVkIExTTXMgd2hldGhlciB0byBwZXJtaXQgb3IgZGVu
eSB0aGUKcmVxdWVzdC4gIFRoaXMgaXMgcmVsZXZhbnQgaW4gY29ubmVjdGlvbiB3aXRoIFNFTGlu
dXgsIHdoZXJlIGEKY2FwYWJpbGl0eSBjaGVjayByZXN1bHRzIGluIGEgcG9saWN5IGRlY2lzaW9u
IGFuZCBieSBkZWZhdWx0IGEgZGVuaWFsCm1lc3NhZ2Ugb24gaW5zdWZmaWNpZW50IHBlcm1pc3Np
b24gaXMgaXNzdWVkLgpJdCBjYW4gbGVhZCB0byB0aHJlZSB1bmRlc2lyZWQgY2FzZXM6CiAgMS4g
QSBkZW5pYWwgbWVzc2FnZSBpcyBnZW5lcmF0ZWQsIGV2ZW4gaW4gY2FzZSB0aGUgb3BlcmF0aW9u
IHdhcyBhbgogICAgIHVucHJpdmlsZWdlZCBvbmUgYW5kIHRodXMgdGhlIHN5c2NhbGwgc3VjY2Vl
ZGVkLCBjcmVhdGluZyBub2lzZS4KICAyLiBUbyBhdm9pZCB0aGUgbm9pc2UgZnJvbSAxLiB0aGUg
cG9saWN5IHdyaXRlciBhZGRzIGEgcnVsZSB0byBpZ25vcmUKICAgICB0aG9zZSBkZW5pYWwgbWVz
c2FnZXMsIGhpZGluZyBmdXR1cmUgc3lzY2FsbHMsIHdoZXJlIHRoZSB0YXNrCiAgICAgcGVyZm9y
bXMgYW4gYWN0dWFsIHByaXZpbGVnZWQgb3BlcmF0aW9uLCBsZWFkaW5nIHRvIGhpZGRlbiBsaW1p
dGVkCiAgICAgZnVuY3Rpb25hbGl0eSBvZiB0aGF0IHRhc2suCiAgMy4gVG8gYXZvaWQgdGhlIG5v
aXNlIGZyb20gMS4gdGhlIHBvbGljeSB3cml0ZXIgYWRkcyBhIHJ1bGUgdG8gcGVybWl0CiAgICAg
dGhlIHRhc2sgdGhlIHJlcXVlc3RlZCBjYXBhYmlsaXR5LCB3aGlsZSBpdCBkb2VzIG5vdCBuZWVk
IGl0LAogICAgIHZpb2xhdGluZyB0aGUgcHJpbmNpcGxlIG9mIGxlYXN0IHByaXZpbGVnZS4KClNp
Z25lZC1vZmYtYnk6IENocmlzdGlhbiBHw7Z0dHNjaGUgPGNnem9uZXNAZ29vZ2xlbWFpbC5jb20+
ClJldmlld2VkLWJ5OiBTZXJnZSBIYWxseW4gPHNlcmdlQGhhbGx5bi5jb20+CkFja2VkLWJ5OiBS
aWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PgotLS0KdjI6IHNwbGl0IGludG8gdHdv
IHBhdGNoZXMgZm9yIGVhY2ggc3Vic3lzdGVtCi0tLQogZnMvdWJpZnMvYnVkZ2V0LmMgfCA1ICsr
Ky0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2ZzL3ViaWZzL2J1ZGdldC5jIGIvZnMvdWJpZnMvYnVkZ2V0LmMKaW5kZXggZDc2
ZWI3YjM5ZjU2Li42MTM3YWVhZGVjM2YgMTAwNjQ0Ci0tLSBhL2ZzL3ViaWZzL2J1ZGdldC5jCisr
KyBiL2ZzL3ViaWZzL2J1ZGdldC5jCkBAIC0yNTYsOCArMjU2LDkgQEAgbG9uZyBsb25nIHViaWZz
X2NhbGNfYXZhaWxhYmxlKGNvbnN0IHN0cnVjdCB1Ymlmc19pbmZvICpjLCBpbnQgbWluX2lkeF9s
ZWJzKQogICovCiBzdGF0aWMgaW50IGNhbl91c2VfcnAoc3RydWN0IHViaWZzX2luZm8gKmMpCiB7
Ci0JaWYgKHVpZF9lcShjdXJyZW50X2ZzdWlkKCksIGMtPnJwX3VpZCkgfHwgY2FwYWJsZShDQVBf
U1lTX1JFU09VUkNFKSB8fAotCSAgICAoIWdpZF9lcShjLT5ycF9naWQsIEdMT0JBTF9ST09UX0dJ
RCkgJiYgaW5fZ3JvdXBfcChjLT5ycF9naWQpKSkKKwlpZiAodWlkX2VxKGN1cnJlbnRfZnN1aWQo
KSwgYy0+cnBfdWlkKSB8fAorCSAgICAoIWdpZF9lcShjLT5ycF9naWQsIEdMT0JBTF9ST09UX0dJ
RCkgJiYgaW5fZ3JvdXBfcChjLT5ycF9naWQpKSB8fAorCSAgICBjYXBhYmxlKENBUF9TWVNfUkVT
T1VSQ0UpKQogCQlyZXR1cm4gMTsKIAlyZXR1cm4gMDsKIH0KLS0gCjIuNDcuMgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
