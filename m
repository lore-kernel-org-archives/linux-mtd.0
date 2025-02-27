Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585FDC197BF
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2025 23:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oVeVXBa6HL7CRGCzteh1O5oHiWjK15gaTn51YALPM7Y=; b=jS+O3T5PyS6AyK
	Innw8PRrEi/0wly3ebsIiBnG7yT+sI0/dioe29n4tbUWlVlGFeFiWg+O29rzi3s2wVEzMeiwuxAcx
	sEE1/lCI1352uxJ+bX9VJNhQ6YLaJGmZ1ib5g2tNekghsaTiahO3tyOhH7AkHfDGVLc98R3YBKdUF
	kOsXiYeOmSjg2jGQVT4ZuagGzUL+6WW/U2kFVQ3zVxAs0Uf5CObCMyTOCGJWKOG9Eq+jLMJFN7nas
	0nIynkkmwdMufvspurKp4e1d53lcRFGRw6GAnlcrmebzO2pfU2rHHkn1kl6tvCsJKoY9Q09ItmIQ6
	Sq6RLNu0v16fHtqSQPBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnn5B-000000098Lt-1wqV;
	Thu, 27 Feb 2025 23:14:21 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnn3v-000000098Av-0H8T
	for linux-mtd@lists.infradead.org;
	Thu, 27 Feb 2025 23:13:04 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5452ca02bdbso1548508e87.1
        for <linux-mtd@lists.infradead.org>; Thu, 27 Feb 2025 15:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740697981; x=1741302781; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YmkybCOSFne6yK3kY+Du84AtHtcKYiWZlsF8gbRhEyU=;
        b=m0uz/RpSH9bR9YrCwiZ3/hqgQU6XcRw+Zto0GeK6SVzpt6OPYf5WLpVNZ4k88XkqMT
         rqHcN4sCqHx0yctCSfVmm3Eeuo3GdmsRc0chY6BfyzchSGlR8igKtycBrJJC9j1ubuid
         +Hhe7wvmUEMAyaYLfhkO0PCFKn82PAf7GAqriaD4QmTojpBoHjFr6TG9sSrcrL9bT3m8
         5xS6s/LEqaleWdCpHM1Ck1C8tUKj2aLiYvpK0DDuoCpFG87b7DO+NodIMEj1tlkzBRal
         w34K9rTOQDGWuaLBS4JM/O2W1jHlrzeOSS/ilVXnqTu34DBRcwApK47qFjqvknaCqwDY
         YtPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740697981; x=1741302781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YmkybCOSFne6yK3kY+Du84AtHtcKYiWZlsF8gbRhEyU=;
        b=BKDYBz63ze/r7ECHtFcWOeUCEt1jN4lVg77Pcb2NaOnafetLaJ0Ojht3ymXykaubJd
         zjBZIM4bums+dJt26SYZzJXL8KXGTcnuRhNGx4ROg7/3xiT8IgIpIL6//cSBXRS9TNzH
         969DjdDr6x/Itvna0jtAubx0s4IzTQvfIeJJ8+NtCz7tCwTSa65jlBc0TbXqxey6B5Pg
         yFd8wkgpxno9PMKvxTpTmrL8NBgbq5Mtp3oSJY1nhntSllgWwYF52qqfEdaoXPwZKbEI
         cEw/9KffbCKCN6uZvaHiBaX60emeFdOprcM8UJBzmhg//aiiCMzj9SDLXsj8IdV3gWsU
         fNdw==
X-Forwarded-Encrypted: i=1; AJvYcCX3UzEOgxY/InNerQ4amcq2AM0EqL07XVWaS5P4+TCMWJ+OIYNxrqnKwu5OqEPSvBvixHyCRQJXFpE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzLSTqsDWg731u+Gwwg6gokWjSj7JP39FC+KZ2FYZn8QwJ1AgLO
	QWk9JXkzCih820XORoqmtgsu/B4Kg/kIHugy3CLZVEJLyw6yWZRFkTuxK8eFqk8ApEBoPIy8Aeb
	BBl5VWTeH/txW9G+VYbxzOPBsdcpa2ouF9tDTIg==
X-Gm-Gg: ASbGnctYKMTt9B8gMQFMQ/BCsvjaG0fqv9IKwwz1+E/IoSpYXi2yMmxGUuKExv+FBMY
	AgztILAtMOyFCqZBkn7DaOAowf+APQ1LM0tlopCSdXR+vqdA/dPCAJZwsPH4BB/VpEW+hMgCiiD
	8enpLQI4g=
X-Google-Smtp-Source: AGHT+IHLcUchRQ5RHejMZKQOgPdGa2RgldlYInULBrGmDbyHiaxGOnJDGcYbTPdwNuvGN5wuzKGCGgT0iWuzwLntJq0=
X-Received: by 2002:ac2:4e0e:0:b0:545:2fa9:8cf5 with SMTP id
 2adb3069b0e04-5494c354e58mr578980e87.49.1740697980909; Thu, 27 Feb 2025
 15:13:00 -0800 (PST)
MIME-Version: 1.0
References: <20250221-rmv_return-v1-0-cc8dff275827@quicinc.com> <20250221-rmv_return-v1-15-cc8dff275827@quicinc.com>
In-Reply-To: <20250221-rmv_return-v1-15-cc8dff275827@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Feb 2025 00:12:48 +0100
X-Gm-Features: AQ5f1Jra6Y1TNly1NYmSkFPtENvNIwlGHtsux17X3bXg-g3qhlo7h9G9hMQoxr8
Message-ID: <CACRpkdZV4EHGxYrX77FgsZvPrHohCEixXX6dkEoVSYSsaAzbYg@mail.gmail.com>
Subject: Re: [PATCH *-next 15/18] mfd: db8500-prcmu: Remove needless return in
 three void APIs
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
	Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
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
X-CRM114-CacheID: sfid-20250227_151303_105225_5A953907 
X-CRM114-Status: GOOD (  10.43  )
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

T24gRnJpLCBGZWIgMjEsIDIwMjUgYXQgMjowM+KAr1BNIFppanVuIEh1IDxxdWljX3ppanVodUBx
dWljaW5jLmNvbT4gd3JvdGU6Cgo+IFJlbW92ZSBuZWVkbGVzcyAncmV0dXJuJyBpbiB0aGUgZm9s
bG93aW5nIHZvaWQgQVBJczoKPgo+ICBwcmNtdV9lYXJseV9pbml0KCkKPiAgcHJjbXVfc3lzdGVt
X3Jlc2V0KCkKPiAgcHJjbXVfbW9kZW1fcmVzZXQoKQo+Cj4gU2luY2UgYm90aCB0aGUgQVBJIGFu
ZCBjYWxsZWUgaW52b2x2ZWQgYXJlIHZvaWQgZnVuY3Rpb25zLgo+Cj4gU2lnbmVkLW9mZi1ieTog
WmlqdW4gSHUgPHF1aWNfemlqdWh1QHF1aWNpbmMuY29tPgoKUmV2aWV3ZWQtYnk6IExpbnVzIFdh
bGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
