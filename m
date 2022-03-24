Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCEEC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Mar 2022 07:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=HqfczLoNtq5xUEAl2T/nABHH0TVvNIUPVkdlIe0BC5E=; b=pHV
	ND0TWc/iHTnDKTKRWUnu16O/cjrzrYbwneKk5JnQLpnhmqdCc5JLEN5w6HbqjpVVvUv2CEI+sifTy
	vm/ExZQg3n8JzvKEB/d+pnUlq3JWJo6mpJ3ll7OiO7ANKRFp7cNffV4BoFW4pty+xGy9x5kdE1ZHZ
	rD9ZLOlHZarZSAmldTIA9w0f/KD5QEjdVcM4GgQ7+QerfGI3bl2bxoupgbqHcciffsPVFTGqMGmkO
	DqpfpfbJ+48pHnUkwkTbimwG3VCHQvt5XiEzCHOzP1IkA6PwfFp/AY3pbyj/2xR1z+Z2ez1DyWnEz
	KKU246FH8vV7Gs6psuGXsZjOzOqZ3mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXHyC-00FwyE-34; Thu, 24 Mar 2022 07:33:20 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXHy9-00Fwxi-N4
 for linux-mtd@lists.infradead.org; Thu, 24 Mar 2022 07:33:18 +0000
Received: by mail-qk1-x72b.google.com with SMTP id b189so2901079qkf.11
 for <linux-mtd@lists.infradead.org>; Thu, 24 Mar 2022 00:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=hGNqakvYU+2D8MCC5kV9BCv4tRxdCc01pIaAC3OV0Uc=;
 b=RK+cgKAazbrj6XqHVY3R3X3rNwEZCvSsdopvmhuzChayuKqY2L1QtM0cbMhDVM8t0d
 sCATiPflO/UkNSqw6TPlevb0ygijTmZpwloVoTgKPHR8vKLyY8QUdSlIg74/7QnfTDMa
 guX9W8czjMeKulu/GjkBzuHB9NoJIt8VQvgHDxvKGJ++jTJ0XAIEfkwNmX9ERypN8XWD
 YSpgkv5rY+v0GM3y8hkmWswTfabzqYoS2h3MiqSI/u7UXLVELOayVVL3R4W+XD/ffRqM
 xefKpe94adWHSb4e8BE1+AihWnhKtVH99I2+9lbpNOk9Ayj6VLMOY7esKoe7LO3PKC2B
 Jlqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=hGNqakvYU+2D8MCC5kV9BCv4tRxdCc01pIaAC3OV0Uc=;
 b=TXkZVSivfunOVGjGFx2Fer7YlPDPpMfRk3uPLR9MCbG8QXHbkAWwfeyxnz+z7ox306
 oULrdPK7I2C7UZgTjindMR+gnZTv115GsKwXlt8gB2OzH+3Dew2wlRPwF/pvnhqnMPV8
 YZLsPaXaemAPlWDHRa+SMJj3YcZt7tJrQP1IgGrt1/qgo5gA8J1DlUKzEq6izU3OpWe1
 4sORor+8SFvPrzJawMHWdxH38nsonXG0t+4hnMg5GAPhWJGjx5UIjSw0K4Zal73RHOvz
 xd8v8kvYQc4Om50FHJPbx2ApffV+iEbDTkham1g7riqqEi+rm8ddpiRtwdTMOFUIKn99
 XYtA==
X-Gm-Message-State: AOAM531wK22tP+AFZii9clzznr4LCaTzOvwBVfbPIb6WRSmTqjGzHd2O
 UAcL40LCfiIA2DStddjg8U55vx0MKgS9AVpLWAKrmDhXIUk=
X-Google-Smtp-Source: ABdhPJzQX5y3NisEQ+ZsL1ryt+CVfYy1TiH5+giYeITYMcBA8An+qetqAU4gABfv27skHvKlqA+UUy1IbaqRHzE9Wb0=
X-Received: by 2002:a37:6551:0:b0:67b:465f:56b8 with SMTP id
 z78-20020a376551000000b0067b465f56b8mr2522654qkb.414.1648107196580; Thu, 24
 Mar 2022 00:33:16 -0700 (PDT)
MIME-Version: 1.0
From: Mithran B <mithranb22@gmail.com>
Date: Thu, 24 Mar 2022 13:03:05 +0530
Message-ID: <CAEUGTwO2GqWtEy73hKUiwdYWZ2246obdcU8oBJCd1U7Yx4EDOg@mail.gmail.com>
Subject: S25HS512T SPI flash support in kernel-4.9.65
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_003317_771469_51EA7DE4 
X-CRM114-Status: UNSURE (   5.08  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello All,

I have added the below struct as:

{ "s25hs512t",  INFO6(0x342B1A, 0x0F0390, 256 * 1024, 256,
SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },

spi-nor.c file.

Tried to access the 256KB sectors.

mtd_debug write /dev/mtd10 0 316176 file_30KB.txt

Writing is not working.

-Thanks.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
