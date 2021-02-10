Return-Path: <SRS0=JPnc=HM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C53FC433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Feb 2021 09:26:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 177A064DB1
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Feb 2021 09:26:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 177A064DB1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mWvhjSeEKf7bEHC8xuXqt3WnqdaqOYDuiEuVn7nv5qE=; b=JcVptza8GJUC66Qtue+U/AGeE
	2KUSDthzcevEaedoTObGO8cTB67nVIJJG35AYnRIsMu6BsdcTBi1N4hieo7JDuIc2T1mQCFLxkJZq
	r2pIyYE0fkfTHYT2j1yGL6qJWiq8Fndds1PzQoeIpH3uzkVWkECvYhlhRBiWto+Qkrf0KD/S0PZv4
	g6tj+N9MLdyZimInBnLideK+kaLi2yJHL7fDJUiWYS/MOoEbtVbU920JnOZL3phKf1oblKm7wogEw
	ronqaLLvd5irsKJzrT5TvmHk5tB//IYOhw/kir2vSHK1/m1bWSUU+wpv4uhCL70dxFfT4F75VgFMN
	1Eyos5XdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9llS-0004UU-G2; Wed, 10 Feb 2021 09:26:26 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9llQ-0004TQ-6c
 for linux-mtd@lists.infradead.org; Wed, 10 Feb 2021 09:26:24 +0000
Received: by mail-qk1-x732.google.com with SMTP id l27so979821qki.9
 for <linux-mtd@lists.infradead.org>; Wed, 10 Feb 2021 01:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hE93oDcZvv1bQ/EFRGRIOYs3vnrB7Z1DmdNStEr90p0=;
 b=lDIM4tqNyimqfpivMxwaEQyahBfttP2sEERBZLKV9N/WYSjsYs3bRPNgYcDC9LSgUC
 mHZC0pzHzmr3nMGzb0MjOYNvTjvjba3LPsKr1ehwBnW+6VfICsvT7jhXuBlDJ/dn0KwY
 OROnxEz0bQqR1aBW0xz4TKLXKH0ZCmR4LHl0Hk4MgH5D5L1s2d99NxtUWK5THkcVdFg7
 axnGYHUihBP1OkiupOGLp5HNddzh1CNououVLp066a/o4EWvJsVu83yjZU18UCfJZCi+
 xlUUMvlugquPY1rscl8pyVa/FAehWxd9g9KlcZT8u4TIvkXCKTD09ZHFjrYL7c570aFD
 uzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hE93oDcZvv1bQ/EFRGRIOYs3vnrB7Z1DmdNStEr90p0=;
 b=RLtcpjQY0zHC4NFfOELEJqF1ls6mVH3t7UmIr/Z4DRcyiWK6D85SvDF4Xhei/ApjWc
 62koFxxVR/tPETfCROvDpLry40XVNi5S59OQ1lxaUyxAkaMSFDqYfCQCamug6Zi39QkT
 7CAKR/jR2y8PkqK35r6+2tETx5IWy8SadmOpOWctmtJ7HW778/y+gW6PT5pRcM24FWID
 Soh8Xrr81K/uwn3aP0PFbWYgYuwef2//QnSAgSijB2hyunZIPHxp9BtlXeQol0u2RWBf
 nvxzSuOgukuNprUAPvQLuNakvtb8QXJ491f4s4xfSs3tpFZv4xP79UXUanKkHvPZyivc
 FGXQ==
X-Gm-Message-State: AOAM531ZZEi6c2wGxo7GLRWukavAYjSjw7KxWV4N+WixnrCAjyh543Ga
 H7T+Xt6ziRFoJb+LrgQkk5Xn4qmdhzQCvihwDx0=
X-Google-Smtp-Source: ABdhPJx1fMHJ/MNM/AWccH3yGgpmBNEt0NOUNCdG/TQlRzSnm8xKy/izOrYK76ePzlU7P/kOWqU8UqmV+i0fzj2zdnY=
X-Received: by 2002:a37:e17:: with SMTP id 23mr2470406qko.185.1612949182514;
 Wed, 10 Feb 2021 01:26:22 -0800 (PST)
MIME-Version: 1.0
References: <20210201190749.537fd891@xps13>
In-Reply-To: <20210201190749.537fd891@xps13>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 10 Feb 2021 10:26:11 +0100
Message-ID: <CAFLxGvw7GgDVqri8YSARK8e4huWrM41BoBMaH7MD-yRQZZYqPw@mail.gmail.com>
Subject: Re: [GIT PULL] mtd: nand: Changes for 5.12
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_042624_256356_D8600BE9 
X-CRM114-Status: GOOD (  14.44  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBGZWIgMSwgMjAyMSBhdCA3OjEyIFBNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXlu
YWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGkgZm9sa3MsCj4KPiBUaGlzIGlzIHRoZSBOQU5E
IFBSIGZvciB2NS4xMi4KPgo+IFBsZWFzZSBub3RlIHRoYXQgSSBtZXNzZWQgdXAgKGFnYWluKSB3
aGVuIGFwcGx5aW5nIHBhdGNoZXMgc28gSSBqdXN0Cj4gbW92ZWQgYSBmZXcgcGF0Y2hlcyBvdXQg
b2YgdGhlIG5hbmQvbmV4dCBicmFuY2ggYW5kIGFwcGxpZWQgdGhlbSB0bwo+IG10ZC9uZXh0LiBB
bGwgcGF0Y2hlcyB0aGVyZSBoYXZlIGJlZW4gbGF5aW5nIGluIG5leHQgZm9yIGF0IGxlYXN0IGEK
PiB3ZWVrIGFscmVhZHkgYW5kIHlvdSBjYW4gc2FmZWx5IGlnbm9yZSB0aGUgdGltZXN0YW1wIG9m
IHRoZSBsYXN0IHBhdGNoCj4gKDIwMjEtMDItMDEgMTg6NTk6MTkgKzAxMDApLgo+Cj4gVGhhbmtz
LAo+IE1pcXXDqGwKPgo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgNWM4ZmU1
ODNjY2U1NDJhYTBiODRhZGM5MzljZTg1MjkzZGUzNmU1ZToKPgo+ICAgTGludXggNS4xMS1yYzEg
KDIwMjAtMTItMjcgMTU6MzA6MjIgLTA4MDApCj4KPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQg
cmVwb3NpdG9yeSBhdDoKPgo+ICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L210ZC9saW51eC5naXQgdGFncy9uYW5kL2Zvci01LjEyCgpQdWxsZWQsIHRoYW5r
cyEKCi0tIApUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
