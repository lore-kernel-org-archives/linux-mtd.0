Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580ABC0015E
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Aug 2023 09:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ly42DJ2oKFbSupA306xT9gRDzaPcZMNdW7HPs7aV6wM=; b=ZXImbUPjlTiBuh
	QS0a+n+8PFOOEIKywFJW4+eghxo6VEFIDLp+mZhNQiq1NGDAYZbErDk7YFh5j4WAuJlJWgO9GDXP1
	iMmn5iFuMVreZUw9kyyTIChLeL88rqS+wK0Z+OQidcooE5VTJGwJpdYW1vxkV7ao/K7IaseEbMb00
	CqiwxyW33xrOzGQN18SbBPFZohaUm92zGgGJyq4/uz0APVzLdvd49WWoG7G98iNps3xURjUSXLLIb
	IW6/7mkRHnZlCU3zDQiy4JhAld+Xtj2QTI7hUqfY8EZa/JTiRh2VMhJOzQ5t6gcJDHAK1yon0tqZ/
	CEUmfZkCwqAJRrrB57Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUO3z-009uyf-0o;
	Fri, 11 Aug 2023 09:04:07 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUO3v-009uxr-3A
	for linux-mtd@lists.infradead.org;
	Fri, 11 Aug 2023 09:04:05 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2680eee423aso1043254a91.2
        for <linux-mtd@lists.infradead.org>; Fri, 11 Aug 2023 02:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691744642; x=1692349442;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=isEPAFgivEnAiLFFt6Rkk2Wx8iOejKsNRIbvWjKBcVg=;
        b=jSBMg4fzsADCLVQMkOT0x4n9PYW1dqduGwCwrds77tLb53GycqlgdOzL7w5B7g/gPJ
         4v/wtAz4C5MADZ/BlO9gFpfYE25nN/ZW/793h06H3YKQMgYVm7nmA4yNwuHHJ16yv0Np
         uK6g7YT4tdklkT5DRsjyEJhugRgb0OQj6tviIcklTCZKt7jHKsteN74pOeSzNvYpugVO
         /iud8ANZ9LVzX++ReUCbe+glA8GjVB+hCnnFAjKZa8kYUo0mTScm1ZmXdc4uqcJOm/DJ
         S69NCx/gHJ+6hFsBLLtboltGvgAIKmY0dj8GBctfaCuZDZhDB6lr8AyQ3q9GspcUgxgQ
         DjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691744642; x=1692349442;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=isEPAFgivEnAiLFFt6Rkk2Wx8iOejKsNRIbvWjKBcVg=;
        b=UR7QsSiMIY1nZKWVENCeCfo25Fx6HYO+37TH3xq6gfFjM/VziT4zqs/THCD5SChF9Y
         GN+ONQA0tRIKQwEq+oHR5zMojDYqD7LbAA/+xh8QFw2D+bsL69wOG1eehnIhoZDRGNKr
         /tYZ3Tfpm6hlrWgRIShPUJK2/fOCPTKNJi8GqeILwvkxvp01lDedKBd2wMY3OJI4faR6
         vtjzb9cntG1JbUm8xSZFCW4TP9otkwOPtYa4QRejuoWDHJgGIJIPUYFnIGC3JAYy1q7j
         OmaxEtQtXvoRTrh7wouVIqMiTHtYCqexL5aynDAFaaKtTOdO9vQBBB6F/ivp5nDl1mjU
         3DBw==
X-Gm-Message-State: AOJu0YwWcGr5AAHqCUUFTuCgXrfd5PF7+i4+4+VTU0kMpz7Y9aVwGWR4
	SkGhEDwnf/2dZKt88o3lmoRt2qn6DZ1nGepMm5E=
