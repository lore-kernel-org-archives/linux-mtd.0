Return-Path: <SRS0=QXPY=3F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AFCEC33CB3
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2020 23:44:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A6372072E
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2020 23:44:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CwfMPdqr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nkMxee7m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A6372072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ACEST4xjBk/p6Q5FALALyxbH5AyImshfzu0DYuCTDyY=; b=CwfMPdqr4wN0Iv
	6oCE30yqi0egTsG8eh/VDVEFq0WsWmGTq+MsvrEGTdduEvxjKe/k+XSO+D0DoxjM4SSc68cEl3+0I
	WRrhTL2gE06E4tkPU+MWXSOe2zcxjv8s6yNAVHhqy9rHx0VE6rI7webT3luMXAPiWF7dfEIBeC2Qv
	Gjd5K8DWSgzp9V11CVz5vjIoUpyK1U+edDNoqAZJ08YwZtsL40XozK2zqpYTMpStQmwg9yXXfRzfw
	DDOKYjKZPhtNoL6OMmC/fY7vQ+8BqiNm09eEUic/VrSEyzhJJ0WI6sgTJox5OnCugyb1dVTF4UIIW
	qhEQXd4Rztpn+B4w4JyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isEoE-0001j8-Vm; Thu, 16 Jan 2020 23:44:18 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isEoB-0001iG-VJ
 for linux-mtd@lists.infradead.org; Thu, 16 Jan 2020 23:44:17 +0000
Received: by mail-wr1-x442.google.com with SMTP id y17so20958452wrh.5
 for <linux-mtd@lists.infradead.org>; Thu, 16 Jan 2020 15:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dHTGBkgzigId/zi0TOnYQjBsf6HAV19Aov7etVocQr4=;
 b=nkMxee7mkhPsFnsTSgqVfS0Up+8cTe72MvM/2bMae4kd1D0j7q1OUOdW0oLJxBbSIK
 9Bi90ue3VO7d+kNj/BGIwnKKDFCAeb3JxpNleXMZETVXxztv1FIZFCIO66SPBeHDnkXJ
 WDA0TAbej0BCxjfO9HgpdHtEkdbpsP2wkxY/ktTPOF9jGQpd5h0kup9rrP8UKQ+AEy9B
 xzLvt3IZ71WZZRPbY9DQFQrKlS5Qf9aZSejvh9ePXKBHpsxk695jLXQSpp9oGijyPgno
 CECYx2xCkwz1/b/1dPu/WExst1CjFWG8F8q7i4DfSFwFRLPE9uSSS7gyOHJu+f0PCG6F
 1iRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dHTGBkgzigId/zi0TOnYQjBsf6HAV19Aov7etVocQr4=;
 b=JIws3jPCNg6Q0CjFsRBqxyrWNKY5ZdE+KNOfgOTwDEeZ/RDRsg1iunqlFmEar7uhE7
 ZYOopob0rmh21pQQVnHK2Os6F3n4pa1ffjbF3uz9KFWN3U3XKJ8keaIN8Zqsodq2dm9I
 Mn1/+M1kIfGtEuxh1DKBQ1VBieDmobmoLcgOajWSNC2ErbTyuFX3+RY/nkDHP2VwSLsu
 arVFsHHRK+WVelD478vunRo4lPLBA0UY9cArmd6n8WEey34vCZ3rbNB3lusDRIjDh7cR
 N6EEM8rKLrLA32l6TvZmlHwDe6j3oCI0yVtgbH2xUmamJxhTDt6ybKKCcgyOlUF4ADlq
 dd4A==
X-Gm-Message-State: APjAAAXPRVuBLmvR1gW+EbxIwnc4CSVXMbqcH2Gu6fVj6XizSaWjEc79
 HVi/daNMJjDTiGbibuuQJ4dS9Yis0rLroIi3Rgc=
