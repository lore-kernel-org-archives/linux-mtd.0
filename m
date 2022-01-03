Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60273C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jan 2022 11:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xrJgt5fIqbCrPBliLCT95I/ViKuCKCqJsYNx53R6Zko=; b=0fonpYC5Cf+5yT
	Te4olI0BvsvCNh5vTfv7ubDnINUPLd94lNG8OWNLzmOC1BkICn+g6QC/X4txjL4ly7Rss0rhQHuqh
	KJRxbB+9kM5gw6hzn6ft4m9Vu4XLAXolpZFyQ1c5TrB+k2Tmhgod8O13nIl5BKren8aPnKVYAozyZ
	ioDhKgU20k87tQDyn1QhL30gS9XF2L0GPjN+SlDDuHLqPBy9uoGD6cO0G1Mhoqytujl9HsxsYySiE
	sh3Pj8gTSFbwP7ueP1L6bc8Uftvi07cnT9qWJk7JfjJAiy3R/+NYsc9OlbQGJyohtrd/Cmj+w7vrk
	Pb569XMVUTU86vtCpfKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4LP7-008qpM-BQ; Mon, 03 Jan 2022 11:21:29 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4LOs-008qnf-46
 for linux-mtd@lists.infradead.org; Mon, 03 Jan 2022 11:21:15 +0000
Received: by mail-lf1-x134.google.com with SMTP id i31so74237887lfv.10
 for <linux-mtd@lists.infradead.org>; Mon, 03 Jan 2022 03:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=wOV689yLbbBmGRXg31clSU6hTuiiE+dmnKVgK8+G864=;
 b=UCpDfswFW46d3AoFdZ8WrYHp23qtaLQVSStiXpY2J+CycOqOt7m9xAARqzcw0nz4Gg
 kfFd814O0O4DvOeO3XQFjfOuYyMnybvcsTd000Rw13evxIowYeA9fSrYo/jBz/JCvPos
 lVjMBJcqzdUP841+WKTL0VSvcQJ31cPmi2mcZ6ADHUZu78fOKjIYrwZE6P25Jclk11EW
 SzP6NycYvyAr0fzMwGxLIPbMcOKLi7cxgkju0VeFOhFfv0HRkko7qq7hKTD2BKIM6GzO
 WyeAHnzWvpHwuTqaBOIWzS8FixJANcQDOnIj9D4ns5qOzjOfJb48osjp4huHO5/XgViU
 ZSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=wOV689yLbbBmGRXg31clSU6hTuiiE+dmnKVgK8+G864=;
 b=8MyxqVIBzGErQKQkgLlKoP/5qOvjuAWEVGPE6mRSV1Ommj3fU2+MTvF3ifrBEEc0Fx
 S5fuBB/av2aBYRuhty16F7VQ+y+uNH88KpbBmEh8dvgLfcCD+R+w5F4E+TTUuv4ek8SJ
 yblJMhQ4hmUPfxDYWFWy1Y2gQw7zroYFeQrXXXzZ4otX/6H7pBoJpf7i0z8hDQxtoO2U
 cN5jRl1XY2h9cOGuBO9EJeaN4tb9e6CaudUnxnhCLWsG5u2UfH3UjfRkglIUuT3ys8RX
 6QpqFvZjXd1uVFCg+jq928c8wIxTzknDQ6GTHog0fv4bP9kFEKD3FNSZiEsWsTyYPPDn
 uTfA==
X-Gm-Message-State: AOAM533PUYU+EPz4MRbmCxBojrlFjVopD+2DySbk+/kwC+klnpyHsn4b
 j4rTUSXKuelXwZ2RTv/vL5ViJFid6dQQ3pp9zQI=
X-Google-Smtp-Source: ABdhPJzs18QkFe5dzjOK8U81jSOwFAKXd/n/aG9av6nGNM/DyYzGjKnbDx0VN8YQpBJmWx4OBaLT9vrH/CDvNUOfr8o=
X-Received: by 2002:a05:6512:3f89:: with SMTP id
 x9mr13649452lfa.536.1641208872168; 
 Mon, 03 Jan 2022 03:21:12 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Mon, 3 Jan 2022 12:21:01 +0100
