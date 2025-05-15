Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABD7C2D0CD
	for <linux-mtd@archiver.kernel.org>; Thu, 15 May 2025 05:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fKZDQXILJKKDCqbwjd0tA4pkdTCEidSsuYryshyY4z0=; b=oAr1Z86om1kZO+
	5ZWSh1gRvcknd7huO9jcCUhNUgF5bFOWKHTnq1oFOMOVTHSq+UUPAKkvZHy2sT6x5eCEvTpt6ndN8
	oADzh64lXvgnTOTH9Y1edOnjS5GHnzFoxmsPnBy+BDoWLSmG48RMOngM9P0G60oyh9V/IyzQ+oTJo
	stwLgPHwugGlK353K4PgMw5b8nudApVvsLDaY0HhHqhJVIJBHVFjuGnsSUMNn6YTUBYeFrUcn9F+O
	QY6V5pf5YW5uJOL7PzqN8GBCz/kMEk8b5ZaBKUTnFtAXh7y+CLfkxYaSv2OYIkX9h2ycP3Xx+qyfx
	Q9eD5plc6gjsxdGDLe9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFRFz-0000000H3jG-28AP;
	Thu, 15 May 2025 05:35:47 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFRD1-0000000H3TU-35e0
	for linux-mtd@lists.infradead.org;
	Thu, 15 May 2025 05:32:45 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22e19c71070so695685ad.3
        for <linux-mtd@lists.infradead.org>; Wed, 14 May 2025 22:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747287162; x=1747891962; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nL/AwWb0UIVn64Fvbx3EViIj2Wlcd9QM/9GrTWRiGjg=;
        b=CY2G8RnUXhHOix8r3qCEFVIDilnaErMLTz10CFSZoTwXRrPLyEi2wbtgZ+gnyXRP+f
         3Zf5u0bmU+VpXG+JkfMYlQy7THZKHhtpf3FHOqF5fgysLyKQKax72I/KPj/+WD6TuPaC
         86xW+O4ewp2ad9GEfYD4qgxLzJKXMc3FDv+3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747287162; x=1747891962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nL/AwWb0UIVn64Fvbx3EViIj2Wlcd9QM/9GrTWRiGjg=;
        b=l3jqjZUQ3GxEXhwekPlT/aENLXH8nGvHOtVew4WaUHdEy5J//8U5xIy6GIWNJfbpfe
         zmEEmDMHxnIeu6RQu3V+knLlSA4Q9CRKL/6vMYtXB7aQGOQpJ2e0KBqg37pI4d2oV9DM
         HBu5WXgsfLSo3MyMpy/2Hnucr//q3Ax1Icz9R9ir77I5/MEkIiop6KW+rZecEpmLQ67a
         CD43T7gd+XJRZLy02Y8fOHgJm+/EUY4W9sMdwR0aigMnSqKBfXDD9eXwGHlxOn9l3R7D
         Wy/Qk14a+B75/8kqJB5E8kE+ixNbS2oWD5+Qv5MvSb/BLEp6XDuWpMfCd1SoFyouXAir
         tqPQ==
X-Gm-Message-State: AOJu0Yy5lwwE1kDqWHIwoLOp1Fwqct1Hqbs/DAd3bgA/AbDDqj2lhMIA
	wGQKlQF2iC0o4OHRw6ix9Td2gjJlDhC33gJGvzIBvtQfQKblz9YMGu/TVUxIXEUusQGDl8NpzKY
	sNrsF2pSOTg6KwqcO7f8MAOxi6Yz6POB3abfQ
X-Gm-Gg: ASbGncvyBLxiOUCB6bGNLxA0m+y5ToaCypYqUNjHvtowEjib3+clRIkdeNjxnIGO3Pm
	bFCgWULwymbHAk0OwcsSTT2skznwOPLk5PKzW1qf4O7JIn1qI3B6m+K+uMcLjReCczZEo53ooHL
	rcHKWobKPXkBGBOsGUTgW1kM2hZKsmp9wPgA==
X-Google-Smtp-Source: AGHT+IHjXkpLBXt/bMjg33+WVFUaSd/5/LoxdlrGFWxzaSd7+0wnULTfmZFBOauHFUUZpvdpHd7H5RsAXugeCLqIBsQ=
X-Received: by 2002:a17:903:1a6f:b0:224:1001:6777 with SMTP id
 d9443c01a7336-231980e406fmr34818825ad.4.1747287162486; Wed, 14 May 2025
 22:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250515050759.1016697-1-noltari@gmail.com>
In-Reply-To: <20250515050759.1016697-1-noltari@gmail.com>
From: David Regan <dregan@broadcom.com>
Date: Wed, 14 May 2025 22:32:31 -0700
X-Gm-Features: AX0GCFuBzuM5yglHwu4fr8itEusd5BhutkEYpX6HMBXs1GZE0IJlKKeEKb2lfPc
Message-ID: <CAA_RMS5ntpk6Lhqgv5OD5HQQ2X3bnaZCC64+ZuDHivLA6VBw=A@mail.gmail.com>
Subject: Re: [PATCH v4] mtd: rawnand: brcmnand: legacy exec_op implementation
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Regan <dregan@broadcom.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, bcm-kernel-feedback-list@broadcom.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>, rafal@milecki.pl, 
	computersforpeace@gmail.com, Kamal Dasu <kamal.dasu@broadcom.com>, 
	Dan Beygelman <dan.beygelman@broadcom.com>, William Zhang <william.zhang@broadcom.com>, 
	frieder.schrempf@kontron.de, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>, kdasu.kdev@gmail.com, 
	JaimeLiao <jaimeliao.tw@gmail.com>, Adam Borowski <kilobyte@angband.pl>, jonas.gorski@gmail.com, 
	dgcbueu@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_223243_810938_EBD2A0C4 
X-CRM114-Status: UNSURE (   8.86  )
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

T24gV2VkLCBNYXkgMTQsIDIwMjUgYXQgMTA6MDjigK9QTSDDgWx2YXJvIEZlcm7DoW5kZXogUm9q
YXMKPG5vbHRhcmlAZ21haWwuY29tPiB3cm90ZToKPgo+IENvbW1pdCAzYzgyNjBjZTc2NjMgKCJt
dGQ6IHJhd25hbmQ6IGJyY21uYW5kOiBleGVjX29wIGltcGxlbWVudGF0aW9uIikKPiByZW1vdmVk
IGxlZ2FjeSBpbnRlcmZhY2UgZnVuY3Rpb25zLCBicmVha2luZyA8IHY1LjAgY29udHJvbGxlcnMg
c3VwcG9ydC4KPiBJbiBvcmRlciB0byBmaXggb2xkZXIgY29udHJvbGxlcnMgd2UgbmVlZCB0byBh
ZGQgYW4gYWx0ZXJuYXRpdmUgZXhlY19vcAo+IGltcGxlbWVudGF0aW9uIHdoaWNoIGRvZXNuJ3Qg
cmVseSBvbiBsb3cgbGV2ZWwgcmVnaXN0ZXJzLgo+Cj4gRml4ZXM6IDNjODI2MGNlNzY2MyAoIm10
ZDogcmF3bmFuZDogYnJjbW5hbmQ6IGV4ZWNfb3AgaW1wbGVtZW50YXRpb24iKQo+IFNpZ25lZC1v
ZmYtYnk6IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+CgpUaGFu
ayB5b3Ugw4FsdmFybwoKUmV2aWV3ZWQtYnk6IERhdmlkIFJlZ2FuIDxkcmVnYW5AYnJvYWRjb20u
Y29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