X-Google-Smtp-Source: APXvYqzqW75Nq6g1kCwaCaY8GLY0vks1V3PmDr3vfRkYbRP+psJfmZtTg8T656o2Zp8oScWytghb39gCT2F8UkX0DLo=
X-Received: by 2002:adf:f606:: with SMTP id t6mr5632437wrp.85.1579218254750;
 Thu, 16 Jan 2020 15:44:14 -0800 (PST)
MIME-Version: 1.0
References: <20200113105156.25945-1-geert@linux-m68k.org>
In-Reply-To: <20200113105156.25945-1-geert@linux-m68k.org>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 17 Jan 2020 00:44:03 +0100
Message-ID: <CAFLxGvxNUcKiaCxXy_oracH-3xg3MPETxkaDqgtkMkB1vp-02Q@mail.gmail.com>
Subject: Re: [PATCH] ubifs: Fix ino_t format warnings in orphan_delete()
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_154416_034260_C9002396 
X-CRM114-Status: GOOD (  12.02  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-alpha@vger.kernel.org,
 linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 linux-s390@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKYW4gMTMsIDIwMjAgYXQgMTE6NTIgQU0gR2VlcnQgVXl0dGVyaG9ldmVuCjxnZWVy
dEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4KPiBPbiBhbHBoYSBhbmQgczM5MHg6Cj4KPiAgICAg
ZnMvdWJpZnMvZGVidWcuaDoxNTg6MTE6IHdhcm5pbmc6IGZvcm1hdCDigJglbHXigJkgZXhwZWN0
cyBhcmd1bWVudCBvZiB0eXBlIOKAmGxvbmcgdW5zaWduZWQgaW504oCZLCBidXQgYXJndW1lbnQg
NCBoYXMgdHlwZSDigJhpbm9fdCB7YWthIHVuc2lnbmVkIGludH3igJkgWy1XZm9ybWF0PV0KPiAg
ICAgLi4uCj4gICAgIGZzL3ViaWZzL29ycGhhbi5jOjEzMjozOiBub3RlOiBpbiBleHBhbnNpb24g
b2YgbWFjcm8g4oCYZGJnX2dlbuKAmQo+ICAgICAgICBkYmdfZ2VuKCJkZWxldGVkIHR3aWNlIGlu
byAlbHUiLCBvcnBoLT5pbnVtKTsKPiAgICAgLi4uCj4gICAgIGZzL3ViaWZzL29ycGhhbi5jOjE0
MDozOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYZGJnX2dlbuKAmQo+ICAgICAgICBk
YmdfZ2VuKCJkZWxldGUgbGF0ZXIgaW5vICVsdSIsIG9ycGgtPmludW0pOwo+Cj4gX19rZXJuZWxf
aW5vX3QgaXMgInVuc2lnbmVkIGxvbmciIG9uIG1vc3QgYXJjaGl0ZWN0dXJlcywgYnV0IG5vdCBv
bgo+IGFscGhhIGFuZCBzMzkweCwgd2hlcmUgaXQgaXMgInVuc2lnbmVkIGludCIuICBIZW5jZSB3
aGVuIHByaW50aW5nIGFuCj4gaW5vX3QsIGl0IHNob3VsZCBhbHdheXMgYmUgY2FzdCB0byAidW5z
aWduZWQgbG9uZyIgZmlyc3QuCj4KPiBGaXggdGhpcyBieSByZS1hZGRpbmcgdGhlIHJlY2VudGx5
IHJlbW92ZWQgY2FzdHMuCj4KPiBGaXhlczogODAwOWNlOTU2YzNkMjgwMiAoInViaWZzOiBEb24n
dCBsZWFrIG9ycGhhbnMgb24gbWVtb3J5IGR1cmluZyBjb21taXQiKQo+IFNpZ25lZC1vZmYtYnk6
IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+Cj4gLS0tCj4gIGZzL3Vi
aWZzL29ycGhhbi5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgpBcHBsaWVkISBUaGFuayB5b3UsIEdlZXJ0LgoKLS0gClRoYW5rcywK
Ly9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
