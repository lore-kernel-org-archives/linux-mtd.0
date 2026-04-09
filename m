Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3719CE9DE5F
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Apr 2026 07:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RzsNvRAMuowP46Te6AspKwOyNNoFEtTkHceBjQJgpeE=; b=AID85ZIwXLuirQ
	PuoF1AcZrBFOn8wVKSeZI0fPD3NT6H3uN8bdPl/lvlEOmr/9oSdOmIZZ4BtkVMRin0FhGGNCtNaMX
	77UW61C0e4c9LmkeuPt5lOMvLE1XcFr03Ih7GiDtDtZZtmYNX23XPiWH+eSuB+mcDFD8sgE5Dbqc2
	uaX25PRDncxzPR8xvSHAKNzOIbtYY3JascniDH/9JG/cD44tDO7fU/IQQJBG9a2M6vu6D8GA+eFTk
	sYxGCcjd348leH33vZ/QZTzTSrOLffTKunE7TqMANxiP/yJ4EiZO7U+KnSK/0wb19ZlIFhuW6Ht9G
	islm/nkDchLuCEqzcUBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAkHg-00000009tUm-1Qqi;
	Thu, 09 Apr 2026 07:58:40 +0000
Received: from mailout2.hostsharing.net ([83.223.78.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAkHd-00000009tTF-0S3K
	for linux-mtd@lists.infradead.org;
	Thu, 09 Apr 2026 07:58:39 +0000
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by mailout2.hostsharing.net (Postfix) with ESMTPS id 9C23910594;
	Thu, 09 Apr 2026 09:58:28 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 94086602E9E7; Thu,  9 Apr 2026 09:58:28 +0200 (CEST)
Date: Thu, 9 Apr 2026 09:58:28 +0200
From: Lukas Wunner <lukas@wunner.de>
To: David Laight <david.laight.linux@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 1/1] mtd: cfi_cmdset_0001: Factor out
 do_write_buffer_locked() to reduce stack frame
Message-ID: <addcJP2erqYh8pD2@wunner.de>
References: <20260408211407.2295175-1-andriy.shevchenko@linux.intel.com>
 <20260409082611.73fac9ab@pumpkin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260409082611.73fac9ab@pumpkin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_005837_302509_7BFB82EF 
X-CRM114-Status: GOOD (  14.72  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Apr 09, 2026 at 08:26:11AM +0100, David Laight wrote:
> On Wed,  8 Apr 2026 23:11:48 +0200 Andy Shevchenko <andriy.shevchenko@lin=
ux.intel.com> wrote:
> > Compiler is not happy about used stack frame:
> > =

> > drivers/mtd/chips/cfi_cmdset_0001.c: In function 'do_write_buffer':
> > drivers/mtd/chips/cfi_cmdset_0001.c:1887:1: error: the frame size of 12=
96 bytes is larger than 1280 bytes [-Werror=3Dframe-larger-than=3D]
> > =

> > Fix this by factoring out do_write_buffer_locked().
> =

> Does this just split the large stack frame between two nested functions?
> I'd also expect the compiler to inline do_write_buffer_locked() so it
> makes little difference.
> OTOH I can't immediately see where the large stack frame comes from.

The error occurs for an allmodconfig build on arm, which implies
CONFIG_KASAN_STACK=3Dy and thus increases stack usage vis-=E0-vis a
"regular" build.

Stack usage is high here because of the three "map_word" types,
which can each be up to 256 unsigned longs (32 * 8), see the
definitions of MAX_MAP_LONGS, MAX_MAP_BANKWIDTH, map_word in
include/linux/mtd/map.h.

Possible solutions:

- Disable KASAN entirely for this file:
  https://lore.kernel.org/all/adX3SHYgazijahbG@wunner.de/

  Not always a good option, particularly for stuff like lib/maple_tree.c
  where the same issue exists in mas_wr_spanning_store() and KASAN would
  certainly be good to have for that one.

- Use heap instead of stack.

- Split function in smaller chunks and mark them "noinline".

Thanks,

Lukas

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
