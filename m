Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FCCAC433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 17:38:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF14B65100
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 17:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF14B65100
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BdvzMsAgfGEMkJNPqCT9gZQlDnm2Oqv7/7AiF7DOf78=; b=oVaIaRXzO1irXSng8kzTq5kGTZ
	GcigxykvgzogkUrB3dAEhIOQrV66588nXf1G3yc877STpzUcITCClBsAWzBRCeMyUwDHvsuf5NYyc
	5UZoR8/H2osPEup5gfl6yOXxXT8Pc9SlZoyeqhTRarkyf9aeHf1hx4q4AWYHQC4QWKm16BkG5epRY
	zEHIn3u/sMxM0nE5tXSvvm0DHICK1dbYFoEIDkCD/x4+wqQ57HWevdADhFVDUdVXf6Xl+K98D3Itl
	dVl50c35WnQsui7iwHOj5FA5OkGT6SSVjbGgn4bipCEDY4DD2ekEEHFII0hLqQ10/4YGkOg2CZLPW
	K4OHzfcQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJJpg-001Sbr-CB; Mon, 08 Mar 2021 17:38:16 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJJpc-001SaB-5z
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 17:38:14 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id l8so10957702ybe.12
 for <linux-mtd@lists.infradead.org>; Mon, 08 Mar 2021 09:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=N6bzdC3b47Vf+ZY0kFLqPMyUat3BW91eHPvzPKerEmE=;
 b=UD6U2GrCY37DMEphqmlRdG0AHYEaEHxxXUpDTIrrpvRjnCcLtE52u9svSY7MW50jcF
 11BY9edOwtMkwgCWTErbdIbac5YZjr1W7uD28pVj0KB5vnMVkLj4kJ+9dxAvkws6k42W
 ltdnDdDvsIlWBqq14RQ+8iADvlxY26wJvbNcTJttpQgdarnTuRkWUUnwFJZmM4kfgcTy
 Un5vcIQDUxoUal9vrbWFmSLqhWfOCExJXRsk4b8WB7g04tb2drPW3gqN6kuwQ19Wdlid
 KD4HQi96FhOHuaDxBvqbtSc52TF4objeQZ7sWAGjCMob6LoE5BL1n5fZy6bCtEKfEJzZ
 wMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=N6bzdC3b47Vf+ZY0kFLqPMyUat3BW91eHPvzPKerEmE=;
 b=luaaQbdi8H9hMI+KzlE/htCblKcJEu47FZnfKnNFP4+BOqTq114WVrIqaOIhICYEBh
 yqNQW0DUHbow58UWzgMd4NLSfchrJ44O9bwl8QvxJf5e8PPumM6B6DePydG2s2t8HsE1
 B9YEHU16cCMWIgH9PCGt1kXjyEltpbT4qwirsaD5VmEfSBEz/STgE2ZyvWUuJS+Q9rio
 KmOMIBSp+bZ7cvVcutfRiEHyXzh1oo0PfkpPFHzfTe06KRAFEhq1Wc2eqBhhM/n1MwLi
 ld1IZ78C8/M7Pr6aEZOIkXi7pv6uIfYl09b9s4THL/Y1gQBVd8R6qPWkAE3zHbEUQflW
 4ioA==
X-Gm-Message-State: AOAM532FXky27FZsH8Y0yHGBRS/RjHag26VDgtjMcNvLIlGXGo7RF88P
 MQ0vqFHU1NrwrmYQmLNYvNFhexbeIz4NWH13/NWaYp9PnhY=
X-Google-Smtp-Source: ABdhPJyO/r8vnbqepwKYR89Np8oEpaVRF0Gzi4XGm8SE0xF5YAS4+JUX5cAypcjsQmkJT9TDjl11grpclKMMCYzG618=
X-Received: by 2002:a25:cc4b:: with SMTP id l72mr33817372ybf.455.1615225090085; 
 Mon, 08 Mar 2021 09:38:10 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Mon, 8 Mar 2021 18:37:59 +0100
Message-ID: <CACna6rzeCFKVRuX++oUbdEvUFCVSD-YrHHDKz+3z7-6Dr4K9FQ@mail.gmail.com>
Subject: MTD partitioning & firmware installation on Broadcom devices
To: linux-mtd@lists.infradead.org
Cc: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_173812_386379_71E169D8 
X-CRM114-Status: GOOD (  12.33  )
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

