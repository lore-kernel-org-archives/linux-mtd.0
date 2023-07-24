Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EAC5C001B0
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jul 2023 12:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zoE7id+woTLNEA/jD2U82QcCrnQKe/pY9gxnnD5vS18=; b=K5asjEjzZieZWSekrp926lmarT
	peRaRn6tEiItjH5u0kveqTQkU/b4uReOXUgHU1DFDx9FbHvTjYorAi8RemnquhnuKcqUq5juNEpVA
	XZuB8Tl3ZV8PurzhAFyb1LeNVQhVpbaahp3PVQ60SaeH5QsgRH2ivk/JSsokockZVZnpRizlFP8fZ
	cK8AEktH2A4y/n+hajL+35sjb61LjYyVYMLfApnDuhs6ah+jXo37LgEfmnmNYf7Tom1cnKnhvfTP+
	d2ACmyz2g83h79ZKHDGsVKR+lu0wmz9KGJhfgFj9diDig5qG3BXnauCUYRcjWlP6D3/SP7qW5JfVx
	rVoLhqZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNuu8-004GHG-0h;
	Mon, 24 Jul 2023 12:43:12 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNuu4-004GF6-1f
	for linux-mtd@lists.infradead.org;
	Mon, 24 Jul 2023 12:43:10 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:e908:444e:5a23:b79e])
	by baptiste.telenet-ops.be with bizsmtp
	id R0j22A00H26vpYY010j2rR; Mon, 24 Jul 2023 14:43:02 +0200
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qNuty-002O66-6f;
	Mon, 24 Jul 2023 14:43:02 +0200
Date: Mon, 24 Jul 2023 14:43:02 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-kernel@vger.kernel.org
cc: Kees Cook <keescook@chromium.org>, 
    "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
    linux-hardening@vger.kernel.org, linux-wireless@vger.kernel.org, 
    linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org, 
    linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org
Subject: Re: Build regressions/improvements in v6.5-rc3
In-Reply-To: <20230724122626.1701631-1-geert@linux-m68k.org>
Message-ID: <88f83d73-781d-bdc-126-aa629cb368c@linux-m68k.org>
References: <CAHk-=wi4Yau-3Bsv2rXYmtXMTLaj3=Wyf4cdM6d89czFvkVsRQ@mail.gmail.com> <20230724122626.1701631-1-geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_054308_721529_9890F7E3 
X-CRM114-Status: GOOD (  13.52  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 24 Jul 2023, Geert Uytterhoeven wrote:
> JFYI, when comparing v6.5-rc3[1] to v6.5-rc2[3], the summaries are:
>  - build errors: +5/-0

   + /kisskb/src/include/linux/fortify-string.h: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]:  => 583:25, 493:25

mips-gcc13/mips-allmodconfig

Full context:

     In function 'fortify_memset_chk',
 	inlined from 'memset_io' at /kisskb/src/arch/mips/include/asm/io.h:486:2,
 	inlined from 'build_auth_frame' at /kisskb/src/drivers/net/wireless/legacy/ray_cs.c:2697:2:
     /kisskb/src/include/linux/fortify-string.h:493:25: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]
       493 |                         __write_overflow_field(p_size_field, size);
 	  |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     In function 'fortify_memcpy_chk',
 	inlined from 'memcpy_toio' at /kisskb/src/arch/mips/include/asm/io.h:494:2,
 	inlined from 'translate_frame' at /kisskb/src/drivers/net/wireless/legacy/ray_cs.c:955:3,
 	inlined from 'ray_hw_xmit.constprop' at /kisskb/src/drivers/net/wireless/legacy/ray_cs.c:912:12:
     /kisskb/src/include/linux/fortify-string.h:583:25: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]
       583 |                         __write_overflow_field(p_size_field, size);
 	  |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Single-element flexible array abuse in drivers/net/wireless/legacy/rayctl.h:tx_msg.var

   + error: modpost: ".L856" [drivers/mtd/nand/raw/nand.ko] undefined!:  => N/A

parisc-gcc13/parisc-allmodconfig

   + {standard input}: Error: Missing symbol name in directive:  => 1096
   + {standard input}: Error: unrecognized symbol type "":  => 1096

sh4-gcc12/sh-allmodconfig (ICE)

   + {standard input}: Error: unknown opcode:  => 1091

sh4-gcc13/sh-allmodconfig (ICE)

> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/6eaae198076080886b9e7d57f4ae06fa782f90ef/ (all 235 configs)
> [3] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/fdf0eaf11452d72945af31804e2a1048ee1b574c/ (161 out of 235 configs)

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
