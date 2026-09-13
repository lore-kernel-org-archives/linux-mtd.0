Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC57C88E56
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Sep 2026 03:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IjtKXAJrctJM6H24OVlrR/uhJm95sAqvtYAlL3b/3Y4=; b=W3kZf87vvbD0W5
	iRPv6CS8B8ASQD5dPrtym+wBT1pF77mumRj56OSqcfkWRPoRVp4+AlxdUDXKDW5HgGz288tgZIxbD
	9my6WwHPvBZxknhQTcBkKzGjGq2j/cxeEPQFbOHiCjOjxSoGhUqFHIXiP49rgWVGibwa6BmB41sdG
	IIRelg5+qVK7c+IYcglqjX9PPrVhxRKdwCvh5Ov4TALWBZnWP/MEdT/Bf7NGP9FjT86ul2E1ptddo
	/ilW757Bge8kCq7h5Ozvjai5774hIAdHf3GtHTa2TohwAzEg4Np/I93qqpoCz7YgDm0wcGSnqFhme
	4cW1g/1DJEwV8jOUUJVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5aqC-00000001Kys-2kS2;
	Sun, 13 Sep 2026 03:25:16 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5aq8-00000001KyT-1Zc1
	for linux-mtd@lists.infradead.org;
	Sun, 13 Sep 2026 03:25:14 +0000
Received: by mail-yx2-x10.google.com with SMTP id 956f58d0204a3-66e4ab201f9so728026d50.0
        for <linux-mtd@lists.infradead.org>; Sat, 12 Sep 2026 20:25:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789269907; cv=none;
        d=google.com; s=arc-20260327;
        b=m3MZNDtLKvaiN8twQbKRvWekiEU/0oGXeFWv/85V9GN2RqkEqbPisge9Be2W9IFZzy
         Ach5jeNtfnT4E2cPXCZ1i9CZPbZqBRyRMZzaKuZXWajLjE7UsJGu9HwPqD383WYCJAha
         jqITO+fV0HYCsqHfiZGqc+sBwhtj7N8YNdBt+PKkyAQ3E2M5BRdgAPq56HSfHHOXpalY
         6DcJ+zwnl0Ef3VeAdc7nr+qUL7XS1TIoTb++Pgkv1tjveuDSlGVuN/Zd5oe8tx+cOF0k
         4cSBAUG5l2BU8kK+Itb2CBHD1aqmDa8PCCpF7fpmCKLbi/XbNMCQaSac3W4+tqzwElsm
         GjCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6nDNbSvI1oAQW6gb33g8D+mLb9dmbyZqIg94bx2Kv9Y=;
        fh=8uLbL1JEwkm2OrBSxeqmw+s5GuTqabO/4eYXk4an4Yw=;
        b=ILTt+jbUdFy72TSppUtVaNESDL/a+5KigXB5yW0TKVmv1yPM5abgQs+/WZUR+y4Etl
         r0/l7pVYuVe8DZ9wcn5RMeuF9kK+fZYTRdKgP0iJ5JHKHEvnEzgWRcAvRUXlJKIoXq1s
         4CnuTsrA53cliGoD9OX9i4q4lkeTPi9sKp6N2KTYkLcDLcHMZ9pDtbkZYcGsYAtAEy8i
         xCVqKUGPCO33ms0BDqA5WM8fcYwGBqaJTfN+nLRXya1Mz6hxEKOzvGxSKADW8YXceiIM
         498Js5+ku1SiiEgofWtldU5PQjbOvv8cdGHtdvYUNUEQYWzAv3fnV0emqMBIcDz7xDLX
         JT7A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789269907; x=1789874707; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6nDNbSvI1oAQW6gb33g8D+mLb9dmbyZqIg94bx2Kv9Y=;
        b=opb56ohleA5lAsKPaFLtmpzPqk2vc/45m1bRrxea+6RZORczCAM4YJl5OGMuiRz188
         JdToToeR3DvMrT+Av7cylsIAWC1Mxq7cQiZaDi/ywV4DnGGHMlUULkIv5e+eBq3nme8g
         mbY7qWeZmqRWl47b+wxHC+o9ZFutuELqZj6yOS62uA8DJTMALIf9fGGBFOy665mQMnj/
         jJP4lE7V5o38j4DdW51Ae5aAeX7yvj6dZkwjjwJAKE4ics1Xyqibt5i2SxNbrY+pFrvu
         rVWQYdTklRe20kyDPrXiyi04llx5jYAXcIDGd9P3B4WxwD4qiTBSRarevh5nRerm2xBp
         aJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789269907; x=1789874707;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6nDNbSvI1oAQW6gb33g8D+mLb9dmbyZqIg94bx2Kv9Y=;
        b=hrk4ItjBDR4jTZkQfl+cThniz+uMvti8coy+wllCwDVKZc1U9rZsgF+/x+5CF6Qj4R
         dciA/iFavl/U/NRH98iH4y3lqF+CGe559gnXvFPuPeKMoodNsip4u1bhkuri/xLoWZq4
         eBsmDK/c8Q6HeKaEfduWldjy7fDjkOjnsT0YtFY/jS3ZUub0T0sgi0qP4qP9q2lxqC4t
         F+evDq2UfdoGg/2TeKd8JjTN9a/gymEC74iGaTPWk/2H6e3qWmArgjLWtI3jzkhucHHp
         5fWJn3dTVS1Z6fPUGIy1/wIcG+fw+yLB/iwxOaMVuOfs0zG6VrRqEjeJ2O4gzsWVch79
         vBDw==
