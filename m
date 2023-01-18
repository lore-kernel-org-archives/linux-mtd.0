Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3BEC38142
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Jan 2023 00:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xlWy42917ZGyy+ys3ckwSr+snWhEKtAjijDwZnoKh3E=; b=LCi2Nu1BYdg4Ju
	K8O16CrFjT4vzfN+aeT4T/Vjguz0hyW42wyWfshTqTzPxSUcPA5weoQK3mcEUBuCrhQbvljMM8XRu
	4z2TjlI3bhYcD4CJ8+Jif9lQysKQBWZygEiAEFC4iXDzCHx8gATY2u97YHXd+LM47GnIgPoeSiDa5
	sU2rHjmm7VNVYNkB81YpHW/Q/pjE7oGnJvf7fBE1zheE0IUohu4dOClEUeoHVXiUQ4iI0MlResdy+
	Daoz5M6aIQdhjMzy8E73n9T+at4fDn2iJIF2Co44qW/ys64KIzcSJyj+yIcs6rnSYbSGJ5g1jGLN6
	gpkRuMgUNR2JWPJUdIaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHw2G-00GJlH-Jb; Wed, 18 Jan 2023 00:10:36 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHw2D-00GJkE-Sw
	for linux-mtd@lists.infradead.org; Wed, 18 Jan 2023 00:10:35 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id v19so30331028ybv.1
        for <linux-mtd@lists.infradead.org>; Tue, 17 Jan 2023 16:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mqoGaxCv32d9QDH8rbs+wNFx+mRHisbPyzqWglfmzdo=;
        b=X8kEN2RCR0Z7j9dvYBPvrUngCUUeFWtb1S07rcVgUPJfjZWU74psq/1gmCn184hHsa
         uAze+wMWm/HhTilA6p92QH5ri8+IauhT90wWGY1gF+L4D1hxqn6EEUAC2u4NEpV9Nmvn
         x+3uw1f3Kj62qSMscS/TsPlYBzCYZoW6NNjmtZbAPUJ/5TKESadBgRtm8J1MdvDK06vz
         WYfkJ4Sp7G5/xmXAjhT1J6VJC34p+oXr1s/hPXo04xworQlkKedZ7oKdZ+cdRdRuwnLj
         FlNdnb/9pL7BHz0y6pWQYZ0EY4EDj4CwBCe3rsWwDGIkCSO63TNtAcqrhSR1ML+9G3SE
         inSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mqoGaxCv32d9QDH8rbs+wNFx+mRHisbPyzqWglfmzdo=;
        b=jb3RFjszcy8z+fY8Biy50h7tCiyalWcw3vGGjbFJGIfD3jWJ1pOULZj9LkmM/3ebRg
         43Aozv6BsaHFYzQN6iHgyYTaOI4hvcQ+V9n1OrEBEJq0+yDKtU3UtUZT+Z51iZyqdl5r
         d67hv9hLDqP1WQg51kUqKUgG9FrDVGQa2ZHKD6W8wKdtbFrsEbbVIgZX6+CB2Bt5YkSF
         KxJBLfJ0CKRfP3/6Ju5+s4H7mGLobwJe4EYJ5G1sOJqJ2nr0mjwzGPFFSapfauYVj1be
         q5XYg20vm02Fz2P8Y1+vEwnQLylpnjJjv4J0wM+UoJLJ1DM7gzDvpSlAU0SalNlkiLEL
         NEig==
X-Gm-Message-State: AFqh2krfSXGsDJCdFRId3N5q2Af1VubgCFRVtv3M9CAnjOcu/1SD6S3Z
	v5DFBxEQni2SqucHgFG/kEY=
X-Google-Smtp-Source: AMrXdXvLckhDa1bG5Pn2IzKkim7J+U5lK7NIKjwNimaDoNI+pnG9GJpZUGRqId1mcbsUGnMptZYX1A==
X-Received: by 2002:a25:4084:0:b0:7d8:aaf9:bdd7 with SMTP id n126-20020a254084000000b007d8aaf9bdd7mr4610072yba.3.1674000628976;
        Tue, 17 Jan 2023 16:10:28 -0800 (PST)
Received: from [192.168.0.14] (cpe84948cc906a3-cm84948cc906a0.cpe.net.cable.rogers.com. [99.231.72.42])
        by smtp.gmail.com with ESMTPSA id h18-20020a05620a401200b007064fa2c616sm6796318qko.66.2023.01.17.16.10.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Jan 2023 16:10:28 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: remove arch/sh
