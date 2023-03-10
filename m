Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D0BCC64EC4
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Mar 2023 18:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yTvDqhej/TI8mkzeL9P14ssOhAl7xjlU//rp1SO8UGs=; b=a13dSr9qDbi6pk
	lG8xzy9ZslBY2aVpNfLYku4+xFPmcxZJDBlngbyQdNFEH5dRTONwwIewvPtEPqloo13/nrtY5/QrN
	N24E+edhLWykE/5uiiaG2/X10sxpbHD0qY7EcIj1BiCjdmqIOInkJqw7NJBZoZeNCsQtVP1nK/JpZ
	2yyR6k97O/3BUre3pCusRagMCGbl6is6FwaVFPm86O61W75uDqBUaijmAwmb+dxys4J6Mdwx8opUs
	y5rGJHgiUe9CH5KjbMMMx6yH31cyU7k897z0XqlvmtigcUOFWTJc8WUAYNytau9dIMQh0rUJoAJNx
	njam2Uc9kU0qh5ckTahg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pahWT-00FlJv-RT; Fri, 10 Mar 2023 18:31:21 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pagNO-00FViq-Jp
	for linux-mtd@lists.infradead.org; Fri, 10 Mar 2023 17:17:55 +0000
Received: by mail-ed1-x535.google.com with SMTP id ay14so23225615edb.11
        for <linux-mtd@lists.infradead.org>; Fri, 10 Mar 2023 09:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1678468665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4L/SHZyks/7guh4hx9DHAjGFq4iwVKD1iq8DrmoyKQ=;
        b=EEl4Ll2WkH5nHGXz993/iZ4ibdZMQTPlCvxlMLKiooYmq8BUrGBb4QaN3YR1fcz5KS
         ohEApwDYRrdFLp8wouqaIEY5NxlriuIKxRmu1/fDuTM/PT9/pS3oCYjtAWloHgVUXZ+d
         +pOJfKvM8/pNRV7qQEUeJLnR9APruwvt9jW1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678468665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s4L/SHZyks/7guh4hx9DHAjGFq4iwVKD1iq8DrmoyKQ=;
        b=vNZ2RzDI7T4NDvt2gdMhAfUTepBnYiYvc+2mFSmixFmrp1s5czhSRAs0TN7qoYTupa
         I86xrB+yfDkH74plNTgSEfbdS2OlYk6ilLmDtw7ufeeRFwH3t2nSy1GUr1DbrGMfYoJj
         XXIomi+FkBzNDwP+kO3pZFjo5FAU2O3KF7Pw0lBQQyKM3q8fG9TZ7dgv/gXBQjM2TCJv
         kOSnZlVdlQgXFCK+0pTJNL0PKqu00JGnZL/cMGkQjXJB3leI96d82M8frjqTNLa8FjjT
         tmDg/osQE6BVhDLC3ZOmbBjJyba6Hd7Ff428qBVdGgTIPM5vLqccFv5oL0wz60exNGcP
         FFwQ==
X-Gm-Message-State: AO0yUKXCYY4Ur3jy+6/to8jKKfLIIAA2gkkmNrpyJUm5p8JEVWjz2eMS
	MrEPiNrvUZAEIG8YLKP+cJFc8Qigdr7enc5HG1IXdg==
X-Google-Smtp-Source: AK7set+l5PVTOGj2/KYsagmP8DBYZODdqKeynkjNqgirjKKGHZdig9ZiKbr0mAS8F9Fz7D4r37qQjw==
X-Received: by 2002:a17:907:2d93:b0:8b2:2141:6de8 with SMTP id gt19-20020a1709072d9300b008b221416de8mr34330741ejc.73.1678468665058;
        Fri, 10 Mar 2023 09:17:45 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id z1-20020a170906944100b008b1fc59a22esm111729ejx.65.2023.03.10.09.17.44
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 09:17:44 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id ec29so23315108edb.6
        for <linux-mtd@lists.infradead.org>; Fri, 10 Mar 2023 09:17:44 -0800 (PST)
X-Received: by 2002:a17:906:498e:b0:901:e556:6e23 with SMTP id
 p14-20020a170906498e00b00901e5566e23mr13458233eju.0.1678468663895; Fri, 10
 Mar 2023 09:17:43 -0800 (PST)