X-Forwarded-Encrypted: i=1; AKwUvBwbqiAl6XCgOGrquONatTYlcfGsPEXNbxecF41IihcGYwVClMFpX8R7Rzr7yScl+52M9MXpFL0iSss=@lists.infradead.org
X-Gm-Message-State: AFuF++m3SCcJqmmO5UW5LGg6QEsmC8KRQP6ssCdKwJVOr5D3cp62E3y2
	h2sD0KoXCQjq25LE1G2m6QVsV5W5lURKEHVinZCJx7mWBMCmqbaTEruKbYxtt0x3guDgDb6KeC6
	dhzb+lPkdVLWQQ5+6n1gZAdTEPspGw1Q=
X-Gm-Gg: AYBFou3fKlenMeOq4o/c5Akx+JbzM+VeOkrv8k40ch7afeQSYPdb65Np87cpg6ot7Qs
	0g4wBmQEXNU70nB+Yh1/W69L/xxOV+sQKKsTAvfJ0eD6VleA0rFwvaDlNQjcVxlv5kpBq/4plM7
	L8xdMnWg6ca4UfmVO0KqDBNQokNp9C7CSUH1HoEasHbjvywQPqrOqIQ3VHjO+gPq2iDaftJlw3z
	hbMn67aeynKBZTSsJKdXGbLe0yCaWmhg770pCxp4vyh4kvvEdjCQ1wlrSO4weiRtbf8bkzIzd2j
	lv+7PfCTlrEfeohjB951qU8d4Jw3i/ydJqs1y3UG9Zt/xDfUnAT7LvAnxJWMc5qmY6e1ZbmKjP3
	rwpSw75VnwxNjtN57QsFuYDEbeBi1s4nQ4MgvfJUOGy8y
X-Received: by 2002:a05:690e:13cc:b0:671:27d8:d90c with SMTP id
 956f58d0204a3-67127d8da7bmr2600769d50.30.1789269907560; Sat, 12 Sep 2026
 20:25:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260823152648.23136-1-kartikey406@gmail.com> <CADhLXY5uco9Wq8ZmW5UnvGgTrrcLtj+X5Ne+AqaNyyBdKrQ8qg@mail.gmail.com>
 <mty190q3.779eb778-4fb7-41bb-9c12-561cc0980b10@nod.at> <CADhLXY44kq1XamTjXgrfcLc-_HnK3T2b9TVPxjzB4kc0fKdEqQ@mail.gmail.com>
 <mtymovca.dedd95e8-081c-455b-aec6-7abc19484945@nod.at>
In-Reply-To: <mtymovca.dedd95e8-081c-455b-aec6-7abc19484945@nod.at>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sun, 13 Sep 2026 08:54:55 +0530
X-Gm-Features: AcwNN1XiRNbAZtdhi1uNwfykdYWRX_q-o-ZwIZOZBR03b_Yjpbu8sob0aGSORwg
Message-ID: <CADhLXY7otiYPCw+fzzqNWw8P4dPx2xTm+zUeGwc=Lc3tZq=6Fw@mail.gmail.com>
Subject: Re: [PATCH] jffs2: fix double-free of f->target in jffs2_alloc_inode()
To: Richard Weinberger <richard@nod.at>
Cc: dwmw2@infradead.org, kees@kernel.org, viro@zeniv.linux.org.uk, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	syzbot+675e84fdf3dde67b4946@syzkaller.appspotmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_202512_444917_FDA00419 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
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

T24gU2F0LCBTZXAgMTIsIDIwMjYgYXQgMTA6MjfigK9QTSBSaWNoYXJkIFdlaW5iZXJnZXIgPHJp
Y2hhcmRAbm9kLmF0PiB3cm90ZToKPgo+IEFtIFNhdCwgU2VwIDEyLCAyMDI2LCAxMDowMCBzY2hy
aWViIERlZXBhbnNodSBLYXJ0aWtleSA8a2FydGlrZXk0MDZAZ21haWwuY29tPjoKPiA+IE9uIFNh
dCwgU2VwIDEyLCAyMDI2IGF0IDEyOjI44oCvUE0gUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJk
QG5vZC5hdD4gd3JvdGU6Cj4gPiBJIGZlZWwgdGhlIHBhdGNoIHlvdSBhcmUgcG9pbnRpbmcgYXQg
Zml4ZXMgYSBkaWZmZXJlbnQga2luZCBvZiBpc3N1ZSA/Cj4KPiBXZWxsLCBkaWZmZXJlbnQgc3lt
cHRvbXMgb2YgYSBjb21tb24gcm9vdCBjYXVzZS4KPgo+IFRoYW5rcywKPiAvL3JpY2hhcmQKClRv
dGFsbHkgdW5kZXJzdG9vZCB0aGlzLiBCdXQgaXQgaXMgZ29vZCB0byBoYXZlIGEgZGVmZW5zaXZl
IGNoZWNrIHNvIHRoYXQKdGhlcmUgaXMgbm8gZGFuZ2xpbmcgcG9pbnRlci4gSXQgd2lsbCBwcmV2
ZW50IGZ1dHVyZSBbVUFGLCBkb3VibGUgZnJlZSBidWdzXS4KClRoYW5rcwoKRGVlcGFuc2h1Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