Message-ID: <CACna6rzr-KKAJ0eP1VO=pfU+cdGT3tukOg07Tv8jfBvAEdSaow@mail.gmail.com>
Subject: New OpenWrt rootfs format: ubifs volume with squashfs & overlay dir
To: OpenWrt Development List <openwrt-devel@lists.openwrt.org>
Cc: Olivier Valentin <valentio@free.fr>,
 MTD Maling List <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_032114_172808_643F126C 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
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

T24gc29tZSBVQkktYXdhcmUgZGV2aWNlcywgZmlybXdhcmUgZmlsZSBjYW4gY29udGFpbiBvbmx5
IGtlcm5lbCAmIDEKVUJJIHZvbHVtZS4gSXQgbWVhbnMgd2UgY2FuJ3QgdXNlOgoxLiByb290ZnMg
VUJJIHZvbHVtZSB3aXRoIHNxdWFzaGZzCjIuIHJvb3Rmc19kYXRhIFVCSSB2b2x1bWUgd2l0aCB1
YmlmcyAoZm9yIG92ZXJsYXkpCgpOb3RlOiBjcmVhdGluZyByb290ZnNfZGF0YSBkeW5hbWljYWxs
eSBpcyBub3QgYW4gb3B0aW9uIGFzIHRoYXQKd291bGRuJ3QgYmUgd2lwZWQgb3V0IHByb3Blcmx5
IHdoaWxlIGZsYXNoaW5nIG5ldyBmaXJtd2FyZSB3aXRoCmJvb3Rsb2FkZXIuCgoKVGhlIG9ubHkg
c29sdXRpb24gaWRlYSB3ZSBoYXZlIGlzIHRvIGJ1aWxkIHViaWZzIHZvbHVtZSB3aXRoOgoxLiAv
cm9vdC5zcXVhc2hmcwoyLiAvb3ZlcmxheS8KYW5kIGluY2x1ZGUgc3VjaCB1YmlmcyB2b2x1bWUg
aW4gZmlybXdhcmUgaW1hZ2UgZmlsZSBmb3Igc2VsZWN0ZWQgZGV2aWNlcy4KClRoYXQgb2YgY291
cnNlIHdpbGwgcmVxdWlyZSBpbml0cmFtZnMgd2l0aCB1c2VyLXNwYWNlIGhhbmRsaW5nIG1vdW50
aW5nIGFib3ZlLgoKSSdtIHBsYW5uaW5nIHRvIHN0YXJ0IHdvcmtpbmcgb24gdGhhdCBub3cuIElm
IGFueW9uZSBpcyB3aWxsaW5nIHRvCmhlbHAgdGhhdCdzIGhpZ2hseSBhcHByZWNpYXRlZCBhcyBJ
J20gbm90IHdlbGwgZmFtaWxpYXIgd2l0aCB0aGF0CnRvcGljLiBJZiB5b3UgY2FuIHRoaW5rIG9m
IGFueSBiZXR0ZXIgLyBzaW1wbGVyIHNvbHV0aW9uLCBwbGVhc2UgbGV0Cm1lIGtub3cgKm5vdyou
CgoKQWJvdmUgc29sdXRpb24gc3VnZ2VzdGVkIGJ5IE9saXZpZXIgaW4gdGhlIGUtbWFpbCB0aHJl
YWQ6CklkZW50aWZ5aW5nIFVCSSB2b2x1bWUgaW5zdGFuY2UgLyBzdG9yaW5nIFVCSSB2b2x1bWUg
bWV0YWRhdGEKaHR0cDovL2xpc3RzLm9wZW53cnQub3JnL3BpcGVybWFpbC9vcGVud3J0LWRldmVs
LzIwMjEtRGVjZW1iZXIvMDM3MzA4Lmh0bWwKCk15IHByZXZpb3VzIHJlcXVlc3QgZm9yIGhlbHAg
aW4gZS1tYWlsOgpyb290ZnNfZGF0YSBvbiBVQkktYXdhcmUgZGV2aWNlcwpodHRwOi8vbGlzdHMu
b3BlbndydC5vcmcvcGlwZXJtYWlsL29wZW53cnQtZGV2ZWwvMjAyMS1EZWNlbWJlci8wMzczMDQu
aHRtbApkaWRuJ3QgcmVzdWx0IGluIGFueSBpZGVhcy4KCi0tClJhZmHFggoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
