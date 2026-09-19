Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A46BC982D7
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2026 15:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ctPOIUKBzFkeBvibH8WyabIZhn2mbB7b02em6m1z58=; b=yBiogEXaZqbFwm
	klJk74w6HV+1dgrsU4C26pyvR+B/l7PhfLur3YWt2FA+IfwSBLQo//s7p7EUcPmj/YOSECxkPhwA2
	YhNF95wPCR6nHudUooyiqmnELekGzg5nrnP3beBNhtl0X6gdesCLX0/dOKZDkxEjgXDv5xWcJy0Yl
	X9iz8tzIAqZnVd3JkA3fvrLBK9tZuUGlE56hHviy0YVydh9h/Bbpz84KYH3jlI+w1nWRT1NB/svlS
	4/WPUeKsbS2DOXqts6b4fUpvbdg4fLJmAtyfPuUtmsYBZCBvHAJqVmxnrVGUU2aV3lIC9bOhTa2/n
	7tfYjO6oIYfzgmPAGTGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7wzx-0000000GRNb-2zkR;
	Sat, 19 Sep 2026 15:29:05 +0000
Received: from mail-yx2-x0f.google.com ([2607:f8b0:4864:41::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7wzv-0000000GRN1-2lzZ
	for linux-mtd@lists.infradead.org;
	Sat, 19 Sep 2026 15:29:05 +0000
Received: by mail-yx2-x0f.google.com with SMTP id 956f58d0204a3-66e4ab201ecso1465770d50.2
        for <linux-mtd@lists.infradead.org>; Sat, 19 Sep 2026 08:29:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789831742; cv=none;
        d=google.com; s=arc-20260327;
        b=H5so1ObVcO9nHA+e37jspyQBtEXkFNTnILoD0j3I4d5amz18L5Dm74wOgzozMOAiK5
         WNQQQjXMl/rYgaEMWHcKi4dM18yn/ycFKF6xYRwaJe++osfcSaUPIVVLVJIRDyHdzBKR
         zZLEZCmq7fX2mfeSErw2vhaSRi13VY8tQ9JD8S0T+r3S+6ThMYsy90S6GdHjOFu17N97
         UEXOPdfS2BBpTME+6KP0SCz6rXQBumRDVdh8+UfiNHj9F95dzbtgJFc/a321lT5CZQ4c
         +m5mZNIYtXc3uUSvPU5/3loTzi3Crn5TQahmOLYM8/hVWXOJW2glCPWQxaBNfCIioBkL
         OeqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l0TpZBfQv1YVfjKqwYzlR7A5wrn37+yIqc+S/AtQHiQ=;
        fh=EtC2OuxopGb3JwAUjyEWAgnUhpnrEdBGEbQGS48vOoI=;
        b=T7YXNx+77gRRQsOGayi/MXc0K07SZqLHYqNxhUEkHRk8qRmkvrdtNDclrU2HcUceeI
         Rm3qQMi9Hp50+UsH/VAm1RjLs5KuKhuU+HiNiAJJz7sJ/6VKoBA4SBClFD7FKE1L8NZQ
         LTpAY9U4A+XWGypcZENBZTGLtLll9gjC09dx2StcipAshM7e9hLerJS0AVPf6+yk9vrl
         QX+r6Uw9bLTRe6sy6aWaCVYtZ9/mXQS5Jd+9VYjfQtWjqxpjfJ+WOea7CTDsMPovAPVQ
         KhISZqhixcWxbTt79eaedfyhRKUccowb9q8nTvFXoIhPeFaqg/OijCHPAmaulAIwM/No
         J9WQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thechris.in; s=google; t=1789831742; x=1790436542; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l0TpZBfQv1YVfjKqwYzlR7A5wrn37+yIqc+S/AtQHiQ=;
        b=v2hwAmL+dZbd4lV491z7KUaC/dCbsmVhUiZuBXTxxye8PuETCu/UIR9yAeXFdGapO4
         trban9w7bIVlVSIC7qTkJ1xxCY1DVG+Ou9otnT8o/sBFzvOLAM2zLMPJSG24zO2dLcTh
         ost9dD5wf1JfCs8BG6E7A5dl3zlzMcEFE3tRqyFRA4lK71GaNVnMzIiNwGN3XFfPuAb0
         MQZmIGZPreyEbYMmAjOUQULet+GWcWswv8RfG8k7oimYzeGdfMKFAaUC7mcZ8sMx+fV8
         80SrLA2UkB9UFef+xq8TJrHhxzMkGN50QlWRZ+SmpnQyPwb/vaccivNXYGnSp4oQ4oQu
         0GaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789831742; x=1790436542;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l0TpZBfQv1YVfjKqwYzlR7A5wrn37+yIqc+S/AtQHiQ=;
        b=U9Okf4gWUWdnjqujrGboWfxy6HZW6rNzAFz4a0OcQldgoVgUUTvwjkA60koCIhz4Za
         pvoUzk4fTNGqi+39vvxiGemLhCjm2zgyCjlgWgGujQnl0+VwPjDQ+np2r5+7PYuB/Uc6
         gO8KokbdHobOUJgccqUmucz+a9dv1Y+t0u8UcBSE0fD+F8btqzPqv4NV3yLej5xZA94Z
         fOBCclLzw+XdoLiGXzjKm8LVNnVbYtovdUH8zY7+91hlfv26tBl8Od3MjBSEVZ/5qnLW
         MiLOYWalrzCWdrvkl6i6iTQ3m9GaR0tJecVgj+VbqgZC8x+Pz0XxTWR2p6Fzej1JbjC9
         FuyA==
X-Forwarded-Encrypted: i=1; AKwUvBxtpXQ1Xkv7gc+OSspbgvoddV4akrg2aKxTqFn/1+DXJAxGdDdm7/9NRUcmOvr8aTx9J22Rc7pglzE=@lists.infradead.org
X-Gm-Message-State: AFuF++mG1EO4EegJbudvGUW0+U/cCASsQ5FHoWBM0G+Nr9a0H3IeRdxy
	jkQBFKOT1tdmCM739+X9z0VtmIfz8Q/oj5KB1z+PIjyhuirAKYEuAdt1rSUvQju3sh/o9Wzw/a9
	6C1uBFKkREszOlczn2oVnloCfqVqbTe/NZq65G6rJ9EA=
X-Gm-Gg: AYBFou2IeWE6+dyhPekL2MLr//XRO6HFEHlD5Ca3z2kWJ/4IE5RuNjyHs9c7aEyPNEi
	1h2MlViwNMWww3OUkotlgVMolMVzZpi7+BC10Y9Yg+2F994W4iGNIjYJWhB1UHjjNXYtYKn/FS5
	+m7AJyRJc595GVFiw10Kveet0ROIzdZYLyKCLpivhRiyrHkOnG5G6usoGewJM5F91w6OKBmkTH0
	wdd0ee6BKRVq15BxAc1DxjkX7gwVPv01bJPhvixA7YYfarTsN8X4kcwbCZprLVnGmiOvsJ016Pn
	wCNwbav+QtQMjCRXlcunpLe4ZGhdAzF3Egz6dxGt3uovN3FmY8Unj2Ybzzg/agNtJSO2KWD4igA
	U5kVsup0IUbFP7inbqMD0cc/X1809eRJ38nNgOhXtgvV30fI+xB5y2VUq9N2tEZ1Fcqc0mnOBj8
	xJBunJFeHGhYVCTWg=
X-Received: by 2002:a05:690e:4511:20b0:672:99e1:11e8 with SMTP id
 956f58d0204a3-67299e11752mr455363d50.133.1789831742087; Sat, 19 Sep 2026
 08:29:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAE2Bdm3NuEHshrG6K2boKAnCQUvT5SX79cP9nPgS2s1afzY1hg@mail.gmail.com>
 <6aab0f82.e91c2013.3bdb06.0009.GAE@google.com> <CAE2Bdm2wzxj-J0TM8F+3SVnu0W3HeiROW97U4qvBeyHKdHJFmg@mail.gmail.com>
 <2026091753-broadness-bootie-b683@gregkh> <CAE2Bdm14hif17B8RTAE+PhWEps5Fzh=WPurZeSNp9C6TqCKumg@mail.gmail.com>
 <aqwuWWMwdIcx3704@cashel.logfs.org> <mu82xsi6.76ee613a-07fb-48b1-9336-99e8780e8b6e@nod.at>
 <CAE2Bdm3FqBPAMxqKoz_h1cw+OXpm=LJHdJjsME_Jy966tqhq_A@mail.gmail.com> <aq6gJTYTpTr8sYPj@cashel.logfs.org>
In-Reply-To: <aq6gJTYTpTr8sYPj@cashel.logfs.org>
From: Chris Roy <iam@thechris.in>
Date: Sat, 19 Sep 2026 20:58:51 +0530
X-Gm-Features: AcwNN1WmuQ-yAJK_L0Mqu0n7bynCj_HJ7gLPmHLdxL6kt8_egR93r-O600_Qqss
Message-ID: <CAE2Bdm3K+ZnrfB7xzkg=2fzMs7AmJzdF3aYCpN00h90TR6FMog@mail.gmail.com>
Subject: Re: [syzbot] [fs?] possible deadlock in ovl_create_object (2)
To: =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@barelysecure.org>
Cc: Richard Weinberger <richard@nod.at>, Greg KH <gregkh@linuxfoundation.org>, 
	syzbot <syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com>, dakr@kernel.org, 
	driver-core@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com, linux-mtd@lists.infradead.org, 
	miquel.raynal@bootlin.com, vigneshr@ti.com, 
	Adarsh Das <adarshdas950@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_082903_859608_46A0289E 
X-CRM114-Status: GOOD (  34.59  )
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

T24gU2F0LCBTZXAgMTksIDIwMjYsIErDtnJuIEVuZ2VsIHdyb3RlOgo+IEZpbmRpbmcgZ29vZCBu
YW1lcyBpcyBwcm9iYWJseSBhIGZldGlzaCBvZiBtaW5lLCBzbyAidmFsIiBpcyBtaWxkbHkKPiBk
aXN0dXJiaW5nIHRvIG1lLiBbLi4uXQoKSSBoYXZlIGEgc2ltaWxhciBwZXQgcGVldmUgaW4gbXkg
ZG9tYWluLiBJIGtlcHQgInZhbCIgc2luY2UKaXQgbWlycm9ycyBibG9jazJtdGRfc2V0dXAyKCkn
cyBvd24gInZhbCIgcGFyYW1ldGVyCih0aGUgcmF3IDxkZXY+WyxbPGVyYXNlc2l6ZT5dWyw8bGFi
ZWw+XV0pLCBzbyBJIGtlcHQgaXQgZm9yCmNvbnNpc3RlbmN5IHdpdGggdGhlIGV4aXN0aW5nIGNh
bGwgY2hhaW4uIEkgaGFkIGNvbnNpZGVyZWQKInNwZWMiIGJ1dCBwcm9iYWJseSBpdCB3b3VsZCBo
YXZlIGJlZW4gc2ltaWxhcmx5IHVuaW1hZ2luYXRpdmUuCgo+IElzIHRoaXMgY2hlY2sgbmVjZXNz
YXJ5PyBbLi4uXSBMb29rcyBsaWtlIHRoZSBrZXJuZWwgaXMgc3RpbGwKPiB1bmRlY2lkZWQgd2hl
dGhlciBjaGVja3MgYXJlIG5lY2Vzc2FyeSBvciBub3QuCgpJIHdpbGwga2VlcCBpdC4ga3phbGxv
YygpL2tzdHJkdXAoKSB1bmRlciBwbGFpbiBHRlBfS0VSTkVMIGNhbiBzdGlsbApyZXR1cm4gTlVM
TCB1bmRlciByZWFsIG1lbW9yeSBwcmVzc3VyZSAobm8gX19HRlBfTk9GQUlMIGhlcmUpLCBhbmQK
ZHJvcHBpbmcgaXQgd291bGQgYmUgaW5jb25zaXN0ZW50IHdpdGggdGhlIGtzdHJkdXAoKSBjaGVj
ayB0d28gbGluZXMKYmVsb3cuCgo+IFRoYXQncyBxdWl0ZSBhIGZldyBjYWxscyB0byB0aGUgc2Ft
ZSBmdW5jdGlvbi4gWy4uLl0gSWYgeW91IGZlZWwKPiBtb3RpdmF0ZWQgdG8gZGlnIGRlZXBlciwg
cGxlYXNlIGRvISBJZiBub3QsIEknZCByYXRoZXIgbGVhdmUgdGhlCj4gbWVzcyBpbiBwbGFjZSB0
aGFuIGNvbWUgdXAgd2l0aCBhIGhhbGYtaGVhcnRlZCBhdHRlbXB0IG9mIGEKPiBzb2x1dGlvbi4K
ClRydWUuIEl0IGlzIGFjY3JldGlvbi4gSSdkIHJhdGhlciBub3QgYm9sdCBhIHJlZGVzaWduIG9u
dG8gdGhpcyBmaXguCkhvd2V2ZXIsIEkgY2FuIGxvb2sgYXQgc2V0dXAyKCkncyBjYWxsZXJzIGFz
IGEgc2VwYXJhdGUgZWZmb3J0LgoKUmVnYXJkcywKLSBDaHJpcwoKIkJ1dCBob3cgY291bGQgeW91
IGxpdmUgYW5kIGhhdmUgbm8gc3RvcnkgdG8gdGVsbD8iCgpPbiBTYXQsIDE5IFNlcHQgMjAyNiBh
dCAyMDoxNiwgSsO2cm4gRW5nZWwgPGpvZXJuQGJhcmVseXNlY3VyZS5vcmc+IHdyb3RlOgo+Cj4g
T24gU2F0LCBTZXAgMTksIDIwMjYgYXQgMDI6MjI6MTVQTSArMDUzMCwgQ2hyaXMgUm95IHdyb3Rl
Ogo+ID4KPiA+ICtzdHJ1Y3QgYmxvY2sybXRkX3NldHVwX3dvcmsgewo+ID4gKyAgICAgc3RydWN0
IHdvcmtfc3RydWN0IHdvcms7Cj4gPiArICAgICBzdHJ1Y3QgY29tcGxldGlvbiBkb25lOwo+ID4g
KyAgICAgY2hhciAqdmFsOwo+ID4gKyAgICAgaW50IHJldDsKPiA+ICt9Owo+Cj4gRmluZGluZyBn
b29kIG5hbWVzIGlzIHByb2JhYmx5IGEgZmV0aXNoIG9mIG1pbmUsIHNvICJ2YWwiIGlzIG1pbGRs
eQo+IGRpc3R1cmJpbmcgdG8gbWUuICBJdCdzIG5vdCBhbiBvYmplY3RpdmVseSBiYWQgbmFtZSwg
anVzdCBzb21ldGhpbmcKPiB3aGVyZSBJJ2Qgc3BlbmQgYW5vdGhlciBmaXZlIG1pbnV0ZXMgdHJ5
aW5nIHRvIGNvbWUgdXAgd2l0aCBzb21ldGhpbmcKPiBiZXR0ZXIuCj4KPiA+ICsvKiBSdW5zIGJs
b2NrMm10ZF9zZXR1cDIoKSBvbiBzZXR1cF93cSwgYmxvY2tpbmcgdW50aWwgaXQgY29tcGxldGVz
ICovCj4gPiArc3RhdGljIGludCBibG9jazJtdGRfc2V0dXBfZGVmZXIoY29uc3QgY2hhciAqdmFs
KQo+ID4gK3sKPiA+ICsgICAgIHN0cnVjdCBibG9jazJtdGRfc2V0dXBfd29yayAqdzsKPiA+ICsg
ICAgIGludCByZXQ7Cj4gPiArCj4gPiArICAgICB3ID0ga3phbGxvYyhzaXplb2YoKncpLCBHRlBf
S0VSTkVMKTsKPiA+ICsgICAgIGlmICghdykKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FTk9N
RU07Cj4KPiBJcyB0aGlzIGNoZWNrIG5lY2Vzc2FyeT8gIEknbSBpbiB0aGUgY2FtcCBvZiAibWFs
bG9jIHNob3VsZCBuZXZlciByZXR1cm4KPiBOVUxMIi4gIFRoYXQgY29uZGl0aW9uIGlzIHNvIHJh
cmUgdGhhdCBpdCBpcyBlZmZlY3RpdmVseSBpbXBvc3NpYmxlIHRvCj4gdHJ1c3QgY2FsbGVycyB3
aXRoIGVycm9yIGhhbmRsaW5nLiAgU28gdGhlIHJpZ2h0IGFwcHJvYWNoIGlzIHRvIGNyYXNoCj4g
KG9yIGtlcm5lbCBwYW5pYyBoZXJlKSBpbnN0ZWFkIG9mIHJldHVybmluZyBhbiBlcnJvci4KPgo+
IExvb2tpbmcgaW50byBzb3VyY2VzIEkgc2VlIHRoaXM6Cj4gc3RhdGljIGlubGluZSB2b2lkICpr
emFsbG9jKHNpemVfdCBzLCBnZnBfdCBnZnApCj4gPiB7Cj4gPiAgICAgICB2b2lkICpwID0ga21h
bGxvYyhzLCBnZnApOwo+ID4KPiA+ICAgICAgIG1lbXNldChwLCAwLCBzKTsKPiA+ICAgICAgIHJl
dHVybiBwOwo+ID4gfQo+Cj4gV2UgaGF2ZSBhdCBsZWFzdCBvbmUgZXhhbXBsZSBvZiBleHBsaWNp
dGx5IG5vdCBjaGVja2luZyB0aGUgcmV0dXJuCj4gdmFsdWUuICBCdXQgd2UgaGF2ZSBvdGhlciBw
cm9taW5lbnQgZXhhbXBsZXMgb2YgY2hlY2tpbmcgYXMgd2VsbC4gIExvb2tzCj4gbGlrZSB0aGUg
a2VybmVsIGlzIHN0aWxsIHVuZGVjaWRlZCB3aGV0aGVyIGNoZWNrcyBhcmUgbmVjZXNzYXJ5IG9y
IG5vdC4KPgo+ID4gLSAgICAgcmV0dXJuIGJsb2NrMm10ZF9zZXR1cDIodmFsKTsKPiAuLi4KPiA+
IC0gICAgICAgICAgICAgcmV0dXJuIGJsb2NrMm10ZF9zZXR1cDIodmFsKTsKPiAuLi4KPiA+ICsg
ICAgICAgICAgICAgcmV0ID0gYmxvY2sybXRkX3NldHVwMih2YWwpOwo+IC4uLgo+ID4gICAgICAg
ICAgICAgICByZXQgPSBibG9jazJtdGRfc2V0dXAyKGJsb2NrMm10ZF9wYXJhbWxpbmUpOwo+Cj4g
VGhhdCdzIHF1aXRlIGEgZmV3IGNhbGxzIHRvIHRoZSBzYW1lIGZ1bmN0aW9uLiAgSWYgc2V0dXAg
Z2V0cyB0aGF0Cj4gY29tcGxpY2F0ZWQsIHRoYXQncyBhIHN0cm9uZyBpbmRpY2F0aW9uIHRoYXQg
d2UncmUgZG9pbmcgdGhpbmdzIHdyb25nLgo+IFR5cGljYWxseSB3ZSBnZXQgaW50byBzdWNoIGEg
bWVzcyBvbmUgd2VsbC1pbnRlbnRpb25lZCBjaGFuZ2UgYXQgYSB0aW1lLgo+IEZpbmQgYSBidWcs
IGZpeCBpdCBieSBhZGRpbmcgYW5vdGhlciBjYWxsZXIsIHJlcGVhdC4KPgo+IEl0IGlzbid0IG9i
dmlvdXMgaG93IHdlIGNvdWxkIGltcHJvdmUgdGhpbmdzLiAgU29tZXRpbWVzIGl0J3MgbGFjayBv
Zgo+IGluZnJhc3RydWN0dXJlIGFuZCB0aGUgZW50aXJlIGNvbXBsaWNhdGVkIHNldHVwLWRhbmNl
IHNob3VsZCBiZSBtb3ZlZCB0bwo+IGNvbW1vbiBjb2RlLiAgRHJpdmVyIGNhbiB0aGVuIGNhbGwg
YSBzaW5nbGUgZnVuY3Rpb24gdG8gZGVhbCB3aXRoCj4gZXZlcnl0aGluZy4KPgo+IEJ1dCBpZiB0
aGVyZSdzIG9ubHkgYSBzaW5nbGUgZHJpdmVyIHVzaW5nIHN1Y2ggaW5mcmFzdHJ1Y3R1cmUsIG1h
eWJlIHRoZQo+IGRyaXZlciBpcyBkb2luZyB0aGluZ3Mgd3JvbmcgYW5kIHNob3VsZCBjb3B5IHdo
YXRldmVyIG90aGVyIGRyaXZlcnMgYXJlCj4gZG9pbmcuICBUaGUgcHJvYmxlbSBzaG91bGRuJ3Qg
YmUgdW5pcXVlIHRvIGEgc2luZ2xlIGRyaXZlciwgc28gd2Ugc2hvdWxkCj4gZmluZCB0aGUgYmVz
dCBzb2x1dGlvbiBhbmQgdGhlbiB1c2UgaXQgZXZlcnl3aGVyZS4KPgo+IEkgZG9uJ3Qga25vdyB0
aGUgY29ycmVjdCBhbnN3ZXIgaGVyZS4gIElmIHlvdSBmZWVsIG1vdGl2YXRlZCB0byBkaWcKPiBk
ZWVwZXIsIHBsZWFzZSBkbyEgIElmIG5vdCwgSSdkIHJhdGhlciBsZWF2ZSB0aGUgbWVzcyBpbiBw
bGFjZSB0aGFuIGNvbWUKPiB1cCB3aXRoIGEgaGFsZi1oZWFydGVkIGF0dGVtcHQgb2YgYSBzb2x1
dGlvbi4KPgo+IErDtnJuCj4KPiAtLQo+IFlvdSBjYW5ub3Qgc3VwcG9zZSB0aGF0IE1vbGllcmUg
ZXZlciB0cm91YmxlZCBoaW1zZWxmIHRvIGJlIG9yaWdpbmFsIGluIHRoZQo+IG1hdHRlciBvZiBp
ZGVhcy4gWW91IGNhbm5vdCBzdXBwb3NlIHRoYXQgdGhlIHN0b3JpZXMgaGUgdGVsbHMgaW4gaGlz
IHBsYXlzCj4gaGF2ZSBuZXZlciBiZWVuIHRvbGQgYmVmb3JlLiBUaGV5IHdlcmUgY3VsbGVkLCBh
cyB5b3UgdmVyeSB3ZWxsIGtub3cuCj4gLS0gQW5kcmUtTG91aXMgTW9yZWF1IGluIFNjYXJhYm91
Y2hlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
