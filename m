Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC83C25B78
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2024 10:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+JRm5Bwj71RV8l4kuP28nphXgKHlS41F++KfTFTOxu8=; b=F3EcTWJaOeiXzM
	mWXMfTMih0B+yaj7NauHTG13CviyId0NYBmKdreN9ittHSk2XmZDEkxY2SrUyQhgA1HL6uHrt0NAx
	1rDwcKLQ+aW4rfhPjR1ASD26B4a2shnms2f/fj0CTvy2n2Vrq8Ve4Sy1pfiAt46Wfdm7vH42U75VI
	79zBY1je5/7ASCq87nZph1nEeTTiEUQY+wXrxzEaVKIaLdyauZpNYFd0mBUibnR/ENP2vg9wj1dDg
	XtI7ASBlreZ/p42yZBYHwTsWEZbu2/Dn9iBrV+IXbimqI7e4dKuu2pZQpSTtqmg5PAVmoHemucSnj
	CdQoWum1w9TdbIKE0Ijg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s90U6-0000000EBYu-0NVz;
	Mon, 20 May 2024 10:43:14 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s90U2-0000000EBXh-1Zl8
	for linux-mtd@lists.infradead.org;
	Mon, 20 May 2024 10:43:11 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-572f6ee87c1so6910988a12.2
        for <linux-mtd@lists.infradead.org>; Mon, 20 May 2024 03:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716201787; x=1716806587; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5P/QzPFswG4vPT6hlhiGDRrWMzE0UliNttansbfAvUA=;
        b=FgIaRn6sDs3Cm+RYrPGjEKhnbCQJWhzwfW1VrUEFfJ+hPNtq/ecNqwO+meMbi1yjaX
         TJZcSc6ISooikXfqkCACKndkgYy6ZARA1otHNcjt1/K9yJqNLXsIu+5uuVgG8j8NL74p
         sOa4ni9h/ouFY/QdnVkQNTJjf37imbr/jvb6Os1tn9izbNXe0hXInhYJ27zuigu7upxW
         OG0VLXu4+T6vs064y6yJXQ1+00JC9gRo7K4mLz3WNd5QowfS9zIBVCN4GUNS0beVcTX+
         MLF0qR1X11p5kDhiFCU5TNv0GNyDP7MLyEthz6axtYYaLv3MKAsQuknjr2g3ssxGT2GV
         ifyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716201787; x=1716806587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5P/QzPFswG4vPT6hlhiGDRrWMzE0UliNttansbfAvUA=;
        b=DPKJWWFQbw3WIGVZuUgEy23hPKnucsdWyqQ8v32JjRTJTGyKe7XqbzlqFGNScahpZO
         Gr5kgTTSi05z25qx71Bfc/01fmSJMduMjeqAwWs6jwEKWRAEuVee3nc7PSLosvveoiXX
         yUg3K9Ww95qM536PGjrKOH6aRLvpzPrPxxC3I5ich7S7AO70OSGX0w1bBZuRB8a5xTgm
         SnOJ8VRJuMjsiSkCovAXHbA7brF3gQmTuyfjVZ8OLIHgoVrccOAqihjxUDv/YvaHo5WS
         yMioKpUtCJo8+YCJsIx3AtUdH7MFMsyscf9ChXGoPtNLE6YE+XPAWtmr+u1zJb/nG8G9
         mS5g==
X-Forwarded-Encrypted: i=1; AJvYcCXwj6jqBH9Bz2NEwSIIaSsogRYhIe0sA95fEFNqnZ1Gg2qal14ifgMHPqLK/VhRyCK3N/yiN4CsbwV5ZaEVD9qgRSJMisbZl9ExF1Sr3w==
X-Gm-Message-State: AOJu0Yw7tTfqHPdS9lltlIXPKlCkGAsYTl6boJOJ+NU4Z3XR9jp293tx
	wwzxMK951OVFPk6aHG9qb9Q1Yij/+SE5zqOOGvz3BWahNZyfm/UWR11bA4lS/aYQ3+rYNwpa3Cg
	cb+YqzXCJvwfNTu+AmBoVkhfQkIk=
X-Google-Smtp-Source: AGHT+IEpn1WHtoIaDoNqFG/8v7tZ9VwgJSzpx0ICgi2qAca5uE0qqQvvx3vnm2kGqPzEX9Dap3IHuQJDLr9/FDiEc3M=
X-Received: by 2002:a50:8d07:0:b0:571:e272:296 with SMTP id
 4fb4d7f45d1cf-5734d67ee8emr19467598a12.27.1716201786895; Mon, 20 May 2024
 03:43:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240430-loongson1-nand-v7-0-60787c314fa4@gmail.com>
 <20240430-loongson1-nand-v7-2-60787c314fa4@gmail.com> <20240506091748.18c120d5@xps-13>
In-Reply-To: <20240506091748.18c120d5@xps-13>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Mon, 20 May 2024 18:42:30 +0800
Message-ID: <CAJhJPsVOx_AZmsRuZ5jy2-wJ+7-Wm+8RQAJ_LhKGLU3aFzrR7g@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] mtd: rawnand: Enable monolithic read when reading subpages
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_034310_436026_321DBFED 
X-CRM114-Status: GOOD (  18.51  )
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

