Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C6EC02198
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2025 07:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yIts1j2+kdT0cP2gYcAKU9oWJF21YiZbtYy9TWjSa4c=; b=ovtTad6Gkb+U7V
	sa688dzmY47CxYxcZaHeHfphmuVuVZbdrKptVMEsYLERzeFThZ30mIlroaf1i0ec1VrmRzLkWy3pA
	zgJevt9d0aQ76CjHWaMK8ea5NMnwiEyaSge5NO5cHZAOWeM+I2OjDhuT0IUO7AKEFsfIi4mX4KUv8
	dRP4iZz6o1aT8VMulGZgZnZs7DhF+YoyOw/UyXWnigNrZdM+mSggbqXmxhEc1FixFfAFuZRvudYke
	WTSUctRfKE0Yc5L7jOoQv1/tJu/ZXBVj5JpAa0FUS7EjTArfarLp3iUQ1axorKv1UAj9iMKIdt2aT
	wYn9kY79Rm6vdYXEAeaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thObT-0000000GZqy-1CzI;
	Mon, 10 Feb 2025 07:53:15 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thObR-0000000GZqH-1sqk
	for linux-mtd@lists.infradead.org;
	Mon, 10 Feb 2025 07:53:14 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2fa8ac56891so367157a91.2
        for <linux-mtd@lists.infradead.org>; Sun, 09 Feb 2025 23:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739173992; x=1739778792; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9Nb0pktKII2Ub2eQbtJTenMU+mV/G1GmndQokFDo/8=;
        b=lczeDbloENyq7HaP9SFmgwLZKQc+UfoQMD0LvMN7rCVRWACpajS8qtXBCNQ3PXK8xH
         9/N70W91Vym7CNPtRmYGEzPL85G5HpxW2M7Mz9ovPfzu+2di5e6znaHuhxJjbdILTIIc
         8Ljg0nZYKgbT+dkdq4x90UWxaVb+bdH1J1a+xIQ2TMZhKwuCgqyR0MShhzqgbimajVtT
         m0ViG+5o9MA11vJAF3SgNxCGuyPSBTQD1xtdluKqfFTUoD63jjwFbFWhcO6fq2zTrXHx
         /xAkczwEMhYZUQEWOExeq9UW6QQn0BmzWA28dkWrGYmRTApDdHPkX+hhCvhsVUAZeQqo
         0xog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739173992; x=1739778792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9Nb0pktKII2Ub2eQbtJTenMU+mV/G1GmndQokFDo/8=;
        b=oCpm6LxZ7vwjSlyEpwBTTRs6Ug0hOdO59lnBkX1y2gqSPIrMwA7XEjzeFZdvzYuj/2
         s/aQc0PTwFL6IDTMgMgrYp5htKQq4NEVrIST+cBzCMrlCr3My3C4YOkJHCvSTn+n44bX
         227mXO06bn8bazZW7iK8r4rquFdq6gvr2phoQmC0kmaU15mbbqLDW2PgWuO8WDEtxs6R
         eVmxhiih+1AG8ffvujKbvb9v/8rIv0CnrhqpgffMCzGN3Yy1Y243Nm59497E5V7lrMjb
         OuvFftpCV2SO4Y5yFCyzJuwqHjmL61abbOnrVo4vOrvTbRsaMwKmr0GU5+FVOSAl59Ok
         1Xxw==
X-Forwarded-Encrypted: i=1; AJvYcCV6fFsFVv9Vh4BCQHmjTeuZFzjLbGJGzTKVCSu0b17FYLl+i0QbJyfCAUBjqMgMfTqMw2Ov6PI+3rY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3usO/4z6FykUCO64xwUT6klHJSmyzjRvW1uwjIiyCH0fBMGCz
	irNBe+5+vVJJmJW9rp3Xi3OZEeWyQfjFQjbkZigBU02Hq6X5NBqkkS1vmaHUUOcb6PUNz8m8krH
	mSd0WpEssHE8KEcS383AYGZAjygg=
X-Gm-Gg: ASbGncuzWVCqymCYZpabsEq5oXQPltGJB3FCumx+Xes2kAbW/+9wINAn/3uOtBACTMc
	ERy65/PiaG1uiWjfc46tgCnGrojcGIHhbwXO6yusO6RGZbJaiP7eyM1qQDQ53ermToC3oZJnJ
