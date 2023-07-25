Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB88C001E0
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jul 2023 09:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MtTFxrje/2KktqGLkKYkibxDJzh4QJ5ZULZU418d44U=; b=lgAQthhloZdyHn
	lb/UQDG3KQSJkiDz264uVkw9IhSkSOcrS9rwIAi43p+Oo70PtcJoqQlPgJCQMPehAwdhKOi3Xdp2e
	PEv10/cYc1bFlBfVFRyMMs5AUOCSskcL63QNDB+rQ37douOFW4Ty0lhpQVaJOJaPeNQkvcPANi/lS
	LP4xUXNqyJ/xU+piTtFMLIcMFTgguwHCqhxor7sZaCSn7tsa9yPwUp+FhBwYxafSXZiEM5/zvcv4a
	Z1XUZJ25smSPsjDm3SLaSJSowsBj0nXcu6XvjuTx+rZczMYf+w1HYlL+l0q5UAltPIYGNFX8nktCG
	x5wLh4451nmo8orVzU2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOEg1-00701Q-25;
	Tue, 25 Jul 2023 09:49:57 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOEfy-00700S-16
	for linux-mtd@lists.infradead.org;
	Tue, 25 Jul 2023 09:49:55 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7659cb9c42aso436362685a.3
        for <linux-mtd@lists.infradead.org>; Tue, 25 Jul 2023 02:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690278592; x=1690883392;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5rRTwXGXsw79Zlj6OZIoWXUJu2+rfPoLd6OREnF6lhA=;
        b=QdGFGESkkEz+PfGHT5JeDqkV/InttJRKZiFN2vgiNhoycIsVJwxLLjfP67aQDVHNv3
         azK9VH38MWMw3PC/PTnS/UtvKtXlnko7nyk9j+NKaSv92T9eLSKZcOJJmqVO9ILeEwDL
         svKifumLcvucKmTkgXg0Wqtvq/meqGe8H50ZvvS3je3wWkV6tkNsuZMvf57NgRZ7UgEu
         FPRhItffCJ1wcOq6yt79LpwyU3C+cZ09iH0Zw4Nc0qXStwtbpuA1GYAsowJtBMGTGpjP
         56nKOcgTopzRuHPIXf+U6Iu4F0H9r03nhn8FQa65mzJhUz3rvN65n7cPWDb/jltlX/z1
         ueJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690278592; x=1690883392;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5rRTwXGXsw79Zlj6OZIoWXUJu2+rfPoLd6OREnF6lhA=;
        b=lAcsa02elmw41EBXdXn2V/qAXpOg4dxw4WkGSf+ajaWAGwJTMNb29gSQo4whW+kUDo
         ZA9Di8N71FF/mI3m0ZzMEFQ8WRgDZ7z9bwo5lyou6bM3hKzCsb7LM0LaBXAcKLZ8GRqM
         jVmmOYNKSZ7oDe7wu+b2fC78pK53RXQ5lHlJCGc+EOHUmv4woNzsL4N+iOE1mzdDYp20
         MquOWeuXxkV4d0i8W2W47ImSqIpvO48hdEjA0mFP7nmcWxtBWvN1CyQIvrnbo+fApUW6
         0rxECtljCOGwUKopMTr6Td5lDc8uqOsveI6Gaob/V6cuPE+BEU7xxqaG70Xcy8KosoHj
         PZCQ==
X-Gm-Message-State: ABy/qLYWyPy4T/aQ/kDZZiGDiyz9rKWny/2DUcrXHug2/RFeFg+kT69V
	Mina56pWzfczuVx8c6rYb1dFPxRbiBG5svd6b+Q=
