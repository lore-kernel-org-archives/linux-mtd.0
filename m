Return-Path: <SRS0=jxJ8=3B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49310C33CA9
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Jan 2020 22:49:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 188392084D
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Jan 2020 22:49:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KyVmcCxD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n/BDkbWv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 188392084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kNhJ2DJcHx/b552t6id9sfkeM5+hN6tESyMLpNreZZE=; b=KyVmcCxD8kWIUX
	jFM3twyqq7qr89j0MiqJ7fvO9AxXQHEGD6Pg5svTTSvFHyew4Zp120APe9+BHUtv/kAd0ndlazrCB
	DvSGyCi4U0TFIxyGUXjIufzfeEpuj3oxzjts4UEg5FZhlYcrpPPkAKkUrNGPBYuy2Hag8LoP79WJt
	vRf3EjxzJa7g8ICzgoe4L4eQ+SimdO4Fha1vmR0geQBLiiH28nWfqUFW1HRhmY8XNlQbEW3wKqW6w
	JceW7SG0tJziFAKQKjBJp/BpvqEaq1MIF+tQu+NR85hzQCuL6HEoMphQCre2Xeq+edPGjQjBJ4B3f
	EoWvxxFJpa3v4jqvxaiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqm30-0006PJ-Mv; Sun, 12 Jan 2020 22:49:30 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqm2x-0006ON-Bk
 for linux-mtd@lists.infradead.org; Sun, 12 Jan 2020 22:49:28 +0000
Received: by mail-wr1-x444.google.com with SMTP id d16so6765015wre.10
 for <linux-mtd@lists.infradead.org>; Sun, 12 Jan 2020 14:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MzoQ2jg4oFupXMXlxp1CLkIfp3lD+zbiYm54IT89hQE=;
 b=n/BDkbWvwPexU6KNI3DcndbVPFfvq6msl56o2Vs8WDpxxUWVLXJSM542ofKL3ni5V0
 FZTyvLjw4btxAQtK5JSTRiTzoggcyD+S3Uua993GbnNpPvlXru6WNyyC6dk6oDkKX2oK
 67kH4gkLR72NOORdAE6vNxPqyOci0T6zpGu+sGyW2ykzIV422CoZcDQdQn5ah+1xssYO
 vxSHrp011TrKmNpOBwS9cVcL+inamf0M65LqC9GEN/u/BdZp/0CBG841i6FzJUjdEiPA
 bTDPRVN9FO/irN5OQOhA42CSvSfVBAcrpE3jIhujT1DVFoC10NgB2TC6UcQCr9NIy99p
 rOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MzoQ2jg4oFupXMXlxp1CLkIfp3lD+zbiYm54IT89hQE=;
 b=mkUOcsXHeh1yYT2xEaiW6II8D60iyjTpICUQmhDMRHWifgIEM1TPE8mP8ylNe1H4i0
 kEsor8fw7abBFW5qCBDoww6JYojYwKJqq3lzcJ/BvOpod+2/sWYx7rKeuMmjpSnm36cY
 UZM0g8jyGPM40Gi/8FaRgoisbTkeNmRN1Z5s5/u73hA37Iuml7RCc/v4Kcyamxrglf04
 LW9U05KuhHY/XJp9w4wdYsLKFnHvBsCIfm9Sk0PcXQEzNq+droJTHxVWY26RJsOei36E
 cPOuPtWuGO0T8SR7oCqRHA5yAwpNVh7peATzsJ4mkIdR7ZeayFEVQhY1vECOY4N6yuCs
 gN6w==
X-Gm-Message-State: APjAAAX1U7Sr+VPd3nP5v8cWkd0QWw9OUaw8VhSKVLrEB456+CbFr2va
 FHOpQXHfxmL54wj8E+ntUzoi15utgNYLWYOzS60=
X-Google-Smtp-Source: APXvYqyBmCq60wRqDN13DYHLpE3BpSEwtVRR+D2yDu1FVab464RRHamv0OXBlql/KPpTX0dNN0j7XsT1oj35CNKNbPI=
X-Received: by 2002:adf:a308:: with SMTP id c8mr14660636wrb.240.1578869364989; 
 Sun, 12 Jan 2020 14:49:24 -0800 (PST)
MIME-Version: 1.0
References: <20191216154441.6648-1-fishland@aliyun.com>
In-Reply-To: <20191216154441.6648-1-fishland@aliyun.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 12 Jan 2020 23:49:13 +0100
Message-ID: <CAFLxGvyU=zh23vkYiAGRzyd4LGJodLwRRa1S03THAoSaSL=dGA@mail.gmail.com>
Subject: Re: [PATCH] ubifs: Fix potentially out-of-bounds memory access in
 ubifs_dump_node