SGksCgpJJ20gdHJ5aW5nIHRvIGltcGxlbWVudCBmaXJtd2FyZSBpbnN0YWxsYXRpb24gb24gQkNN
NDkwOCBwbGF0Zm9ybS4KSXQncyByZWxhdGVkIHRvIE1URCBhbmQgcGFydGl0aW9uaW5nLgoKQkNN
NDkwOCBmaXJtd2FyZSBpbWFnZSBjb25zaXN0cyBvZjoKMS4gImJvb3RmcyIgSkZGUzIgcGFydGl0
aW9uIHdpdGg6IDk0OTA4LmR0YiwgY2ZlcmFtLjAwMCBhbmQgdm1saW51eC5segoyLiAidWJpIiBV
QkkgcGFydGl0aW9uIGFwcGVuZGVkIHRvIHRoZSAiYm9vdGZzIgoKVGhlIHByb2JsZW0gaXMgdGhh
dCB3aGVuIGZsYXNoaW5nIGZpcm13YXJlIGltYWdlIHRoZW4gY2ZlcmFtLjAwMCBmaWxlCmluIHRo
ZSAiYm9vdGZzIiBKRkZTMiBwYXJ0aXRpb24gaGFzIHRvIGJlIHJlbmFtZWQuICIwMDAiIHBhcnQg
aGFzIHRvCmJlIGNoYW5nZWQgdG8gdGhlIGxhc3QgdXNlZCBudW1iZXIgKyAxLgoKRXhhbXBsZToK
TGV0J3Mgc2F5IGRldmljZSBpcyBydW5uaW5nIGZpcm13YXJlIHdpdGggImJvb3RmcyIgSkZGUzIg
cGFydGl0aW9uCmNvbnRhaW5pbmcgY2ZlcmFtLjAwNy4KQWZ0ZXIgZmxhc2hpbmcgbmV3IGZpcm13
YXJlICJib290ZnMiIEpGRlMyIHBhcnRpdGlvbiBzaG91bGQgY29udGFpbgpjZmVyYW0uMDA4IChp
bnN0ZWFkIG9mIGNmZXJhbS4wMDAgYXMgcHJvdmlkZWQgaW4gdGhlIGZpcm13YXJlIGltYWdlKS4K
CkknbSB0cnlpbmcgdG8gZmluZCBhIHdheSBmb3IgaGFuZGxpbmcgdGhhdC4KCgpTb2x1dGlvbiAj
MQpSZW5hbWluZyBjZmVyYW0uMDAwIGJlZm9yZSBmbGFzaGluZyAobXRkIHdyaXRlKSBpbWFnZS4K
SSBkb24ndCBzZWUgYW55IGNsZWFuIHdheSBvZiBkb2luZyB0aGF0LiBJIGNvdWxkIGV4dHJhY3Qg
Ym9vdGZzLmpmZnMyCm91dCBvZiBmaXJtd2FyZSBpbWFnZSBidXQ6CjEuIFRoZXJlIGlzIG5vIHRv
b2wgZm9yIG1vZGlmeWluZyBKRkZTMiBpbWFnZXMKMi4gVGhlIG9ubHkgdG9vbCBmb3IgZXh0cmFj
dGluZyBKRkZTMiBpbWFnZSBjb250ZW50IGlzIFB5dGhvbiBzY3JpcHQuClB5dGhvbiBzZWVtcyB0
b28gaGVhdnkgc29sdXRpb24gZm9yIGZpcm13YXJlIHVwZ3JhZGUgdGFzay4KMy4gSSBjYW4ndCBt
b3VudCBib29mcy5qZmZzMi4gSSdkIG5lZWQgc29tZSB2aXJ0dWFsIG10ZCBkZXZpY2UuIEFsc28g
YQpiaXQgb3ZlcmtpbGwgaXQgc2VlbXMuCgoKU29sdXRpb24gIzIKRmxhc2hpbmcgZmlybXdhcmUg
aW1hZ2UgYXMgaXMgKHdpdGggY2ZlcmFtLjAwMCkgYW5kIGFkanVzdGluZyBpdC4KVGhpcyBzaG91
bGQgYmUgbmljZXIgYXMgbW91bnRpbmcgSkZGUzIgTVREIHBhcnRpdGlvbiBpcyBzaW1wbGUuIFRo
ZQpwcm9ibGVtIGlzIHBhcnRpdGlvbmluZy4KSSdkIG5lZWQgdG8gcmVtb3ZlIE1URCBwYXJ0aXRp
b25zIGFuZCB0cmlnZ2VyIHJlLXBhcnRpdGlvbmluZyBvZgoiZmlybXdhcmUiIHBhcnRpdGlvbi4g
T25seSBvbmNlIEkgaGF2ZSBMaW51eCBjcmVhdGUgImJvb3RmcyIgYW5kICJ1YmkiCnBhcnRpdGlv
bnMgYWdhaW4gZm9yIG1lIEkgY291bGQgbW91bnQgImJvb3RmcyIgYW5kIHJlbmFtZSB0aGUgZmls
ZS4KVGhlcmUgaXMgbm8gc3VwcG9ydCBmb3Igc3VjaCByZXBhcnRpdGlvbmluZyBhdCB0aGlzIHBv
aW50IEFGQUlLLgoKCkNhbiB5b3Ugc2VlIGFueSBvdGhlciBzb2x1dGlvbiBJIGRpZG4ndCB0aGlu
ayBhYm91dD8KT3Igc2hvdWxkIEkgcHJvY2VlZCB3aXRoIG9uZSBvZiBhYm92ZSBzb2x1dGlvbnM/
IExpa2Ugd3JpdGluZyBhIHRvb2wKZm9yIG1vZGlmeWluZyBKRkZTMiBpbWFnZXMuIE9yIHBhdGNo
aW5nIE1URCB0byBzdXBwb3J0IHJlcGFydGl0aW9uaW5nPwoKLS0gClJhZmHFggoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
