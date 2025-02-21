Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8161FC021AA
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Feb 2025 13:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JAisN9XGm39QnVqFPKo+Sf2LulWhdkKixWaKgH+m2sk=; b=VhKnPDK1GWdymr
	FXS/jbh1Mai8kQ9SgrIUvYHaqGivRM11zonzoKsGTSLXpcVlwUmZ4OuwOz/swvbZqNXBESotfOpNk
	StTJzaUZ9xs1i9K2jLRm6PqtYAvkNTajJUUDAmoW8z2lUsVl3w44uRRdXfHpZPtBPrI9WJCewlYsi
	70tcbh58GKYIjSf3T70UhZWJzNkWgWNIfo30YE+6XkiYNzaPGyfOCnyE7D5DrQ4imorWw16bUCTDv
	LRs54EFBOZcNZdM8Q5mvZIf1Snhf2HeEN23yR98UQUsNEgMY11HLpJK6/Fhh9diTbu72ivgN4yMgy
	kQWZtKIryIFBn/8sGfIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlSjn-00000005Ysa-15nm;
	Fri, 21 Feb 2025 13:06:39 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlSjk-00000005Yqd-3wCh
	for linux-mtd@lists.infradead.org;
	Fri, 21 Feb 2025 13:06:38 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5452e6f2999so2167484e87.3
        for <linux-mtd@lists.infradead.org>; Fri, 21 Feb 2025 05:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740143195; x=1740747995; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GY4Bqjj3jHuhIZ/yUC1V1L2T+Ec/puqWZDF72o9O3bU=;
        b=YzT65teKO9USnB2iz5j8YTui6fn4pSHBmJZ1Qj6RBSw1JQLn7bCjF81TbYTPIfskCI
         gM02osghKF9ciJXlGiGJMHN5iI3v6YyD1noHsuXr6Rl39A08X4P3T0eV2I6uheY3QtWl
         o3lJ4vS0fzAVBEk3TgSJpMz+lAWIwI12vuqYFRdsVhfTiQ4sxNMt+fUvQ59FV80+DPKM
         k1pGn1fe7tutxB0QKkfEEtevgTDtP3K9iiedTkNcUZ1hBZNcZ1oEYjpf9Qvx+wyeNggK
         DtR75CwNa5U7tySsRnN8cOb/BZKBaBNMplBQiuKBWf5ONZtN/YFhwCgcYgbbqiReDol+
         pxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740143195; x=1740747995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GY4Bqjj3jHuhIZ/yUC1V1L2T+Ec/puqWZDF72o9O3bU=;
        b=v15b9yKhzASmnkqMNQ6EGfXpzI7+1KwnkUWrAkJecsfLPErVPZaUKaAzENHIHi9srk
         tLSY2Rx0vm83t//uCZ5Sxpl6fxcccKq4RsD7BWKp2JJqJyxNuk1iSCs4o3je137ld6Y2
         +kno1avNazvBGg8qeDhxDM0QaD9RGuuzq189OMbGo2jyCoCm39CWlfYRj+ttlG6ZWJ1g
         qMfgn8NtFlT9ifLbkEDhjklKFHKcVZwgu3frN001JRchN5qg22zHrr94vDyT5J2Ll6Gb
         /lvnMPhGb/ZDCh1TwGF2zmfO0LOnLq/xOP64mxJImijvlhhbZguf9ioPkai9edlG6k8K
         gCCA==
X-Forwarded-Encrypted: i=1; AJvYcCVmlLpxBINTe9hZ4N2PaZdMR9mwwtC4WpSr6VemYK1vUc6+hbTJzNshV97QKPjd3q0ymPxd4nofn9Y=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6iZWbLWdtio0CGrpnHENniIoUB2itfeb8filuq29SKR24M/tx
	2aZAwS0UhEYViDuoO7mStsKCr6D6Q/1qLRiCHhA+w9u+0uejom10WawnEmEdllzu+jnuTayraWR
	/T79u867mYOxRz3UkVCv+ruYClclJ4oL/OC8Piw==
