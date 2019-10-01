Return-Path: <SRS0=grO6=X2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47CBBC352AA
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Oct 2019 17:08:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 163752168B
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Oct 2019 17:08:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sRmtbl5v";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DpRrrSiy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 163752168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fLxhBt6H3yuzJqOiWCNy11bRAAmB8Je0p7BjpggYSDQ=; b=sRmtbl5v4M7mzE
	xzvV5KzpfruELBUK9d8tw42dVotcUez+pQNYwbddA8M0NgFTtEY372jCIw3S5ZnVr0cDyfMHqvJA8
	yehqGoWhxxB56GchNjBLyDwNA02t7lv328r/Z9vefou5RysPj+iQFE+8logQqVrr2BHbYqfqMlQoq
	KB9kuoohNlnGGHu+Wx9JcNhv9kXxVM0R0OAxhRjmksCGG1I8eoSyzO8J+oUhV/HFLkq1sxJNe4cRh
	79Y23Qnaz2L7ztrzq0b2lx/gMNAnzhywEy1ygMlzEOhXQyn708d3m0TILAvWroMKjL/j5hCzAOkBO
	z3ph7w51tplEHoi1Gqug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFLd1-0003FD-PC; Tue, 01 Oct 2019 17:07:59 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFLcy-0003EE-9C
 for linux-mtd@lists.infradead.org; Tue, 01 Oct 2019 17:07:57 +0000
Received: by mail-io1-xd42.google.com with SMTP id v2so49787885iob.10
 for <linux-mtd@lists.infradead.org>; Tue, 01 Oct 2019 10:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Vk3Mw429iAwCdwc7SoNkJsPN3ePx/CtMd1YUMIkxouI=;
 b=DpRrrSiy2xqm+WuqU/qzUWhykUlmDHUMJ8f33kVHDaSQ7j0Bxm4M6/55DZ1MJ2shxI
 I8It6az9KX7i7VXjaGlI7V39TLjndjJV8ZU2jnGANWB/UueeuCyueujkW3318S0jGNmn
 insyfUCduOB06yfV7xbCbHXIpOnfNiVVcJxgKFP1oCmLcN/o0lIU9TpurGBc6sOCknpG
 sKOmo2yZNV1ozbkZT+RGPYirIkPk8fV1yzK6Xe00phCkOsEc5KbYcSRviGMqDMY/01uj
 rntRlgx4T/DGxN5+VW0oXR//cQxo0w6O9h9SCLKnfSnY/bGLcziG2mPHOO4HDOgVEAAt
 NDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Vk3Mw429iAwCdwc7SoNkJsPN3ePx/CtMd1YUMIkxouI=;
 b=V0yzldwwEFHtCQ3pg2EREbydp4wvw4JNxzZ8Fv3x5QCRwc/B8ANd5oj064dVVSlApW
 +iR3h7ZNxL4bXsJPEFULTgCJpF0YpwGWnE2N6LtAM5JDnZZnSS07/8Hg9s04CerNafB8
 u1y0T6fDW5uf5Xi0KujiYq1QfRXp3VYTPLg7eAIUfo8v2lkbRsmNCAV+KUbltYhPN1yH
 40z9Hn7Q2CwHlMSonNDw1FksJBiWEIm1i0j7y8kqNjL+Ig/zk0ubJx50kkZxZNRLIaB8
 QPKk8op13QPboNe1ErkwQ1gWVQ9P0RkRuLeXWIdL0oKR1c5zVXomI8fXIWqHfvZ+ZG0Y
 Y5vw==
X-Gm-Message-State: APjAAAXMuwF/NFsAEJBm7vrIETU+43JLYkJD24PAZoi7NwLhRiShcjaI
 lTMMW22dK4wmsPC6G0U7VyoFJNDXmpVka2+HTxk=
X-Google-Smtp-Source: APXvYqy7Cii0rhNBf7stnDBIl3iClh8mjr74Jlu/0i2ZnHP/yEo45fiD35+XGFzAdFr+g2fXuBQGeklsdkeIiUILLiI=
X-Received: by 2002:a05:6e02:8e9:: with SMTP id
 n9mr25603130ilt.21.1569949675097; 
 Tue, 01 Oct 2019 10:07:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190906194719.15761-1-kdasu.kdev@gmail.com>
 <20190906194719.15761-2-kdasu.kdev@gmail.com>
 <CAC=U0a1qvKO+t_62df_JcQBETAuNq0pwRkAb-Ofi3ski2rfdEQ@mail.gmail.com>
 <20190930182458.761e8077@collabora.com>
 <CAKekbevBxGh9HRLX_4N98NwKm4GnXWvy9kwi6i=nRVnmfmJ-vw@mail.gmail.com>
 <724490481.10665.1569872374621.JavaMail.zimbra@nod.at>
In-Reply-To: <724490481.10665.1569872374621.JavaMail.zimbra@nod.at>
From: Kamal Dasu <kdasu.kdev@gmail.com>
Date: Tue, 1 Oct 2019 13:07:43 -0400
Message-ID: <CAC=U0a0Jqf68zmB9TvkkCsUHjZ1tLrPBR2Bodj+odkTh+BE6_A@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: rawnand: use bounce buffer when vmalloced data
 buf detected
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191001_100756_347346_4F4E0B81 
X-CRM114-Status: GOOD (  10.93  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Kamal Dasu <kamal.dasu@broadcom.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SSB3YXMgdGVzdGluZyB3aXRoIFVCSS9VQklGUyB3aGVyZSB2bWFsbG9jZWQgIGRhdGEgYnVmZmVy
cyBjYW4gYmUKcGFzc2VkIHRvIHRoZSBuYW5kX2Jhc2UgYW5kIHRoZW4gbyB0aGUgY29udHJvbGxl
ciBkcml2ZXIuIFByb2JhYmx5CmFwcGxpZXMgdG8gb2xkZXIga2VybmVsIDQuMS4KCkNhbiB0aGUg
UGF0Y2gxLzIgYmUgYWNjZXB0ZWQgb3IgeW91IHdhbnQgbWUgdG8gc2VuZCBpdCBzZXBhcmF0ZWx5
IGJ5CnJlbW92aW5nIHRoZSBuYW5kX2Jhc2UgY2hhbmdlcyA/LgoKS2FtYWwKCkthbWFsCgpPbiBN
b24sIFNlcCAzMCwgMjAxOSBhdCAzOjM5IFBNIFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBu
b2QuYXQ+IHdyb3RlOgo+Cj4gLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+ID4gVm9u
OiAiS2FtYWwgRGFzdSIgPGthbWFsLmRhc3VAYnJvYWRjb20uY29tPgo+ID4gVGhpcyBoYXMgYmVl
biBvYnNlcnZlZCBvbiBNSVBTNEsgYW5kIE1JUFM1SyBhcmNoaXRlY3R1cmVzLiBUaGVyZSBpcyBh
Cj4gPiBjaGVjayBvbiB0aGUgY29udHJvbGxlciBkcml2ZXIgdG8gdXNlIHBpbyBpbiBzdWNoIGNh
c2VzLgo+Cj4gSSBmZWFyIHlvdXIga2VybmVsIG1pc3NlcyBjb21taXQ6Cj4gMDc0YTFlMTE2N2Fm
ICgiTUlQUzogQm91bmRzIGNoZWNrIHZpcnRfYWRkcl92YWxpZCIpCj4KPiBUaGFua3MsCj4gLy9y
aWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