X-Google-Smtp-Source: AGHT+IHnvQpAExXXIm1gI89uQBrLIrKSGC+VD2/Yd93yTL+egBpfpe3GzlZEQKoFIZTe5nmguFPO1VH2WdtWF+262H0=
X-Received: by 2002:a17:90a:fe4:b0:267:f329:947d with SMTP id
 91-20020a17090a0fe400b00267f329947dmr615937pjz.33.1691744641813; Fri, 11 Aug
 2023 02:04:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230804095409.278419-1-jaimeliao.tw@gmail.com>
 <20230804095409.278419-3-jaimeliao.tw@gmail.com> <70e42ee5e4c5aba05ac896cb94956f25@kernel.org>
 <CAAQoYR=JQVd3iqfCYKjvkbFSGVWJRX1xFni6CsNht9prhuQ1EA@mail.gmail.com> <92234e4c5aca657a966d7c4d9d5f219a@kernel.org>
In-Reply-To: <92234e4c5aca657a966d7c4d9d5f219a@kernel.org>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Fri, 11 Aug 2023 17:03:00 +0800
Message-ID: <CAAQoYRnpGmo4Li5fJoRWq6_C4cF+OdzbuvQKtiGDJL1HcChXvA@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] mtd: spi-nor: core: Hook manufacture by checking
 first byte ID
To: Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org, 
	pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, 
	JaimeLiao <jaimeliao@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_020404_043639_6DC8DB03 
X-CRM114-Status: GOOD (  26.76  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Michael


>
> Hi,
>
> >> This won't work beacuse the manufacturer id is not always
> >> one byte long, think of continuation codes. In fact, as the
> >> flash_info table is of now, we cannot even rely on the
> >> continuation codes, but we have to always check for the
> >> complete id_len, i.e. there is at least one hack where
> >> the id is reversed and the manufacturer is the last byte,
> >> iirc. some oddball cypress mram chip.
> > According JEDEC standard, 1st byte is manufacture ID.
> > I check id table, "cy15x104q" with multi manufacture ID in
> > later bytes by RDID command(9F).
>
> Yes the currently supported cy15x104q is broken.. but nevertheless
> it's there. Also some spansion flashes uses winbond manufacturer
> ids.
Ok, got it.
I have a idea, create a member maybe name .check_vendor in spi_nor_manufacturer.
A example, macronix_check_vendor function for checking this IC whether
belong macronix or not.
Each vendor could create their checking function for ID table didn't
include that ID.
Is it ok?
For general data information from RDID(0x9f) command, I prefer
checking 1st byte.
After checking, gigadevice , eon, esmt and macronix could follow this method.
Some vendor with multiple maf ID still could use this function for
checking vendor.
For some special cases like Spansion and Windbond, I think their
function should based on others like vendor space in SFDP.

>
> > Maybe some old flash didn't follow this but I think it isn't
> > a high percentage.
> > Most of all and new product are follow JEDEC.
>
> Have a look at JEP106 (mine is JEP106BC) and you'll see all the
> manufacturer IDs defined by JEDEC and you'll see that except
> for the first 127, all others are multibyte vendor IDs starting
> with continuation codes.
>
> And it seems that the command RDID 9F is not covered in any
> JEDEC standard. At least I haven't found anything. If you know
> where that command is defined, please let me know.
Sorry, after checking, content of RDID 9F seems not a standard.

>
> >> If you want to get the correct manufacturer for spi-nor-generic,
> >> you should extract it from the SFDP tables. It seems that the
> >> BFPT don't include a manufacturer id, but if there are proprietary
> >> tables, you *might* use that id. I say might, because it only works
> >> with one byte manufacturer ids, no continuation codes... *sigh*
> >
> > Unfortunately, Macronix didn't include proprietary tables in SFDP for
> > octal flashes and as I understanding proprietary table is not a
> > stardard.
> > So that content and address are not identical each vendor, it will need
> > a manufacturer fixups for reading.
>
> Yes thats by definition not a standard, *but* the header with the
> manufacturer id *is* standard.
Got it.
>
> So better include some proprietary tables in your next NOR flashes ;)
In my opinion, this may not a good way because of SFDP is growing up
then proprietary tables may have conflict address in the future.
So that Macronix octal flashes didn't include it now.

>
> -michael

Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