X-Gm-Gg: ASbGncuACqxkOT4NAdH3SZJbKULGNoFtTxnNApcQ4FvpJY93M+nxny6IwKz95T6mKAh
	vgEqR4Hf4SulEx/1i0YWC8TD9c+3uD3eSLT9JEHXN2SEv6/NJTWrt0WVoC9lW1JRajG5mO1Ijmj
	M6dorUE2IZRYHUgPSI03D4HODxAL3YRsTjQVKgrB8=
X-Google-Smtp-Source: AGHT+IGvF+qVoZb/YNG1V1s6uhLH0tipo14kcVPCZjvopoT6AHOJ53n961FIS1cHHYi7UkY/30eVAcyuJ5RU22yTz1g=
X-Received: by 2002:a05:6512:230a:b0:545:17b:3cf9 with SMTP id
 2adb3069b0e04-54838f5c910mr1152614e87.48.1740143195091; Fri, 21 Feb 2025
 05:06:35 -0800 (PST)
MIME-Version: 1.0
References: <20250221-rmv_return-v1-0-cc8dff275827@quicinc.com> <20250221-rmv_return-v1-13-cc8dff275827@quicinc.com>
In-Reply-To: <20250221-rmv_return-v1-13-cc8dff275827@quicinc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 21 Feb 2025 14:06:23 +0100
X-Gm-Features: AWEUYZkXE5OFXjjPS11KVvHprrUdePtYS343T04IUIfa13H27L0Aw2Tb2OnslNQ
Message-ID: <CAMRc=McG2xLUcE_yHq4MiFnm665riHHuHjk0GJE4cFV_gGU90Q@mail.gmail.com>
Subject: Re: [PATCH *-next 13/18] gpiolib: Remove needless return in two void APIs
To: Zijun Hu <quic_zijuhu@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Jamal Hadi Salim <jhs@mojatatu.com>, 
	Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Lee Jones <lee@kernel.org>, Thomas Graf <tgraf@suug.ch>, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Zijun Hu <zijun_hu@icloud.com>, linux-arch@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev, 
	linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_050636_973857_A4EFFDBA 
X-CRM114-Status: GOOD (  11.20  )
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

T24gRnJpLCBGZWIgMjEsIDIwMjUgYXQgMjowMuKAr1BNIFppanVuIEh1IDxxdWljX3ppanVodUBx
dWljaW5jLmNvbT4gd3JvdGU6Cj4KPiBSZW1vdmUgbmVlZGxlc3MgJ3JldHVybicgaW4gdGhlIGZv
bGxvd2luZyB2b2lkIEFQSXM6Cj4KPiBncGlvX3NldF92YWx1ZV9jYW5zbGVlcCgpCj4gZ3Bpb19z
ZXRfdmFsdWUoKQo+Cj4gU2luY2UgYm90aCB0aGUgQVBJIGFuZCBjYWxsZWUgaW52b2x2ZWQgYXJl
IHZvaWQgZnVuY3Rpb25zLgo+Cj4gU2lnbmVkLW9mZi1ieTogWmlqdW4gSHUgPHF1aWNfemlqdWh1
QHF1aWNpbmMuY29tPgo+IC0tLQoKVGhhdCB3b3VsZCBub3JtYWxseSBtYWtlIHNlbnNlIGJ1dCB3
ZSdyZSBnZXR0aW5nIHRoYXQgcmV3b3JrZWRbMV0gaW4KdGhpcyB2ZXJ5IGN5Y2xlIHNvIHBsZWFz
ZSBkcm9wIHRoaXMgcGF0Y2ggZnJvbSB5b3VyIHNlcmllcy4KCkJhcnQKClsxXSBodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1ncGlvLzIwMjUwMjIwLWdwaW8tc2V0LXJldHZhbC12Mi0wLWJj
NGNmZDM4ZGFlM0BsaW5hcm8ub3JnLwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