MIME-Version: 1.0
References: <1115586887.187161.1677658022188.JavaMail.zimbra@nod.at> <CAFr9PXktRBm66vgVjOnwTeucBD36OuPjDVNd9cH1F8u0nesKrA@mail.gmail.com>
In-Reply-To: <CAFr9PXktRBm66vgVjOnwTeucBD36OuPjDVNd9cH1F8u0nesKrA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 10 Mar 2023 09:17:27 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi29bbBNh3RqJKu3PxzpjDN5D5K17gEVtXrb7-6bfrnMQ@mail.gmail.com>
Message-ID: <CAHk-=wi29bbBNh3RqJKu3PxzpjDN5D5K17gEVtXrb7-6bfrnMQ@mail.gmail.com>
Subject: Re: [GIT PULL] JFFS2, UBI and UBIFS updates for v6.3-rc1
To: Daniel Palmer <daniel@0x0f.com>, Christoph Hellwig <hch@lst.de>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_091754_672247_A29966C5 
X-CRM114-Status: GOOD (  12.54  )
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

T24gRnJpLCBNYXIgMTAsIDIwMjMgYXQgNDoxOeKAr0FNIERhbmllbCBQYWxtZXIgPGRhbmllbEAw
eDBmLmNvbT4gd3JvdGU6Cj4KPiA+IENocmlzdG9waCBIZWxsd2lnICgxKToKPiA+ICAgICAgIHVi
aTogYmxvY2s6IHNldCBCTEtfTVFfRl9CTE9DS0lORwo+Cj4gVGhpcyBzZWVtcyB0byBiZSBjYXVz
aW5nIG9uZSBvZiBteSBtYWNoaW5lcyB0byBsb2NrIHVwIGR1cmluZyBib290Lgo+IEl0J3MgdXNp
bmcgYSBzcXVhc2hmcyByb290IHRoYXQgaXMgb24gYSB1YmlibG9jayB0aGF0IGlzIGxvY2F0ZWQg
b24gYW4gU1BJIE5BTkQuCgpIbW0uIFRoYXQgY29tbWl0IDkxY2M4ZmJjYzhjNyAoInViaTogYmxv
Y2s6IHNldCBCTEtfTVFfRl9CTE9DS0lORyIpIGlzIG9kZC4KCkNocmlzdG9waCAtIHlvdSByZW1v
dmVkIHRoZQoKICAgICAgICBibGtfbXFfc3RhcnRfcmVxdWVzdChyZXEpOwogICAgICAgIC4uLgog
ICAgICAgIGJsa19tcV9lbmRfcmVxdWVzdChyZXEsIGVycm5vX3RvX2Jsa19zdGF0dXMocmV0KSk7
Cgpmcm9tIHRoZSB3b3JrcXVldWUgZnVuY3Rpb24sIGJ1dCB3aGlsZSB5b3UgYWRkZWQgdGhlCmJs
a19tcV9zdGFydF9yZXF1ZXN0KCkgaW50byB1YmlibG9ja19yZWFkKCksIHRoZSAnZW5kX3JlcXVl
c3QoKScgaXMKbWlzc2luZy4KClNvIEkgc3VzcGVjdCB0aGUgSU8gaGFzIGNvbXBsZXRlZCwgYnV0
IHRoZSBjaGFuZ2UgbWVhbnMgdGhhdCBub2JvZHkKd2FzIGluZm9ybWVkIGFib3V0IHNhaWQgY29t
cGxldGlvbiwgc28gbm93IHRyeWluZyB0byBtb3VudCBhbiBleHQ0CmZpbGVzeXN0ZW0gb24gaXQg
aGFuZ3Mgb24gdGhlIHJlYWQuCgpCdXQgSSBkb24ndCBhY3R1YWxseSBrbm93IHRoaXMgY29kZSwg
dGhhdCB3YXMganVzdCBmcm9tIGxvb2tpbmcgYXQgdGhlCmNvbW1pdCB0aGF0IGJyZWFrcy4KCkNo
cmlzdG9waD8gRGFuaWVsIHVzZWQgeW91ciBpbmZyYWRlYWQgYWRkcmVzcywgSSBkb24ndCBrbm93
IGlmIGl0IGFsbApnb2VzIGludG8gdGhlIHNhbWUgcGlsZSwgYnV0IGxldCdzIHVzZSB5b3VyIHJl
Z3VsYXIgb25lLiBBbmQgSSBjYW4ndApzZWUgRGFuaWVsJ3MgbWVzc2FnZSBvbiBsb3JlLmtlcm5l
bC5vcmcgYXQgYWxsLCBmb3Igd2hhdGV2ZXIgcmVhc29uLAoKICAgICAgICAgICAgICAgICAgTGlu
dXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