To: Liu Song <fishland@aliyun.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200112_144927_424781_C129AE2A 
X-CRM114-Status: GOOD (  14.59  )
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
 LKML <linux-kernel@vger.kernel.org>, liu.song11@zte.com.cn
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBEZWMgMTYsIDIwMTkgYXQgNDo0NSBQTSBMaXUgU29uZyA8ZmlzaGxhbmRAYWxpeXVu
LmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBMaXUgU29uZyA8bGl1LnNvbmcxMUB6dGUuY29tLmNuPgo+
Cj4gSW4g4oCcdWJpZnNfY2hlY2tfbm9kZeKAnSwgd2hlbiDigJxub2RlX2xlbiArIG9mZnM+IGMt
PiBsZWJfc2l6ZeKAnSwgdGhlbgo+IGdvdG8gbGFiZWwgb2YgIm91dF9sZW4iLiBUaGVuLCBpbiB0
aGUgZm9sbG93aW5nICJ1Ymlmc19kdW1wX25vZGUiLAo+IGlmIGlub2RlIHR5cGUgaXMgIlVCSUZT
X0RBVEFfTk9ERSIsIGluICJwcmludF9oZXhfZHVtcCIsIGFuCj4gb3V0LW9mLWJvdW5kcyBhY2Nl
c3MgbWF5IG9jY3VyIGR1ZSB0byB0aGUgd3JvbmcgImNoLT5sZW4iLgo+IFdlIGVuY291bnRlcmVk
IHRoaXMgcHJvYmxlbSBpbiBvdXIgZW52aXJvbm1lbnQuIElmICJjaC0+IGxlbiIgaXMKPiB2ZXJ5
IGxhcmdlLCBpdCBtYXkgZXZlbiBjYXVzZSB0aGUga2VybmVsIHRvIGNyYXNoLgo+Cj4gVGhlcmUg
YXJlIHRocmVlIHJlYXNvbnMgdG8gY2hvb3NlIHRvIHJlbW92ZSAicHJpbnRfaGV4X2R1bXAiLgo+
IDEpIEFzIG1lbnRpb25lZCBlYXJsaWVyLCB0aGUgZXhjZXB0aW9uICJjaC0+IGxlbiIgbWF5IGNh
dXNlIGFuCj4gZXhjZXB0aW9uIGluICJwcmludF9oZXhfZHVtcCI7Cj4gMikgRGF0YSBub2RlcyBh
cmUgb2Z0ZW4gbGFyZ2UuIFdoZW4gcHJpbnRpbmcgZGF0YSBjb250ZW50IGluCj4gInByaW50X2hl
eF9kdW1wIiwgYSBsYXJnZSBhbW91bnQgb2Ygb3V0cHV0IHdpbGwgYnJpbmcgYSBoaWdoIGxvYWQK
PiBvbiB0aGUgc3lzdGVtLCBhbmQgbWF5IGV2ZW4gY2F1c2UgYSB3YXRjaGRvZyByZXNldDsKPiAz
KSBFdmVuIGlmIHRoZXJlIGlzIGEgQ1JDIGNoZWNrIGVycm9yLCB0aGUgc3R1ZmYgb2YgZmlsZSBp
cyBkaWZmaWN1bHQKPiB0byBpZGVudGlmeSwgYW5kIGRpZmZpY3VsdCB0byBmaW5kIHRoZSBwcm9i
bGVtIGZyb20gYSBsYXJnZSBhbW91bnQgb2YKPiBvdXRwdXQuIFdlIGhhdmUgYWxyZWFkeSBvdXRw
dXQgdGhlIExFQiBhbmQgb2Zmc2V0IG9mIHRoZSBub2RlLiBTbyB3ZQo+IGNhbiB0YWtlIHRoZSBp
bml0aWF0aXZlIHRvIHZpZXcgdGhlIGRhdGEgb2YgaW50ZXJlc3QsIGluc3RlYWQgb2YKPiBwcmlu
dGluZyBpdCBkaXJlY3RseS4KCklmIFVCSUZTIGR1bXBzIGRhdGEgbm9kZXMgZHVlIGFuIGVycm9y
IHdlIGFyZSBhbHJlYWR5IGluIGRlZXAgdHJvdWJsZQphbmQgaGF2aW5nIHRoZSBjb250ZW50IG9m
IGJhZCBkYXRhIG5vZGVzIGNhbiBiZSBoZWxwZnVsLgpUaGlzIGZlYXR1cmUgaGVscGVkIG1lIG1v
cmUgdGhhbiBvbmNlIHRvIGRlYnVnIGlzc3Vlcy4KCi0tIApUaGFua3MsCi8vcmljaGFyZAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
