Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444D3D49206
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Nov 2024 10:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0wvGCuqhCkkvGLXKvhVift7XdyjLP6pFID25b+jDLhQ=; b=wariQcznbuhRS0
	XNaVxl/Ha3Un+NWIczlkPnqdMs6Ugve9/tIy1exSlUIMPGW4Js8DROdrCfhcll41wfMPvinuuj+vd
	NNxaGO4xFIYntFWkDH1+0RVfKfwYOaw2erA0gk7UcoR4S88SEFfmKhMUIsJ4U4J1CJXatDqX7Jh5P
	JLbPh44deHc3Jm4ZDpPafgvGdXmxifbKwiUnynh+twBz2wNcOz65pM2962/+UWHL/3ab+K3pTBQNY
	DeCZSeIC5FoTgCl4UDEWDweDID+IMpUGvFM7ywPbO+7Ihq2eqIdqdzcJxpBvwLGa3R8rSoNc2WIJv
	9zcVNl83Bfu3I1IUkoNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCydQ-000000090QT-0jdR;
	Mon, 18 Nov 2024 10:05:32 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCydL-000000090Pd-2NAR
	for linux-mtd@lists.infradead.org;
	Mon, 18 Nov 2024 10:05:31 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7ea76a12c32so2126856a12.1
        for <linux-mtd@lists.infradead.org>; Mon, 18 Nov 2024 02:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1731924326; x=1732529126; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sxd39NSvUUjI4ytuBy934f6Pt2r0d2cWZjr3fT3ouf0=;
        b=YXjLHAqCrOGOaTG+OAAGyI1m0mJ5pqnjvRl6vS2dLQJC3C3HoefXzXO6YyfC7PNs68
         8Ai4MbNLXpjF7VPYZpvDGVxjNW5jWiv8/GiHTWmtGPV9JaMnNZdogYFlvwe2D3gHbMm8
         GrCwxfZpqANlQsF7uLytHPCP5SA2uWu1dgzFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731924326; x=1732529126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sxd39NSvUUjI4ytuBy934f6Pt2r0d2cWZjr3fT3ouf0=;
        b=VUPIV9BRbhOV8K7slYa1lFxrQpXUFu82FszLjmT7EdTTo9CIwWinuqIPveEwya1of4
         RGQFVo9EmlxPSV5RspS0rtZnZhjSEP9/Otf0YXquVECwdTsXR7T8O7neVUyoYP4PmlOM
         vKDAlmriaKOczWTcyFTAdwL8JpHZzHVGzNRL5hRsgx0ml/ExSes61RUtts4hpeRa2iAQ
         bHfM5OKh5ti/lOsO99Piiv6WO4VbF8y9OU1uSJydo5QA1WZzNOx+jijvRNHw6M7f5Rdt
         aJfKWZFWgM2mXH6A7bDQEFLVHi+emL/vnKqMkjMPvLP0xplXrR0ZRo+zGxhptXXrKWpi
         Hiow==
X-Forwarded-Encrypted: i=1; AJvYcCXf2imQU5ZQIfB3I0cdFSxToA5ojbYDLVHid8KmyaLe30bbxzwf11mms4iCt2BQgzJNrpOQuw+Q/f8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxRo0LRXwtaZo/MA8wAQ1N/e2L5wkBU3h7+YMM8GSwlMWb9aSvR
	WNMJVBfbyZ0r/WBYYVinFNs+K2NWo54+aHbJFlDWW6xaeNh6gKtnYmDj17LBuReKPsbUecnpwd1
	zOoGVrAkiT9m1QlcFVjCpJmF2xftlOewAwFws6PJkqipuSmw8
X-Google-Smtp-Source: AGHT+IGMzm9VCcJoKEoAhb3c4dhHwNNq3ItFu5Nhe4deNJbk6tKQT7V1PvI+Lqysd6hLyMAt0T3izogWme1jyox4OWw=
X-Received: by 2002:a05:6a20:4305:b0:1db:e0d7:675c with SMTP id
 adf61e73a8af0-1dc90b2371fmr16767083637.13.1731924326545; Mon, 18 Nov 2024
 02:05:26 -0800 (PST)
MIME-Version: 1.0
References: <CAOf5uw=e1wZh2ifvSXYMe4H28R5DNuos7uPziFMGs8T6nVeYWA@mail.gmail.com>
 <b03b6625-3971-76c4-d045-6e35ec220caf@huawei.com> <CAOf5uwm=nLLcyvtc7EGK=rdu6N+j6t6_hYyCWcB3QMACOAEx2A@mail.gmail.com>
 <8df70e11-3278-06ed-5952-c808035bb679@huawei.com> <CAOf5uwkhgDxUprK+fp09dWh1aXMNPJC7YPjFNChT2Qj86do4hQ@mail.gmail.com>
 <302574690.38068166.1731924136160.JavaMail.zimbra@nod.at>