T24gTW9uLCBNYXkgNiwgMjAyNCBhdCAzOjE34oCvUE0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIaSwKPgo+IGRldm51bGwra2VndWFuZy56aGFu
Zy5nbWFpbC5jb21Aa2VybmVsLm9yZyB3cm90ZSBvbiBUdWUsIDMwIEFwciAyMDI0Cj4gMTk6MTE6
MTEgKzA4MDA6Cj4KPiA+IEZyb206IEtlZ3VhbmcgWmhhbmcgPGtlZ3VhbmcuemhhbmdAZ21haWwu
Y29tPgo+ID4KPiA+IG5hbmRfcmVhZF9zdWJwYWdlKCkgcmVhZHMgZGF0YSBhbmQgRUNDIGRhdGEg
YnkgdHdvIHNlcGFyYXRlCj4gPiBvcGVyYXRpb25zLgo+ID4gVGhpcyBwYXRjaCBhbGxvd3MgdGhl
IE5BTkQgY29udHJvbGxlcnMgd2hvIHN1cHBvcnQKPiA+IG1vbm9saXRoaWMgcGFnZSByZWFkIHRv
IGRvIHN1YnBhZ2UgcmVhZCBieSBhIHNpbmdsZSBvcGVyYXRpb24sCj4gPiB3aGljaCBpcyBtb3Jl
IGVmZmVjdGl2ZSB0aGFuIG5hbmRfcmVhZF9zdWJwYWdlKCkuCj4KPiBJIGFtIGEgYml0IHB1enps
ZWQgYnkgdGhpcyBjaGFuZ2UuIFVzdWFsbHkgbmFuZF9yZWFkX3N1YnBhZ2UgaXMgdXNlZAo+IGZv
ciBvcHRpbWl6YXRpb25zICh3aGVuIGxlc3MgZGF0YSB0aGFuIGEgZnVsbCBwYWdlIG11c3QgYmUg
cmV0cmlldmVkKS4KPiBJIGtub3cgaXQgbWF5IGJlIHVzZWQgaW4gb3RoZXIgY2FzZXMgKGJlY2F1
c2UgaXQncyBlYXNpZXIgZm9yIHRoZSBjb3JlCj4gaW4gb3JkZXIgdG8gc3VwcG9ydCBhIHdpZGUg
cmFuZ2Ugb2YgY29udHJvbGxlcnMpLiBDYW4geW91IHBsZWFzZSBzaG93IGEKPiBzcGVlZCB0ZXN0
IHNob3dpbmcgdGhlIHJlc3VsdHMgYmVmb3JlIEkgY29uc2lkZXIgbWVyZ2luZyB0aGlzIHBhdGNo
Pwo+CldpdGggdGhpcyBwYXRjaDoKIyBmbGFzaF9zcGVlZCAtYyAxMjggLWQgL2Rldi9tdGQxCnNj
YW5uaW5nIGZvciBiYWQgZXJhc2VibG9ja3MKc2Nhbm5lZCAxMjggZXJhc2VibG9ja3MsIDAgYXJl
IGJhZAp0ZXN0aW5nIGVyYXNlYmxvY2sgd3JpdGUgc3BlZWQKZXJhc2VibG9jayB3cml0ZSBzcGVl
ZCBpcyAyMTEyIEtpQi9zCnRlc3RpbmcgZXJhc2VibG9jayByZWFkIHNwZWVkCmVyYXNlYmxvY2sg
cmVhZCBzcGVlZCBpcyAzNDU0IEtpQi9zCnRlc3RpbmcgcGFnZSB3cml0ZSBzcGVlZApwYWdlIHdy
aXRlIHNwZWVkIGlzIDE5MTUgS2lCL3MKdGVzdGluZyBwYWdlIHJlYWQgc3BlZWQKcGFnZSByZWFk
IHNwZWVkIGlzIDI5OTkgS2lCL3MKdGVzdGluZyAyIHBhZ2Ugd3JpdGUgc3BlZWQKMiBwYWdlIHdy
aXRlIHNwZWVkIGlzIDIwMDAgS2lCL3MKdGVzdGluZyAyIHBhZ2UgcmVhZCBzcGVlZAoyIHBhZ2Ug
cmVhZCBzcGVlZCBpcyAzMjA3IEtpQi9zClRlc3RpbmcgZXJhc2Ugc3BlZWQKZXJhc2Ugc3BlZWQg
aXMgNzI0OTUgS2lCL3MKVGVzdGluZyAyeCBtdWx0aS1ibG9jayBlcmFzZSBzcGVlZAoyeCBtdWx0
aS1ibG9jayBlcmFzZSBzcGVlZCBpcyA3NDEzNSBLaUIvcwpUZXN0aW5nIDR4IG11bHRpLWJsb2Nr
IGVyYXNlIHNwZWVkCjR4IG11bHRpLWJsb2NrIGVyYXNlIHNwZWVkIGlzIDc0ODEyIEtpQi9zClRl
c3RpbmcgOHggbXVsdGktYmxvY2sgZXJhc2Ugc3BlZWQKOHggbXVsdGktYmxvY2sgZXJhc2Ugc3Bl
ZWQgaXMgNzU1MDIgS2lCL3MKVGVzdGluZyAxNnggbXVsdGktYmxvY2sgZXJhc2Ugc3BlZWQKMTZ4
IG11bHRpLWJsb2NrIGVyYXNlIHNwZWVkIGlzIDc1ODUxIEtpQi9zClRlc3RpbmcgMzJ4IG11bHRp
LWJsb2NrIGVyYXNlIHNwZWVkCjMyeCBtdWx0aS1ibG9jayBlcmFzZSBzcGVlZCBpcyA3NTg1MSBL
aUIvcwpUZXN0aW5nIDY0eCBtdWx0aS1ibG9jayBlcmFzZSBzcGVlZAo2NHggbXVsdGktYmxvY2sg
ZXJhc2Ugc3BlZWQgaXMgNzYyMDQgS2lCL3MKZmluaXNoZWQKCldpdGhvdXQgdGhpcyBwYXRjaDoK
IyBmbGFzaF9zcGVlZCAtYyAxMjggLWQgL2Rldi9tdGQxCnNjYW5uaW5nIGZvciBiYWQgZXJhc2Vi
bG9ja3MKc2Nhbm5lZCAxMjggZXJhc2VibG9ja3MsIDAgYXJlIGJhZAp0ZXN0aW5nIGVyYXNlYmxv
Y2sgd3JpdGUgc3BlZWQKZXJhc2VibG9jayB3cml0ZSBzcGVlZCBpcyAyMDc0IEtpQi9zCnRlc3Rp
bmcgZXJhc2VibG9jayByZWFkIHNwZWVkCmVyYXNlYmxvY2sgcmVhZCBzcGVlZCBpcyAyODk1IEtp
Qi9zCnRlc3RpbmcgcGFnZSB3cml0ZSBzcGVlZApwYWdlIHdyaXRlIHNwZWVkIGlzIDk5OCBLaUIv
cwp0ZXN0aW5nIHBhZ2UgcmVhZCBzcGVlZApwYWdlIHJlYWQgc3BlZWQgaXMgMTQ5OSBLaUIvcwp0
ZXN0aW5nIDIgcGFnZSB3cml0ZSBzcGVlZAoyIHBhZ2Ugd3JpdGUgc3BlZWQgaXMgMTAwMiBLaUIv
cwp0ZXN0aW5nIDIgcGFnZSByZWFkIHNwZWVkCjIgcGFnZSByZWFkIHNwZWVkIGlzIDE1NTQgS2lC
L3MKVGVzdGluZyBlcmFzZSBzcGVlZAplcmFzZSBzcGVlZCBpcyA3NjU2MCBLaUIvcwpUZXN0aW5n
IDJ4IG11bHRpLWJsb2NrIGVyYXNlIHNwZWVkCjJ4IG11bHRpLWJsb2NrIGVyYXNlIHNwZWVkIGlz
IDc0MDE5IEtpQi9zClRlc3RpbmcgNHggbXVsdGktYmxvY2sgZXJhc2Ugc3BlZWQKNHggbXVsdGkt
YmxvY2sgZXJhc2Ugc3BlZWQgaXMgNzQ3NjkgS2lCL3MKVGVzdGluZyA4eCBtdWx0aS1ibG9jayBl
cmFzZSBzcGVlZAo4eCBtdWx0aS1ibG9jayBlcmFzZSBzcGVlZCBpcyA3NTE0OSBLaUIvcwpUZXN0
aW5nIDE2eCBtdWx0aS1ibG9jayBlcmFzZSBzcGVlZAoxNnggbXVsdGktYmxvY2sgZXJhc2Ugc3Bl
ZWQgaXMgNzU5MjEgS2lCL3MKVGVzdGluZyAzMnggbXVsdGktYmxvY2sgZXJhc2Ugc3BlZWQKMzJ4
IG11bHRpLWJsb2NrIGVyYXNlIHNwZWVkIGlzIDc1OTIxIEtpQi9zClRlc3RpbmcgNjR4IG11bHRp
LWJsb2NrIGVyYXNlIHNwZWVkCjY0eCBtdWx0aS1ibG9jayBlcmFzZSBzcGVlZCBpcyA3NTkyMSBL
aUIvcwpmaW5pc2hlZAoKVGhlIHRocm91Z2hwdXQgb2YgdGhlIGZvcm1lciBpcyB0d2ljZSB0aGF0
IG9mIHRoZSBsYXR0ZXIuCgo+IFRoZSBtb25vbGl0aGljIHRoaW5nIHdhcyBub3Qgc3VwcG9zZWQg
dG8gaW1wcm92ZSB0aHJvdWdocHV0IGJ1dCB0byBoZWxwCj4gd2l0aCB2ZXJ5IGxpbWl0ZWQgY29u
dHJvbGxlcnMuCj4KPiBUaGFua3MsCj4gTWlxdcOobAoKCgotLSAKQmVzdCByZWdhcmRzLAoKS2Vn
dWFuZyBaaGFuZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
