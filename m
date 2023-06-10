Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A6DC7EE2E
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Jun 2023 22:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CxeEzfkK5OcRn7E1P+yIf+BBmYSi7JKh1dHy3PLFLoQ=; b=p4IXA1XuU3o4SA
	FeNOjRG+8xSuSJzF9CxHYGiSKEWsDf9kAo87+gIFBKh8qQ7KrscAE/sT6Vp1Jzas2iJ269en20+sO
	QgaARbTqGVj+mvX8sFI6YqaM56r11tCeThYpOSX3vihpnbGBXzkT4xV2sVpeo7+SXlhI3tzpL/IZm
	Ztymc/q89Cw0NgUl55FecvnQ9y5UVTrh/m82Ub3Zc423Vv4S1XqsKWhmyFmEc39Fd6CJWTDasAvAY
	2VSSTUNP+IKvzWxZJ3MmFo5tDlCCppmpbxVLeURplhdTVm81usUet+DOGxcSc4vJmkq2wGdkselhH
	xxrBEtcMupu0RgIlDoPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q86q0-00HAQB-1s;
	Sat, 10 Jun 2023 22:13:36 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q86pu-00HAPH-1E;
	Sat, 10 Jun 2023 22:13:32 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5149c76f4dbso5379155a12.1;
        Sat, 10 Jun 2023 15:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686435203; x=1689027203;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0o0Yvc3c6FVV1VluGu/lqaqZRz1w2u2WvuBDLHSzGq8=;
        b=IjFLu5Be4nnmTBiTHV1WJxs0jww/SeCu0YgQ4DhraObX4wPMy1MZrRNY0HTrPOMNhA
         KZewv4qiAjVJe+ZSbUsMxrUb5b1Bb4uo/O5Q39z5DzqDO41jWo8mlys6kmwO4VZcumO0
         /e7r6HbYXSQP4V4lZy8A/4a/D9++vjJg0qGEdkbJAr3ZPRR+jWfVHJ0ZRfQDxdFi9nVt
         X8AFEIkgiHgEd0w2NQpVu5Uwwxc5XHrqBLwOafECS84vM7NOwokuteZxAqrjSlWHGLgv
         3kV6EzU1Pl+A8ldEXm+gqAx5gCY+khHp+yBv0ZlfaPS6dzT3T3bMgCHBGfKw/9tHxbxO
         IMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686435203; x=1689027203;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0o0Yvc3c6FVV1VluGu/lqaqZRz1w2u2WvuBDLHSzGq8=;
        b=fniM3N74CWYuKB5VwjmdMXbF75n7wsVIzBKeuTP4esjJrJ/WuizKvRq12I6FAhK+gy
         MWXxU+BY5z75RaKWx2TvC463xJB94Sgv885tfRltJUkRmbky2s6oOSv0p17bExV5Xjez
         bCaLxt1eXpMPh+ReAda3cnDswE9w6d7BOZbqXJTZWWmfMt4IY/tcmtWGJTKC0ooIrYxX
         3zOkJF3OXLNlYjHjUxfMDEL1b2LCJCaNg1wkWogfVPQv1U2BdKrlDf8VGTnGyIm34ifa
         RWkoDMpMtWFwUU1T2PEHJrcbQSh3bsS6p8KJ1vbm4GL9WCz/wFrEOYGVosk1JkmU3nQ8
         jpog==
X-Gm-Message-State: AC+VfDzB34gWWMIQls1nxDuP1jgmrf5pAkat2pQEeleqV9nLAIgYCHRI
	4gPaSZqA2G/WelIqaKlTia0=
X-Google-Smtp-Source: ACHHUZ72K8bKVnLgNDLVUH3TqR5tF036RDmlhZ8fjazxLDTxntBAuCbSCXvrptbdDOUCysKJJPX1Gw==
X-Received: by 2002:aa7:df84:0:b0:514:a4c9:e43b with SMTP id b4-20020aa7df84000000b00514a4c9e43bmr2480758edy.5.1686435203461;
        Sat, 10 Jun 2023 15:13:23 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id c7-20020a056402120700b00514b99afa57sm3265105edw.44.2023.06.10.15.13.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jun 2023 15:13:22 -0700 (PDT)
Message-ID: <78aa84a3-4080-2a50-dea9-4948f6b6a2d1@gmail.com>
Date: Sun, 11 Jun 2023 00:13:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1 2/5] mtd: nand: raw: rockchip-nand-controller: add
 skipbbt option
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, heiko@sntech.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 yifeng.zhao@rock-chips.com
References: <19bf714a-43f9-c30a-8197-91aaaf4a6e5d@gmail.com>
 <4d9473ce-c167-47d7-e37a-7b39915a724c@gmail.com>
 <20230609104426.3901df54@xps-13>