X-Google-Smtp-Source: AGHT+IGYwtiNs1daRmBy1KhDukrupoBRwNgyFx0NxH4pRt/R+CK7zKFxUkct1jJMcUr+wT/tCXPHoWC2sdAz73vB7+A=
X-Received: by 2002:a17:90b:3647:b0:2f7:4cce:ae37 with SMTP id
 98e67ed59e1d1-2fa2417806emr23591132a91.18.1739173992168; Sun, 09 Feb 2025
 23:53:12 -0800 (PST)
MIME-Version: 1.0
References: <20250207081846.362919-1-linchengming884@gmail.com>
 <20250207081846.362919-2-linchengming884@gmail.com> <1c1da131-a7b1-4c2e-9866-d7833a134033@linaro.org>
 <CAAyq3Sb4WZtjq6-jYqHYympSxLgf=Oifcf2BmV+pVLJGc8=oYg@mail.gmail.com> <87210c38-2e6d-4f14-8a4f-ea02288604fa@linaro.org>
In-Reply-To: <87210c38-2e6d-4f14-8a4f-ea02288604fa@linaro.org>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Mon, 10 Feb 2025 15:49:03 +0800
X-Gm-Features: AWEUYZmUvI2sgweezm6gJOEeRjRVOv03SUts67qUkiJM26UcK6C_PRmcDURr6c8
Message-ID: <CAAyq3Sa3XLQ6F1B7mdcgx7U5RyTec_Wmh09oMnVOJVFp-JwF-g@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: macronix: Add post_sfdp fixups for Quad
 Input Page Program
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, leoyu@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_235313_485399_E6A8A658 
X-CRM114-Status: GOOD (  13.46  )
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

SGkgVHVkb3IsCgpUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+IOaWvCAy
MDI15bm0MuaciDEw5pelIOmAseS4gCDkuIvljYgzOjQ45a+r6YGT77yaCj4KPgo+Cj4gT24gMi8x
MC8yNSAzOjI3IEFNLCBDaGVuZyBNaW5nIExpbiB3cm90ZToKPiA+PiBBbHNvLCBpZiB5b3UgdG91
Y2ggYWxsIHRoZXNlIGZsYXNoZXMsIHdpbGwgeW91IHBsZWFzZSB1cGRhdGUgdGhlbSBhbmQKPiA+
PiBnZXQgcmlkIG9mIHRoZSBzdHJheSBmbGFzaCBpbmZvIGZpZWxkcz8gSSdtIHRoaW5raW5nIG9m
IG5hbWUsIHNpemUsIGFuZAo+ID4+IG5vX3NmZHBfZmxhZ3MuCj4gPiBObyBwcm9ibGVtLiBXb3Vs
ZCByZW1vdmluZyB0aGVzZSBzdHJheSBmbGFzaCBpbmZvIGZpZWxkcyBmcm9tIHRoZQo+ID4gTWFj
cm9uaXggZmxhc2ggd2FycmFudCBhIHNlcGFyYXRlIHBhdGNoIHNlcmllcywgb3Igc2hvdWxkIGl0
IGJlIGluY2x1ZGVkCj4gPiB3aXRoIHRoZSBjdXJyZW50IGNoYW5nZXM/Cj4KPiBzZXBhcmF0ZSBw
YXRjaCBwbGVhc2UsIGJlY2F1c2UgcmVtb3ZpbmcgdGhvc2UgZmllbGRzIG1heSBpbnRyb2R1Y2UK
PiByZWdyZXNzaW9ucyBpZiBTRkRQIGRhdGEgaXMgbm90IHNhbmUuIFlvdSdsbCBuZWVkIHRvIGRv
IHRoZSB1c3VhbAo+IG1hbmRhdG9yeSB0ZXN0cyB3aGVuIHJlbW92aW5nIHRoZXNlIGZpZWxkcyB0
b28uIEJ1dCBpdCdzIHdvcnRoIGl0LAo+IHlvdSdsbCBoYXZlIGNsZWFuZXIgY29kZSBwYXRocy4g
VGhhbmtzIQoKVW5kZXJzdG9vZC4gSSB3aWxsIHN1Ym1pdCBhIHNlcGFyYXRlIHBhdGNoIHNlcmll
cyB0byByZW1vdmUgdGhvc2UKZmllbGRzLCBhcyB5b3Ugc3VnZ2VzdGVkLiBUaGFuayB5b3UgZm9y
IHlvdXIgZ3VpZGFuY2UuCgpUaGFua3MsCkNoZW5nIE1pbmcgTGluCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
