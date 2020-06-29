Return-Path: <SRS0=cYNo=AK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B22B0C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2020 14:56:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EFDC23E24
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2020 14:56:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2NYD+FiO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mlPzbSGV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EFDC23E24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7rGtSrw3yCdfzqryEK1Z02AMm768yXBSR6TmBPt/tAw=; b=2NYD+FiOr026G9a00/gNtORim
	UQbM4/9qEsBskLCMof8crA2eT0qX0XCqdPLt3RS60//G3GCs2MBK0ptwEG8asZL9iCh73/84Wz1jC
	6VPAHHq21fkHnqQlE9GdmRhYbDapcYxTZvs5kXY7jh7ahfqsDd6oj9UKcNuS8dGcy8me9p/Y5r+Dj
	LzNUM+nGWjeTpENriZf8lLqHh+dwmByzSlbo8cDKPhTXsqEmNjArJ5CQrg4ZuaVHZK+A3J5NW4tgp
	YRzOI8QbfRVVrBcfhYsT9Fqoi3AkHxjF5Tx4SMU1iQzA9sXFGYjV7akeQppp/HcTfyjFrN0r6L13A
	1+BV4/bJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpvAK-0007G8-I8; Mon, 29 Jun 2020 14:53:48 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpvAI-0007Fe-53
 for linux-mtd@lists.infradead.org; Mon, 29 Jun 2020 14:53:47 +0000
Received: by mail-oi1-x244.google.com with SMTP id h17so14618506oie.3
 for <linux-mtd@lists.infradead.org>; Mon, 29 Jun 2020 07:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JVUn54AkLpOfXd3WnHwQybMvZzd49YHmsReesPzQBek=;
 b=mlPzbSGVuQDa6yw0V2B5fbDGgQNKVtTM3SnXiNRaW1fRb50AGtV0AXGtUJlE2/yEdX
 nI51wWK2J3oPDYyMkOIjx0bvtd09mJUAk8fEjcYCUedYzQEh1ajfbty5WVjX0xkycdl/
 Znct2lTioP9TIgZ7jAh6hD74DRLCyqJP+9ZlKsiSme+Cd/hJk8dB602QkrOUMjoAyt5Z
 5EAauj6bwRoHKwQeF7OPSdXO1ezUAQJt/oE3n51lRvHVvG/8Mt1P55eXkdioqw2I2Fd9
 s7EujhnhlxdB0QG3usWZ0SVk2YWJUmrc+2DqlbWkrlrIzBpM732iyrJ+uP3glud6+Jj2
 sfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JVUn54AkLpOfXd3WnHwQybMvZzd49YHmsReesPzQBek=;
 b=FnGldThx1Jb3vlDXg9EKTZidvEMImHKMuKVNSfHl0rnI3vr5BE7nz8T22eQfthBZex
 3rxvgq+O6f9yEoyfCcpmFs0nFsIlYz3KbFg+Pc/0aXCmDo1NRK7ICnmrqc5s+B0yO70Z
 SAc8Vfv8kg3qUzAHY/JmZaajcxRNgNj56CaqeTkPhHfhc9BlqdNLvnr/IZCkqb/v0v0y
 wOJEwAAOjvNkP6pAXZGoSf/ptn+NdxEjiRtB/mKUc8906rjDagukfnwyoks+2OAvqJtd
 2yrgOL4ByCivHqdXAzFqS9XWf3XiXOu5U1wrpfOjRoZ+A9ZXiG04XlRgVGs/EK9SsI/l
 TRvg==
X-Gm-Message-State: AOAM530UxvauxozwH9LPhX+Xmab57NR7zs2YRVxxEtiuSpOlxPFVAZWX
 sMul0WjiFZM425hRUz4BFemEV7rr2jQlvsreJ6o=
X-Google-Smtp-Source: ABdhPJw60ZZBJdZUuxN9zH9rQ9z3UTCisMhdH6nKsnHlJZbbZ4w7KBbIY9gmfBRG1mz9+OQXYjGqlvsGKM1Er0W4OBk=
X-Received: by 2002:a05:6808:194:: with SMTP id
 w20mr12426052oic.77.1593442424173; 
 Mon, 29 Jun 2020 07:53:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200613235331.24678-1-TheSven73@gmail.com>
 <4b0f2a2d-66be-4cdd-8384-a80f6b729d74@microchip.com>
In-Reply-To: <4b0f2a2d-66be-4cdd-8384-a80f6b729d74@microchip.com>
From: Sven Van Asbroeck <thesven73@gmail.com>
Date: Mon, 29 Jun 2020 10:53:33 -0400
Message-ID: <CAGngYiUFh8XexBZK1U2bHcsvHS2LFAXONgLG7HhY7CDQ=LayWg@mail.gmail.com>
Subject: Re: [PATCH v1] mtd: spi-nor: Add support for Winbond w25q64jv spi
 flash
To: Tudor Ambarus <Tudor.Ambarus@microchip.com>
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
 Vignesh Raghavendra <vigneshr@ti.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor,

On Mon, Jun 29, 2020 at 8:50 AM <Tudor.Ambarus@microchip.com> wrote:
>
> I'm reading the following datasheet:
> https://www.winbond.com/resource-files/w25q64jv%20revj%2003272018%20plus.pdf
>
> w25q64jvm (0xef7017) comes with QE bit set to a 0 state, but can be
> set to 1, so Quad mode can be supported. Would you please set SPI_NOR_DUAL_READ
> and SPI_NOR_QUAD_READ flags and test and see if Quad works? If all good,
> please specify in the commit message with which controller you did the tests.
>

Good point !

Unfortunately I'm using the spi controller on an imx6 ("fsl,imx51-ecspi") which
does not support dual or quad mode. So I cannot possibly test this :)

How would you like to proceed? Should I keep this as a private patch, and
wait until someone comes along who can test this on more capable
controller h/w ?

Or should I re-spin the patch without the flags?

Cheers,
Sven

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
