Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A51BC43464
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 20:48:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2475620838
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 20:48:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G9UwhbFt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BMvJaOE0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2475620838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sX6rEwLHn9cWzDFNpkVoHTFXSaifn0PiuWZy1NWnwe4=; b=G9UwhbFtkbLMThQ03QZRbjvlp
	GRHSvRX6mTW/Ji1EgDEHduXvPHHCeUU7/R6e8+RLwdNa9d1a3qD2M6BmXtZpOYEzZ0GVzkQtv1FZv
	uv6eclRev9885SsFjwKE2vVKKBm+Moq3VHMSBsXeG+RTs6tm6qTQ9K26q5k+xVrBGsdzw6iY4KcYV
	9GfetyxGfktkVWgYkXUyd9XXASZjV1mN1NGuj2+Tzs6OlwQXkzznOFZCSkhsewhZ541MDmt+YCZCL
	foIJXgwOyo4qs/7eGo+DymUpo2PhNsnE1m6cw0tlvBbru8JKYRFHiVnaHUf5XmEwC0eki4iOaOdJH
	KZI0j5Ziw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJ0p0-0005mP-15; Thu, 17 Sep 2020 20:48:02 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJ0oy-0005lL-6I
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2020 20:48:00 +0000
Received: by mail-qk1-x744.google.com with SMTP id w16so3762016qkj.7
 for <linux-mtd@lists.infradead.org>; Thu, 17 Sep 2020 13:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lCEuifrXNBJR2RXDLzYRqd6rWThqodFNE/B/8/e6FCo=;
 b=BMvJaOE08sKp4cbKESDzN+KbtJLb332vgYme/GXpRWM9fJ8lUZOfV5N2S34Aq/0QgH
 J91ZnVOZutDuH79jmUBOzo4u6GxuYMx3wMXqGbXquddg6njn6ccgVMGgmhtwTVywQBEs
 6X0l7NiuZEsY1CMb6AksOE5RIlF2hD8cstBg5RW/jEMujVAmqR/SZCMqyEO77C4SEzNF
 sBvMLty/k+Vpi0fqKANyu8vsRbHDmZCETNFneJp5e6Txs0KodavGWxQVumx4nHpumfkF
 FXN4QXE9hjXEL32Ag9mf2TtlvA6T0WQm19g8d2ZlSFurFehskaJeb6teX9oDi7xnn+cB
 kpkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lCEuifrXNBJR2RXDLzYRqd6rWThqodFNE/B/8/e6FCo=;
 b=PZVIZ0BYBSkLXWyXVcGNOD82s0V0+1pCArVUA0kxMt0r97/mlmEcLSY6mElnchg61k
 MTdGrrSXARsDGtia1Nc0hFq2zWsUVv3B1HAJK5l/7SZv71ASw59ZeMtvb9KlY6lb1SVH
 BVjNYJXlPBvpmhWEL5F2q+JT74YGO7bMEfFxj60X56uAMYsnOEcoTD+3NIXgnGLjhAVh
 dS9Ih2mj2bydSsLQBUs7WWzAKKXXghND+yeZ4MHODr0Zqr8B1I12/OI87PVNrDcksJHb
 TpfGhVs6VWH9OYaSBSHq71E1kTM66HsjNHjD1XxmcEqMgvIKRUzmehSmFrbe4DN5uqj4
 WByA==
X-Gm-Message-State: AOAM532ApoioiXq5Zbe2nE/MzYj/J9c52iUyVaq0HnaCzXzPcXNScL/v
 OMPqExRN2SK4ixTZay5dLuVaKKkjBjP1ZCqVjTo=
X-Google-Smtp-Source: ABdhPJyPa/1PhZFqqEdeyHeSrDNSBkFT9T8g9ywxA6fcNWSTba8ZEtigVY3KkbI52SDeiZMdFsaJE+YwXTglAj6k9Qw=
X-Received: by 2002:ae9:eb42:: with SMTP id b63mr29547439qkg.106.1600375678460; 
 Thu, 17 Sep 2020 13:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200601091037.3794172-1-chengzhihao1@huawei.com>
 <CAFLxGvxA9pw8D6Q8GbBD0SUP+EHhOsZmRMSPxrW4sq0gYi9N9Q@mail.gmail.com>
 <b82cd435-437d-e384-c95e-a7e031559c7e@huawei.com>
In-Reply-To: <b82cd435-437d-e384-c95e-a7e031559c7e@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 17 Sep 2020 22:47:46 +0200
Message-ID: <CAFLxGvxXE_jb7nGMn9XOzaFb6SELspQ2Dvdc7zs5i5G8XK3UfQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ubifs: xattr: Fix some potential memory leaks while
 iterating entries
To: Zhihao Cheng <chengzhihao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_164800_236720_94A2FA01 
X-CRM114-Status: GOOD (  10.43  )
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
 LKML <linux-kernel@vger.kernel.org>, "zhangyi \(F\)" <yi.zhang@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBTZXAgMTQsIDIwMjAgYXQgNToyNSBBTSBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFv
MUBodWF3ZWkuY29tPiB3cm90ZToKPiDlnKggMjAyMC85LzE0IDM6MDgsIFJpY2hhcmQgV2VpbmJl
cmdlciDlhpnpgZM6Cj4gPiBPbiBNb24sIEp1biAxLCAyMDIwIGF0IDExOjExIEFNIFpoaWhhbyBD
aGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+IHdyb3RlOgo+IFRoZSBraWxsX3hhdHRycyBw
cm9jZXNzIGlzIG1vcmUgaW50dWl0aXZlIHdpdGhvdXQgdGhlIHB4ZW50LiBIb3dldmVyLAo+IHRo
ZSByZWxlYXNlIHByb2Nlc3MgZm9yIHRoZSBtZW1vcnkgKHN0b3JlcyB4ZW50LT5uYW1lKSBpcyBz
aW1pbGFyIHRvCj4gJ3B4ZW50Jy4gSWYgeW91IHRoaW5rIGl0J3MgYmV0dGVyIHRoYW4gdjEsIEkg
d2lsbCBzZW5kIHYyLgoKWW91IGFyZSByaWdodC4gV2UgZG9uJ3QgZ2FpbiBtdWNoLiBTbyBJJ2xs
IHRha2UgdjEuClRoYW5rcyBhIGxvdCBmb3IgZml4aW5nIQoKLS0gClRoYW5rcywKLy9yaWNoYXJk
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