From: "D. Jeff Dionne" <djeffdionne@gmail.com>
In-Reply-To: <c9ce648e-e63e-8a47-03c6-7c7e30d8dbc7@roeck-us.net>
Date: Tue, 17 Jan 2023 19:10:25 -0500
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Rob Landley <rob@landley.net>,
 Christoph Hellwig <hch@lst.de>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arch@vger.kernel.org,
 dmaengine@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org,
 linux-media@vger.kernel.org,
 linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org,
 linux-usb@vger.kernel.org,
 linux-fbdev@vger.kernel.org,
 alsa-devel@alsa-project.org,
 linux-sh@vger.kernel.org
Message-Id: <9FC76FF3-9DD4-48E2-BC39-479A50B40C1D@gmail.com>
References: <20230113062339.1909087-1-hch@lst.de>
 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
 <20230116071306.GA15848@lst.de>
 <9325a949-8d19-435a-50bd-9ebe0a432012@landley.net>
 <CAMuHMdUJm5QvzH8hvqwvn9O6qSbzNOapabjw5nh9DJd0F55Zdg@mail.gmail.com>
 <c9ce648e-e63e-8a47-03c6-7c7e30d8dbc7@roeck-us.net>
To: Guenter Roeck <linux@roeck-us.net>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_161033_977594_6BF689CC 
X-CRM114-Status: GOOD (  11.24  )
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

Cj4gU2luY2UgdGhlcmUgYXJlIHBlb3BsZSBhcm91bmQgd2l0aCByZWFsIGhhcmR3YXJlIC4uLi4g
aXMgc2ggaW4gYmlnIGVuZGlhbiBtb2RlCj4gKHNoZWIpIHJlYWwgPyBJdHMgcWVtdSBzdXBwb3J0
IGlzIHF1aXRlIGxpbWl0ZWQ7IG1vc3QgUENJIGRldmljZXMgZG9uJ3Qgd29yawo+IGR1ZSB0byBl
bmRpYW5uZXNzIGlzc3Vlcy4gSXQgd291bGQgYmUgaW50ZXJlc3RpbmcgdG8ga25vdyBpZiB0aGlz
IHdvcmtzIGJldHRlcgo+IHdpdGggcmVhbCBoYXJkd2FyZS4KCkhpIEd1ZW50ZXIsCgpTSCBiaWcg
ZW5kaWFuIHdvcmtzIHZlcnkgd2VsbCwgYW5kIGlzIGluIHVzZSBvbiBKLUNvcmUgSjIgU01QICho
YXJkd2FyZSB3L0ZQR0EsIHNpbXVsYXRpb24gYW5kIEFTSUMgdGhpcyB5ZWFyKSBhcyB3ZWxsIGFz
IHNvbWUgb2YgdGhlIEhpdGFjaGkgLyBSZW5lc2FzIElvVCBjaGlwcyBlLmcuIFNINzYxOS4KCkl0
4oCZcyB0aGUgYmFzZSBvZiB0aGUgcmVhbCBuZXcgbGluZSBvZiBkZXZlbG9wbWVudCAoYXMgb3Bw
b3NlZCB0byBiYWNrd2FyZCBsb29raW5nIHN1cHBvcnQgb2Ygb2xkZXIgU0ggY2hpcHMpLiAgTmV3
IGNoaXBzZXRzIHdpbGwgYmUgYmFzZWQgb24gdGhlIHNhbWUgUlRMLgoKQnV0IGRvZXMgaXQgYWN0
dWFsbHkgd29yaz8gIFllcywgd2UgaGF2ZSAobmV3KSBkZXZpY2VzIHN1Y2ggYXMgYSBVU0IgV2ly
ZWd1YXJkIGJhc2VkIFZQTiBoYXJkd2FyZSBkb25nbGUsIHRoYXQgYXJlIEoyIChTSDIgMiBjb3Jl
IFNNUCkgdGhhdCBhcmUgaW4gdXNlIHdpdGggTGludXggc2hlYiwgbm9tbXUgYW5kIGZkcGljLiAg
TU1VIGNoaXBzIHdpbGwgYmUgbGl0dGxlIGVuZGlhbi4KCkNoZWVycywKSi4KCj4gVGhhbmtzLAo+
IEd1ZW50ZXIKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