Content-Language: en-US
From: Johan Jonker <jbx6244@gmail.com>
In-Reply-To: <20230609104426.3901df54@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_151330_425469_2C752B8C 
X-CRM114-Status: GOOD (  31.60  )
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

CgoKCgpPbiA2LzkvMjMgMTA6NDQsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGkgSm9oYW4sCj4g
Cj4gamJ4NjI0NEBnbWFpbC5jb20gd3JvdGUgb24gVGh1LCA4IEp1biAyMDIzIDE4OjMwOjI3ICsw
MjAwOgo+IAo+PiBPbiBSb2NrY2hpcCBTb0NzIHRoZSBmaXJzdCBib290IHN0YWdlcyBhcmUgd3Jp
dHRlbiBvbiBOQU5ECj4+IHdpdGggaGVscCBvZiBtYW51ZmFjdHVyZXIgc29mdHdhcmUgdGhhdCB1
c2VzIGEgZGlmZmVyZW50IGZvcm1hdAo+PiB0aGVuIHRoZSBNVEQgZnJhbWV3b3JrLiBTa2lwIHRo
ZSBhdXRvbWF0aWMgQkJUIHNjYW4gd2l0aCB0aGUKPj4gTkFORF9TS0lQX0JCVFNDQU4gb3B0aW9u
IHNvIHdlIGNhbiBydW4gaXQgbWFudWFsbHkuCj4gCgo+IEhvdyBkbyB5b3UgcnVuIGl0IG1hbnVh
bGx5Pwo+IAo+PiBUaGUgTkFORF9OT19CQk1fUVVJUksgb3B0aW9uIGFsbG93cyB1cyB0byBlcmFz
ZSBiYWQgYmxvY2tzIHdpdGgKPj4gdGhlIG5hbmRfZXJhc2VfbmFuZCgpIGZ1bmN0aW9uIGFuZCB0
aGUgZmxhc2hfZXJhc2UgY29tbWFuZC4KPiAKPiBGb3IgZXJhc3VyZSB5b3Ugbm93IGhhdmUgYWNj
ZXNzIHRvIGEgZGVidWdmcyBlbnRyeSBmb3IKCkhpIE1pcXVlbCwKClRoYW5rIGZvciB5b3VyIGNv
bW1lbnRzLgpJdCdzIG5vdCBhYm91dCBlcmFzdXJlIGFsb25lLiAKCj4gZXhwZXJ0cy9mb3JlbnNp
Y3Mgd2hpY2ggYWxsb3dzIHlvdSB0byBieXBhc3MgYWxsIGJhZCBibG9jayBjaGVja3MuCgoKSXQg
d291bGQgYmUgbmljZSBpZiBhbGwgbWFudWZhY3R1cmVycyB3b3VsZCBoYXZlIHRha2VuIHRoZSBN
VEQgZnJhbWV3b3JrIGFzIGNlbnRlciBmb3IgdGhlcmUgTkFORCBhY3Rpdml0eS4KSW4gdGhlIHJl
YWwgd29ybGQgUm9ja2NoaXAgaGFzIGRvbmUgaXQgdGhlcmUgb3duIHdheS4KRm9yIHRoZSBSb2Nr
Y2hpcCByazMwNjYgU29DIHdlIHN0aWxsIGRlcGVuZCBvbiBhIGNsb3NlZCBzb3VyY2UgbG9hZGVy
L3VzYnBsdWcgdG8gZWl0aGVyICgxKSBsb2FkIFUtQm9vdC9MaW51eCBmcm9tIE1NQyBvciAoMikg
d3JpdGUgTGludXggdG8gTkFORCB3aXRoIGhlbHAgb2YgYSBjbG9zZWQgc291cmNlIEZUTC4KCldl
IGN1cnJlbnRseSBlbmQgdXAgaW4gdGhlc2Ugc2NlbmFyaW9zOgoKKDEpCkZ1bGwgTkFORCBzdXBw
b3J0IGluIFUtQm9vdCB0aGF0IHdvcmtzIHdpdGggYWxsIGV4aXN0aW5nIHRvb2xzIGlzIHN0aWxs
IFdJUC4KSSd2ZSBkb25lIHNvbWUgd29yayB0aGVyZSwgYnV0IHN0aWxsIGluY29tcGxldGU6CgpG
aXhlcyBmb3IgUm9ja2NoaXAgTkZDIGRyaXZlciBwYXJ0IDEKaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvdS1ib290L2JlM2M1ZjEyLTlkZjQtMGE1Mi00ODU4LWM0NGQ4NDhlOTE0N0BnbWFpbC5jb20v
CgpQcm9vZiBvZiBjb25jZXB0OgpbUEFUQ0ggdjIgMDAvMTFdIEFkZCBSb2NrY2hpcCBJREIgZGV2
aWNlCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3UtYm9vdC9hMTQ1OGE3Yi0yMDQzLTYzOTctMzEw
Ny0yZDFmZGYwOGM4ZTFAZ21haWwuY29tLwoKU28gaWYgdXNlcnMgYWxyZWFkeSBtYW5hZ2UgdG8g
dXNlIFUtQm9vdCB0aGV5IHByb2JhYmx5IHNraXAgZm9ybWF0dGluZyBkdWUgdG8gdGhlIGxhY2sg
b2Ygc3VwcG9ydCBvciBub3QgYXQgYWxsIGlmIHRoZXkgZG9uJ3QgbWFuYWdlIHRvIHNvbGRlciB0
aGUgbWlzc2luZyBzZXJpYWwgZGVidWcgcG9ydCBpbiB0aGUgYm94LgpCZXN0IGNoYW5jZSBpcyBt
b3N0IHVzZXJzIHNlZSBhbGwgYmxvY2tzIG1hcmtlZCBhcyBiYWQgZHVlIHRvIHRoZSBkaWZmZXJl
bnQgZm9ybWF0IHdoZW4gdGhpcyBtb2R1bGUgaXMgYnVpbHQgaW4uCk9uIHRvcCBvZiB0aGF0IHRo
ZSBNVEQgZnJhbWV3b3JrIGFsc28gc3RhcnRzIGEgYmxvY2sgc2VhcmNoIGxvb3AgYW5kIGEgbWVz
cyB3aXRoIHRoZSBvcmlnaW5hbCBjb250ZW50IGluIHBhcnRpY3VsYXIgYXQgdGhlIEJCVCBsb2Nh
dGlvbiBpbiB0aGUgbGFzdCBibG9ja3Mgd2hpY2ggaXMgIm5vdCBkb25lIiBpZiBub3QgTVREIGZv
cm1hdHRlZCB5ZXQhCklmIGEgdXNlciBvbmx5IHdhbnRzIHRvIHJlYWQvd3JpdGUvZXJhc2UgYm9v
dCBibG9ja3MgaGUvc2hlIG11c3QgZG8gc28gd2l0aG91dCBlZmZlY3Qgb24gb3RoZXIgY29udGVu
dC4KQSBmaXhlZCBtb2R1bGUgcGFyYW1ldGVyIGlzIHRoZW4gdGhlIGJldHRlciBvcHRpb24gZWl0
aGVyIGFzIGJ1aWx0LWluIG9yIGFzIHNlcGFyYXRlIG1vZHVsZSB0aGVuIHlvdXIgZGVidWdmcyBz
dWdnZXN0aW9uIHRoYXQgaXMgbm90IGdvaW5nIHRvIHdvcmsgZm9yIHRoZSBhdmVyYWdlIHVzZXIu
CgooMikKV2hlbiBMaW51eCBpcyBsb2FkZWQgZnJvbSBOQU5EIHdpdGggaGVscCBvZiBhIEZUTCAi
d2hhdCBtb3N0IHVzZXJzIHN0aWxsIGRvIi4gSXQgc2hvdWxkIG5vdCBzdGFydCB0byBvdmVyd3Jp
dGUgaXQncyBvd24gYmxvY2tzIG9mIHRoYXQganVzdCBoYXBwZW5zIHRvIGJlIE1URCBCQlQgYmxv
Y2tzLgoKPT09CgpCb3RoIGNhc2VzIHJlcXVpcmUgYSBtb3JlIG5ldXRyYWwgcHJvYmUgYmVzaWRl
IHRoZSBvcHRpbWFsIG5vcm1hbCBMaW51eCBib290IGZsb3cgd2l0aCBhbHJlYWR5IE1URCBmb3Jt
YXR0ZWQuCgpKb2hhbgoKCj09PQoKRXhhbXBsZSBza2lwYmJ0IGZ1bmN0aW9uIGluIGV4aXN0aW5n
IGRyaXZlcjoKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
dG9ydmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy9tdGQvbmFuZC9yYXcvY2FmZV9uYW5kLmMj
bjgwCgoKPiAKPj4KPj4gU2lnbmVkLW9mZi1ieTogSm9oYW4gSm9ua2VyIDxqYng2MjQ0QGdtYWls
LmNvbT4KPj4gLS0tCj4+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9yb2NrY2hpcC1uYW5kLWNvbnRy
b2xsZXIuYyB8IDggKysrKysrKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykK
Pj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3JvY2tjaGlwLW5hbmQtY29u
dHJvbGxlci5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcm9ja2NoaXAtbmFuZC1jb250cm9sbGVy
LmMKPj4gaW5kZXggY2FmY2NjMzI0Li5mNTY0MzBmNmMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMv
bXRkL25hbmQvcmF3L3JvY2tjaGlwLW5hbmQtY29udHJvbGxlci5jCj4+ICsrKyBiL2RyaXZlcnMv
bXRkL25hbmQvcmF3L3JvY2tjaGlwLW5hbmQtY29udHJvbGxlci5jCj4+IEBAIC0xODgsNiArMTg4
LDEwIEBAIHN0cnVjdCBya19uZmMgewo+PiAgCXVuc2lnbmVkIGxvbmcgYXNzaWduZWRfY3M7Cj4+
ICB9Owo+Pgo+PiArc3RhdGljIGludCBza2lwYmJ0Owo+PiArbW9kdWxlX3BhcmFtKHNraXBiYnQs
IGludCwgMDY0NCk7Cj4+ICtNT0RVTEVfUEFSTV9ERVNDKHNraXBiYnQsICJTa2lwIEJCVCBzY2Fu
IGlmIHRoZSBOQU5EIGNoaXAgY29udGFpbnMgZGF0YSBub3QgaW4gTVREIGZvcm1hdC4iKTsKPiAK
Cj4gSSBoaWdobHkgZGlzbGlrZSB0aGlzLgoKV2hlbiBidWlsZCBpbiBob3cgdG8gY2hhbmdlIHBy
b2JlIGJlaGF2aW9yIGluIGEgbW9yZSBuZXV0cmFsIHdheT8KTm8gc2Nhbm5pbmcsIGVyYXNpbmcg
YWxsb3dlZCBldmVyeXdoZXJlIGFuZCBubyBjaGFuZ2VzIHRvIG9yaWdpbmFsIGNvbnRlbnQhCgo+
IAo+IEl0J3Mgbm90IGEgbW9kdWxlIHBhcmFtZXRlciB0aGF0IHlvdSBuZWVkLCBpdCBpcyByZWxh
dGVkIHRvIGEgcGFydGl0aW9uLgoKUGxlYXNlIGFkdmlzZSB3aGF0IHRleHQgY291bGQgYmUgYmV0
dGVyIGluIHRoaXMgY2FzZS4KCj4gCj4+ICsKPj4gIHN0YXRpYyBpbmxpbmUgc3RydWN0IHJrX25m
Y19uYW5kX2NoaXAgKnJrX25mY190b19ya25hbmQoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPj4g
IHsKPj4gIAlyZXR1cm4gY29udGFpbmVyX29mKGNoaXAsIHN0cnVjdCBya19uZmNfbmFuZF9jaGlw
LCBjaGlwKTsKPj4gQEAgLTExNTYsNiArMTE2MCwxMCBAQCBzdGF0aWMgaW50IHJrX25mY19uYW5k
X2NoaXBfaW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBya19uZmMgKm5mYywKPj4KPj4g
IAluYW5kX3NldF9jb250cm9sbGVyX2RhdGEoY2hpcCwgbmZjKTsKPj4KPj4gKwkvKiBTa2lwIHRo
ZSBhdXRvbWF0aWMgQkJUIHNjYW4gc28gd2UgY2FuIHJ1biBpdCBtYW51YWxseS4gKi8KPj4gKwlp
ZiAoc2tpcGJidCkKPj4gKwkJY2hpcC0+b3B0aW9ucyB8PSBOQU5EX1NLSVBfQkJUU0NBTiB8IE5B
TkRfTk9fQkJNX1FVSVJLOwo+PiArCj4+ICAJY2hpcC0+b3B0aW9ucyB8PSBOQU5EX1VTRVNfRE1B
IHwgTkFORF9OT19TVUJQQUdFX1dSSVRFOwo+PiAgCWNoaXAtPmJidF9vcHRpb25zID0gTkFORF9C
QlRfVVNFX0ZMQVNIIHwgTkFORF9CQlRfTk9fT09COwo+Pgo+PiAtLQo+PiAyLjMwLjIKPj4KPiAK
PiAKPiBUaGFua3MsCj4gTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
