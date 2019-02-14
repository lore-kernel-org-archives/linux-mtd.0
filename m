Return-Path: <SRS0=oU9n=QV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F11C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Feb 2019 07:31:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1175F2229F
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Feb 2019 07:31:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="itqPCdi9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JoRzQpOT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1175F2229F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DQ4tPV94mQkC8A3eY0t8L2XDa5tG4WTa/YPsq0wnGDk=; b=itqPCdi9T/OAh8
	uIzJosCnFWlL7UVX6bs6JnNfa/Tz+WFHtDoE24+v2AsOVuQrW47zquCaRiNw5Nr2Ki09NL4GUI4j2
	wwXAuWwzHY6HhcNyf7YEyx904IkuKeSH7hx7vs02mmHUrfJgntbx8UwGzAlkN6goLKBGWp61kA+Ht
	d+VpnbdnJPo5Vzj3x4QyfsOkscfPxyF9Best9CbAyp8cfsmIIg85Nv1Lqb8Zo/qlKpu5DVAx7Bb1i
	hbhWYjCN+brK5kRNSrx01O4uQVr6Y9Ppm5IUxWupTpik9S3r7zzcHJVDjuA4igc4hqnJ03ObBMGy0
	dYQh8IYeVV1Q2PaWdQkA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guBUs-0002um-GA; Thu, 14 Feb 2019 07:31:50 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guBUp-0002uR-Dx
 for linux-mtd@lists.infradead.org; Thu, 14 Feb 2019 07:31:48 +0000
Received: by mail-wr1-x42a.google.com with SMTP id q1so5260435wrp.7
 for <linux-mtd@lists.infradead.org>; Wed, 13 Feb 2019 23:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gvIH+Pi4M0Lu3k+8QIqpEL18GkjH1Rh6fnn48z3doAg=;
 b=JoRzQpOTY66m/9pPt9Mscm4pNCBnPldKkViE5AI2yAWi1uUipHLvpXN8IGTJ0FYrA9
 qeQEBZYBeYtppmpo5+p0heTnoXfwoad5x80sQilOevfbHrhrFBJJx/ApLtPMYBGbGy45
 zGvzh4m1ajhzeIRynfvXPgaVhAwbKiazgjcVPChzJxvvjjoa717SSt/A0KZ4z01CrhuZ
 aiYKGyDc94llm34Ajv03bejo6v2UOqbvAADu5fHknZXXMkhoxRMHPiRPraitCYHgf2so
 2Q0AbH1hdYp7BeuXXffGobe7cKRMwR3RxlUxKUOwjFUH+i8L0SFXmlAZKR+xRGe3PnCl
 gabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gvIH+Pi4M0Lu3k+8QIqpEL18GkjH1Rh6fnn48z3doAg=;
 b=duA3r8KukP4jDwlpajiDCPa3USzfzj9lX0T6jEgaFZ0V8PJORYRplAby4J8lX1HvAA
 7y4uey4zvAox+gg1xz+zKVxprJSiGmakI8aY6qV3FfeZju3B83y+mRSswAh/fxjQgYS9
 IKX7BCRwWxduSu5hx0JO5B/l6X1SSjfWRJXHvHzMWlfcDo3Z6ys2FfS8cvgLcClNlpNT
 smAvLGCHim1LPCv+DmPwMbHgDRv19ccvyqnJuDxWoM+T7YR0RhkriOWo9DQ1XnS3i+8x
 V69Nn/E4DpeZy6/V0l0T4oGVXixUImurYi9Ziv7cZvWAOHaGg6KuRPVuOTpHzNu4lj4n
 vxUg==
X-Gm-Message-State: AHQUAuZngF7Q5eaKpTanTWfUMHa4IqDtDPMVCDLG4bEKUgCTqZNzl02q
 rcLBgJbActKu3OK2hJd30iDYBk2X/FEExIB+qqo=
X-Google-Smtp-Source: AHgI3IY2qfsJ9Qab3rBxLLaTxv8+D05yOAv17AhFBJvayZ6ubAkSskilLT54H1Q0J53cKxSNtovRANPIVYJvC7S9g0g=
X-Received: by 2002:a05:6000:1044:: with SMTP id
 c4mr1554087wrx.296.1550129505298; 
 Wed, 13 Feb 2019 23:31:45 -0800 (PST)
MIME-Version: 1.0
References: <DM6PR16MB266514008732CC2ECF6C5257B0660@DM6PR16MB2665.namprd16.prod.outlook.com>
 <d24d0b1d-135c-1779-5e4c-db9d20504f3b@sigma-star.at>
 <DM6PR16MB2665DA2D6DCD8FE7B829D572B0670@DM6PR16MB2665.namprd16.prod.outlook.com>
In-Reply-To: <DM6PR16MB2665DA2D6DCD8FE7B829D572B0670@DM6PR16MB2665.namprd16.prod.outlook.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 14 Feb 2019 08:31:33 +0100
Message-ID: <CAFLxGvzeD=zoWWK3tGy8R9=Dkfq+SorMGDn5gNADsHqZmg-2Ow@mail.gmail.com>
Subject: Re: mtd utilities work but ubi utilities do not?
To: Matt Schepers <mschepers@telspandata.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_233147_495585_474D21FF 
X-CRM114-Status: UNSURE (   6.97  )
X-CRM114-Notice: Please train this message.
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Feb 14, 2019 at 4:09 AM Matt Schepers <mschepers@telspandata.com> wrote:
>
> David, thank you for that information. However the following sequence of commands produces an uncorrectable ECC error where I think it shouldn't:
>
> command sequence:
> flash_erase /dev/mtd7 0 2048
> ubiattach -p /dev/mtd7
> ubidetach -p /dev/mtd7
> ubiattach -p /dev/mtd7
>
> dmesg:
> [  362.807750] ubi0 warning: ubi_io_read: error -77 (ECC error) while reading 64 bytes from PEB 2044:0, read only 64 bytes, retry
> [  362.808328] __nand_correct_data: uncorrectable ECC error

Looks more like your NAND driver is buggy.
Maybe subpage support.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