In-Reply-To: <302574690.38068166.1731924136160.JavaMail.zimbra@nod.at>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Mon, 18 Nov 2024 11:05:15 +0100
Message-ID: <CAOf5uwnXmiB+ij=WzWuSytXh-VA60ZHVL7WiSBpA8iKi7SvjNA@mail.gmail.com>
Subject: Re: Some information about direct-io support on ubifs
To: Richard Weinberger <richard@nod.at>
Cc: chengzhihao1 <chengzhihao1@huawei.com>, linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_020527_607159_FF69C8AE 
X-CRM114-Status: GOOD (  17.53  )
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

SGkgUmljaGFyZAoKT24gTW9uLCBOb3YgMTgsIDIwMjQgYXQgMTE6MDLigK9BTSBSaWNoYXJkIFdl
aW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PiB3cm90ZToKPgo+IC0tLS0tIFVyc3Byw7xuZ2xpY2hl
IE1haWwgLS0tLS0KPiA+IFZvbjogIk1pY2hhZWwgTmF6emFyZW5vIFRyaW1hcmNoaSIgPG1pY2hh
ZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gPj4gPj4+IEkgd291bGQgbGlrZSB0byBoYXZlIHNv
bWUgaW5mb3JtYXRpb24gb24gaG93IHRvIGltcGxlbWVudCBkaXJlY3QtaW8KPiA+PiA+Pj4gc3Vw
cG9ydCBpbiB1Ymlmcy4gSSBoYXZlIHRyaWVkIHRvIG1vdW50IHNxdWFzaGZzIGltYWdlIGFzIGZp
bGUgaW4KPiA+PiA+Pj4gdWJpZnMgdXNpbmcgbG9vcGJhY2sgYW5kIGRpcmVjdC1pbyBidXQgaXQg
c2VlbXMgdGhhdCBsb29wIGNhbiBub3QKPiA+PiA+Pj4gaGFuZGxlIHdoZW4gdGhpcyBpcyBvbiB0
b3Agb2YgdWJpZnMuIEZyb20gd2hhdCBJIHVuZGVyc3RhbmQgZnJvbSB0aGUKPiA+PiA+Pj4gY29k
ZSBpdCBzZWVtcyB0aGF0IHRoZSByZXF1aXJlbWVudCBpcyB0aGF0IHRoZSBkaXJlY3QtaW8gaXMK
PiA+PiA+Pj4gaW1wbGVtZW50ZWQgaW4gdGhlIGZpbGVzeXN0ZW0gd2hlcmUgdGhlIGZpbGUgaXMg
c3RvcmVkLiBJIGhhdmUKPiA+PiA+Pj4gc2ltdWxhdGVkIHVzaW5nIG5hbmQgc2ltLiBUaGUgaWRl
YSBpcyB0byByZWR1Y2UgdGhlIGJ1ZmZlcmluZy4gSSdtCj4gPj4gPj4+IG9wZW4gdG8gaGF2ZSBv
dGhlciBzdWdnZXN0aW9ucyByZWdhcmRpbmcgdGhpcyB0b28uCj4KPiBXaHkgYXJlIHlvdSB1c2lu
ZyBVQklGUyBhbnl3YXkgZm9yIHRoaXM/IEp1c3QgcGxhY2UgdGhlIHNxdWFzaGZzIGluc2lkZQo+
IGFuIFVCSSB2b2x1bWUuCgpZZXMgdGhpcyBpcyBvbmUgb2YgdGhlIHNvbHV0aW9ucyBJIGhhdmUg
cHJvcG9zZWQsIGJ1dCB0aGUgaWRlYSBpcyB0bwp1cGRhdGUgYSBzaW5nbGUgc3F1YXNoZnMKY29u
dGFpbmVyIGFuZCBub3QgYm91bmQgdGhlIGxpbWl0IGluIHRoZSBiZWdpbm5pbmcgb2YgdGhlIGRl
dmljZSBsaWZlLgpEb2VzIGl0IG1ha2Ugc2Vuc2UgdG8geW91PwoKPHJvb3RmcyB1Ymlmcz4geW91
IGNhbiBjcmVhdGUgYW55IHNpemUvbnVtYmVyIG9mIGNvbnRhaW5lcnMgaWYgdGhleQpmaXQgaW5z
aWRlIHRoZSBkZXZpY2UuCgpNaWNoYWVsCgo+Cj4gVGhhbmtzLAo+IC8vcmljaGFyZAoKCgotLSAK
TWljaGFlbCBOYXp6YXJlbm8gVHJpbWFyY2hpCkNvLUZvdW5kZXIgJiBDaGllZiBFeGVjdXRpdmUg
T2ZmaWNlcgpNLiArMzkgMzQ3IDkxMyAyMTcwCm1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKQW1hcnVsYSBTb2x1dGlvbnMgQlYK
Sm9vcCBHZWVzaW5rd2VnIDEyNSwgMTExNCBBQiwgQW1zdGVyZGFtLCBOTApULiArMzEgKDApODUg
MTExIDkxNzIKaW5mb0BhbWFydWxhc29sdXRpb25zLmNvbQp3d3cuYW1hcnVsYXNvbHV0aW9ucy5j
b20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
