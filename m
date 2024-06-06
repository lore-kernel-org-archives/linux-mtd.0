Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0F5C27C52
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2024 19:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=h54AECPbHF72THiomk0oKpReVwqmZwXkRVCd8yP6pD8=; b=2L+
	g+bA2d3gGTP0hrWALbOBj4yZbHJT6fmgHJES675zQebPWrTmOv/RHwEMS6zqlKBaT+CpzTmiWZaSC
	D0xhxwc/jLUYzPz/hcOnvzhFIhkS92LcfpOspWbTf0DxtKdTlMRycA99i/n3+nk7VtgkIes8J553t
	kwwCqWjIkytQIAfR6RoWLsdT7t6VGnCQbj4IjJ260x+W0S9kwSsgcB8ksdnlHRz/RZVK/M36hV2qR
	Idy8Uk3qdnUjq0YcQk0ppEeRyGugIuesEIryk5NK69Ap+Zbtnjh4v9lfNPU8w36oyFzzfW9ivOMji
	+lF6L54pwLaWFOBCxmTI43/yeWWAUkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFJ8d-0000000BAwi-1v2Z;
	Thu, 06 Jun 2024 19:51:07 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFJ8Z-0000000BAwF-2VmN
	for linux-mtd@lists.infradead.org;
	Thu, 06 Jun 2024 19:51:05 +0000
Received: by mail-ot1-x342.google.com with SMTP id 46e09a7af769-6f9502c5145so593371a34.2
        for <linux-mtd@lists.infradead.org>; Thu, 06 Jun 2024 12:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717703462; x=1718308262; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G+IQiEXPGWggx239ORo2MfNneGiE41+MmDI9EPcF97Q=;
        b=YzNks3oFPztJsxmRB4k4h72emzVRmgk2qwZ1ODKUkaAZyRS6hi6+dDziNzDp0S5O0k
         ubgUjtBx7mFNL0cAn8+dosRcd8WvKYZ2uEVIaYstMs3omiPpoE+VqX7BJb3daZERq9Cs
         jGXbTmpeu3F+wo+fb1madLy4E1/9vp26sWBpoHwve10DFO5Q1lG1C7A5ShXOToV6CY6R
         PSlppnIlSmJiKlI5SVCbiW+1O6RZccGTR4hYDSoNO1RxAMCkXBulQsRPb5C3z9yU/6Ph
         cRAn6m1hh7ItRe9naPLQceaQ3EUjD5SlrSUHXUZamUX4RvoTh4Mj9zlQ840UOm0otjo4
         luNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717703462; x=1718308262;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G+IQiEXPGWggx239ORo2MfNneGiE41+MmDI9EPcF97Q=;
        b=I5ag4zlgQ7WR4SGevLq/YX0ENiiPBgAewu06KyNYXqxbKlCK0OyhW0JWB/FNcDUmAe
         e3tlAKTt0C3V1Sm9pS7+GqeMMUcny6m0XlcDihKnXfOJMFkQ4ryJuVocYBlkFcppuVWO
         KN0zwDc82TXi6dy3BU7RS6V3+V/0IUs+gdQPsKxzR6X8RCo3Zll0MTZ1fPR8tJ7cWGub
         p1plDu9IHwaFkDiNU66y3Vjhl5SKD8lRay9SSmXMcDGHpoP7Irur8HkNL5FIBFzN0d7g
         LPkBX08y4eamnVwm0AFj2KM8RqkHUVhg4D5+XnPrrl8pCuIRgE2tFw7DmR3tHw8oN+G6
         KOpQ==
X-Gm-Message-State: AOJu0YzyX1fNop4nOu9S6hS8NlEbwVQLoWlOXvcx3Q35tW9W7AE0wTe6
	+aABT8yog3Zc336IeQVpv+vuafzb7dcY3Dvtk7EkFUtb8LvVz+CzraAPqo7b4o8YEY11XAbBNYi
	RRBcVbpCNl/6+Re1izRCj102DbzGMTB4VLl0c+mji
X-Google-Smtp-Source: AGHT+IENjO8FXRzwW4OIfzFp91BztnW2ZMtfl4RALCSgELVPQmTm3eMthm+zbg03lz0mCO8B96ttTKOJlYdbI5btSPU=
X-Received: by 2002:a05:6358:7183:b0:19e:e493:68e with SMTP id
 e5c5f4694b2df-19f1ff9fbf7mr74556555d.29.1717703461859; Thu, 06 Jun 2024
 12:51:01 -0700 (PDT)
MIME-Version: 1.0
From: e9hack <e9hack@gmail.com>
Date: Thu, 6 Jun 2024 21:50:54 +0200
Message-ID: <CALxbwRo_-9CaJmt7r7ELgu+vOcgk=xZcGHobnKf=oT2=u4d4aA@mail.gmail.com>
Subject: Definition for flash w25q128 is wrong
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_125103_683124_9C00905C 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

I'm using a TP-LINK WDR3600 with a bigger flash. Since some time the
router hangs in an endless boot loop. I see the following message:

...
[    0.402716] spi-nor spi0.0: BFPT parsing failed. Please consider
using SPI_NOR_SKIP_SFDP when declaring the flash
[    0.413217] spi-nor: probe of spi0.0 failed with error -22
...
[    0.926180] /dev/root: Can't open blockdev
[    0.930427] VFS: Cannot open root device "(null)" or
unknown-block(0,0): error -6
[    0.938037] Please append a correct "root=" boot option; here are
the available partitions:
[    0.946520] Kernel panic - not syncing: VFS: Unable to mount root
fs on unknown-block(0,0)
[    0.954914] Rebooting in 1 seconds..

It looks like the definition for the flash is wrong:

--- a/drivers/mtd/spi-nor/winbond.
c     2024-03-15 19:27:50.000000000 +0100
+++ b/drivers/mtd/spi-nor/winbond.c     2024-04-01 05:59:17.166780732 +0200
@@ -120,8 +120,8 @@ static const struct flash_info winbond_n
                NO_SFDP_FLAGS(SECT_4K) },
        { "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16)
                NO_SFDP_FLAGS(SECT_4K) },
-       { "w25q128", INFO(0xef4018, 0, 0, 0)
-               PARSE_SFDP
+       { "w25q128", INFO(0xef4018, 0, 64 * 1024, 256)
+               NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
                FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
        { "w25q256", INFO(0xef4019, 0, 64 * 1024, 512)
                NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)

With these changes, the flash will be detected properly. The chip is
marked with:
The chip (SOIC8) is marked with:
winbond
25Q128FVSG
1327

I use another TP-LINK router. This is an Archer C7 v2. It has the same
flash chip with date code 1528. This router doesn't have this issue.

Regards,
Hartmut

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
