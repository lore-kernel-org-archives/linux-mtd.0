Return-Path: <SRS0=3GE2=P6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B395C282C3
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 08:02:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7D8E2084C
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 08:02:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OQGdCcpG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="mNt3q0KB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7D8E2084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=emkiQ8NxbTLR/FEvjzCClZSKL0wMOsNnnmcRsDesd5E=; b=OQGdCcpGL2Lr15
	4vR+ffkUgEZlEDoY+FLaGC+UN67ax2ad9H9v31gJ3Ea+mne22AVBucNGeULEFZqLej0KAHr7ZXVh1
	P6nz/Qv8kIDWurkVPOpzs405JOD5GHSaOTDXtK0sOjxMV6HD8MfsaQw2jSg9c2RD9T43v6+xT9a6N
	GRR/TEclqaPbyo9oALZo2gOIx+ziGAB0rcEnwBRkPGXFo9ZxCyM+YHOiR1QHkd0o1jFGSYJrPIeU8
	QZHgLrSX7SvfUwQetwJG2sJ/X2ZsmJO8maKrkoGGTFO/o+AIyf38JDLU3ad6cIx9jp6zld/swf+WU
	bZiA5Qbps745iobKVM/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glr0S-0003Bm-T2; Tue, 22 Jan 2019 08:02:00 +0000
Received: from conssluserg-01.nifty.com ([210.131.2.80])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glr0P-0003At-Rb
 for linux-mtd@lists.infradead.org; Tue, 22 Jan 2019 08:01:59 +0000
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id x0M81V7w009297
 for <linux-mtd@lists.infradead.org>; Tue, 22 Jan 2019 17:01:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x0M81V7w009297
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1548144092;
 bh=E9edDR1WQ/jfpO6pQ7+TCwEoztR/YTcdual/1f3RrJc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mNt3q0KB2dr3Rnmwg5yoa571kc0efSw5gwAy4+lDtuZs6ZLlbL5GMRyR2q9m7oetN
 6UeDpn7h2sYhC5QsYdX7iuyMUeE7lyiqTQoOkiQQs2GJxckAcDmgtzfBvC61uwdRPL
 NF7C/FKkSuUptoON/pLZ+gt5azxmbDS7i6iW3nkAjz4o/Gv24ot7yq2JWcN5LqORrp
 HqzD0jnjNo6CkLQPKve9gCShU7aiPYoR3bMqUUDeYco377Igh+Vjf0IbEk8PHEnW5h
 MdhdjFjwk01iGEMFNpZMyQE5HVfdPGTxpverpOsws6VDTBBnBNlBj4djz7QD2B6zkI
 iD98LZKAZSqWw==
X-Nifty-SrcIP: [209.85.217.48]
Received: by mail-vs1-f48.google.com with SMTP id z3so14157584vsf.7
 for <linux-mtd@lists.infradead.org>; Tue, 22 Jan 2019 00:01:31 -0800 (PST)
X-Gm-Message-State: AJcUukccOZlPO/oYZz8462v2EP6iadx39SjF3JPmqreavmYaZLuCuxEH
 u/8AuxZubgiKQLtelUZd8e6q47ROa575Q1SmG/o=
X-Google-Smtp-Source: ALg8bN7u1hvKwS6Djr7qhlyWuQwSx82MWeLiy2pvqllCMHXAzG64fuWy9IspyT8wzkmpgV/8TX36UHxAwWW/sK+GS+M=
X-Received: by 2002:a67:f1c2:: with SMTP id v2mr13583238vsm.181.1548144090409; 
 Tue, 22 Jan 2019 00:01:30 -0800 (PST)
MIME-Version: 1.0
References: <1548142975-14219-1-git-send-email-yamada.masahiro@socionext.com>
 <1548142975-14219-3-git-send-email-yamada.masahiro@socionext.com>
 <20190122084944.420fcd4a@xps13>
In-Reply-To: <20190122084944.420fcd4a@xps13>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 22 Jan 2019 17:00:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQvD03By1PQJ8KZG-UqX+NVQcL6JU-5a-2ZVVovdgBpEQ@mail.gmail.com>
Message-ID: <CAK7LNAQvD03By1PQJ8KZG-UqX+NVQcL6JU-5a-2ZVVovdgBpEQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: rawnand: use unnamed union in struct
 nand_op_parser_pattern_elem
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190122_000158_128300_3E08D744 
X-CRM114-Status: GOOD (  18.08  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Lucas Stach <dev@lynxeye.de>, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Linus Walleij <linus.walleij@linaro.org>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Stefan Agner <stefan@agner.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Marek Vasut <marek.vasut@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, linux-tegra@vger.kernel.org,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Jan 22, 2019 at 4:50 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Hi Masahiro,
>
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote on Tue, 22 Jan
> 2019 16:42:55 +0900:
>
> > Although drivers do not directly get access to the private data of
> > instruction patterns, let's use unnamed union field to be consistent
> > with nand_op_instr.
> >
>
> Actually this is how we wrote it the first time. Then we got robots
> reporting that anonymous unions where not allowed with older (still
> supported) GCC versions and I had to do this:
>
>
> commit c1a72e2dbb4abb90bd408480d7c48ba40cb799ce
> Author: Miquel Raynal <miquel.raynal@free-electrons.com>
> Date:   Fri Jan 19 19:11:27 2018 +0100
>
>     mtd: nand: Fix build issues due to an anonymous union
>
>     GCC-4.4.4 raises errors when assigning a parameter in an anonymous
>     union, leading to this kind of failure:
>
>     drivers/mtd/nand/marvell_nand.c:1936:
>         warning: missing braces around initializer
>         warning: (near initialization for '(anonymous)[1].<anonymous>')
>         error: unknown field 'data' specified in initializer
>         error: unknown field 'addr' specified in initializer
>
>     Work around the situation by naming these unions.
>
>     Fixes: 8878b126df76 ("mtd: nand: add ->exec_op() implementation")
>     Reported-by: Andrew Morton <akpm@linux-foundation.org>
>     Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
>     Tested-by: Andrew Morton <akpm@linux-foundation.org>
>     Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>


Hmm, how come Andrew's compiler was fine with the following?

struct nand_flash_dev {
        char *name;
        union {
                struct {
                        uint8_t mfr_id;
                        uint8_t dev_id;
                };
                uint8_t id[NAND_MAX_ID_LEN];
        };
        unsigned int pagesize;
        ...
};



The current minimum version is GCC 4.6
(commit cafa0010cd51fb7)
but I am not sure if this restriction is remaining.


-- 
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