X-Google-Smtp-Source: APBJJlHVG2D0lzfGoourp9uYUPDL/a/mJSJqyzX1vJT715ybzMFb4AumoJJ8mxJOf55Hkkz9od9KclYt2Ot89l5I3tY=
X-Received: by 2002:a05:620a:4728:b0:765:a74d:62b1 with SMTP id
 bs40-20020a05620a472800b00765a74d62b1mr2606000qkb.19.1690278591885; Tue, 25
 Jul 2023 02:49:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230725022302.210275-1-jaimeliao.tw@gmail.com>
 <20230725022302.210275-2-jaimeliao.tw@gmail.com> <0acced240c27dd34cf1348ac4a24dba3@walle.cc>
 <CAAQoYRnfEEtRhVcWXAyokgS1G8fGsMhvUfoe6PcuVBEQ8sW2Hg@mail.gmail.com> <84c5907c5f1b31fd97a4974a702cfabd@walle.cc>
In-Reply-To: <84c5907c5f1b31fd97a4974a702cfabd@walle.cc>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Tue, 25 Jul 2023 17:49:12 +0800
Message-ID: <CAAQoYR=-FOrJs4vaSzm4CO_Ao6v-io97BjCvBCMpjmUcRcxNzA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] mtd: spi-nor: add Octal DTR support for Macronix flash
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org, 
	pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_024954_374471_EF570363 
X-CRM114-Status: GOOD (  26.83  )
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
> >> You write "We" in your next patch. "We" as in macronix? Then please
> >> use your macronix email address for the patches. Please note, you
> >> can still send them through your gmail account.
> > Yes I am Macronix engineer and sorry for the company mail
> > issue so that I can't send and reply patch on Macronix mail.
>
> Thus I was saying that you should use the macronix mail for the
> patch author and the SoB and send your mails with your gmail
> account (git will take care of the difference).
Got it, thanks.

>
> >> While cleaning up the flash_info db I come around this and it is
> >> copied all over the place. Please work on factoring this (also the
> >> other code in micron-st.c and spansion.c) out into a helper.
> > Let me clearify the data order for read ID on Macronix flashes.
> > Read ID
> > SPI mode : c2-84-3c-c2-84-3c
> > OPI DTR mode : c2-c2-84-84-3c-3c
>
> So you are basically duplicating the id bytes in DTR mode. The same
> byte is transferred both on the falling and rising edge of a clock
> cycle. I think this needs further changes to the core. I means that
> if the core will do a rdid in octal mode, it returns "garbage" for
> now.
Do you mean a common function for ID comapre in core.c?

>
> How is the data transferred in octal DTR mode? Reading the same data
> in SPI and octal DTR mode should return the exact same bytes.
For all flashed in this patch, data reading are all same between SPI mode
and octal DTR mode.

>
> So one test would be to use the flash in SPI mode, write some data,
> enable octal DTR mode and read it back and compare it. They must
> match.
>
> > So that I create a specify judement for checking ID via 8D-8D-8D
> > on Macronix flash.
>
> No, please make it a common helper for all flashes.
>
> >> > +     op = (struct spi_mem_op)
> >> > +             SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 1),
> >> > +                        SPI_MEM_OP_ADDR(enable ? 4 : 0, 0, 1),
> >> > +                        SPI_MEM_OP_DUMMY(enable ? 4 : 0, 1),
> >> > +                        SPI_MEM_OP_DATA_IN(SPI_NOR_MAX_ID_LEN, buf, 1));
> >> > +
> >> > +     if (enable)
> >> > +             spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
> >> > +
> >> > +     ret = spi_mem_exec_op(nor->spimem, &op);
> >> > +     if (ret)
> >> > +             return ret;
> >> > +
> >> > +     if (enable) {
> >> > +             for (i = 0; i < nor->info->id_len; i++)
> >> > +                     if (buf[i * 2] != nor->info->id[i])
> >> > +                             return -EINVAL;
> >>
> >> Why is the ID now swapped? Doesn't look right.
> > Actullay 6 bytes data are c2-c2-84-84-3c-3c which are got by 8D-8D-8D
> > read id
> > on Macronix flash.
>
> See above.
>
> -michael

Thank you
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
