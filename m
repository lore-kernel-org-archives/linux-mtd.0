Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AF6C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Apr 2022 05:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1dkaTtuju5mrRtf37z/MGb6nhHwmI0NKAs3NhZsgnXw=; b=4kW4YbpnJwQjYc
	nMLYTRQzskJ5u0c/vsoPjVyw7QBF8PmGOy3shdRdl7Upkm+ULaZ+keTM8p1PKnIXtSJCElYn1crAu
	QtD/hiN+COgoyO9+w5F/EPy/rMxvHiapjvikYY/3Z7e4O9oOPZze/vzNp7UGZTQ+xPNrFFXLDiW42
	d59MUG61ni8q/pDdDNNobjTE2taDc4yAmkE+q5rywPswRR16FDtYxCuYHBHjOVVxGjpay/yfJZQ1T
	AiYIxCgdBAz/vneUF7sfpfs4bqbfbmpLgIYwzONT3+Lnz01qwtA6vMOQld/dnQ6VMcTC3pgIIWmYg
	FiZfDuG1cL+xo+XEPAbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neVEY-00Gnpn-OA; Wed, 13 Apr 2022 05:08:02 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neVEW-00Gnnp-85
 for linux-mtd@lists.infradead.org; Wed, 13 Apr 2022 05:08:01 +0000
Received: by mail-ot1-x32e.google.com with SMTP id
 y3-20020a056830070300b005cd9c4d03feso473556ots.3
 for <linux-mtd@lists.infradead.org>; Tue, 12 Apr 2022 22:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6wkFRWELvsWb3/zmRGR+hVLRqoZs+C5DWbC/pH40T+c=;
 b=ddebltwDJ4OBZiB316V4l/Sft48li0+vcOSQqUlpq0VN+Spu2CTs8ctEiuijCr7aQT
 FG95zd8jZE/76mVDfeCD9HQYCwgVkSFL/jf9/9SDxVGa23EKxRJKZx15yfQMEwE0Rvmm
 IvqZWI7D7fUj9i1dK1WdDGwzqvPFODOO5sM8sSeASZu4LW5deq+VGJvjjRvkzHyZEv0H
 xb7oIOgn5/Za7RnQ5zu8nH28rLtWE78X0vAsq48JUnGFj6Iw9CB2Fd7XwnNOtTmHhFAu
 CrKFENCBl7JgPiGUvjQy9Wv2yXBCXYrfe+EMaG43hukD71DdfDGAmhdPqvYNu+K0Ax6n
 rxpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6wkFRWELvsWb3/zmRGR+hVLRqoZs+C5DWbC/pH40T+c=;
 b=61bCW1y9/8c344Rfje9V5Dd+qxX/3nOobPoEdSUnFENgbJ9c2klGyeu6ctrIXXWh0F
 0YMG6TDTDL+GnCAXuNgQbB2Q97VOiIclXN6vlnxDi4QlxxvsGF1rGIBSFm0hCcvDO2yd
 GMqSpJ/VeJwcPIwxWYrG/Axz+fJeF5xXL9Noum4URpL1hDLYi3DgcnTrljqk+l6MLJ6o
 bgsS9DtgTx7hh9olasu68zc7gfa+qluA509sIOQ+T087ru8D90nY0+aSGwbjFkSLMJuj
 ubSw9DJfy+m4qVqrNKM0aLeUd0zmz3v1R1IZy6jUG/IK0c+YlLNYkWZ+VQhthfeGt2nj
 9B1Q==
X-Gm-Message-State: AOAM5335Xfq2w8ho8v+gUs7rjjidPCXIIMLtlprtSIzaNJVVYfUZJvs0
 xx7PsFAP9EysY/ZgFwPNBtZit/ZE5UG0qc7UhjgzV+Ctc9k=
X-Google-Smtp-Source: ABdhPJwavmFyzQCJbFIxY6NjHt5CGoqBUtKzP1PX1uyMqOI905uTazSCflgqb1/xaMUdxJkG5dd31pX42gbSnEOrf+Y=
X-Received: by 2002:a05:6830:2b0d:b0:5cd:aca2:f3f2 with SMTP id
 l13-20020a0568302b0d00b005cdaca2f3f2mr14329027otv.212.1649826463891; Tue, 12
 Apr 2022 22:07:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220413042337.160263-1-gch981213@gmail.com>
In-Reply-To: <20220413042337.160263-1-gch981213@gmail.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Wed, 13 Apr 2022 13:07:32 +0800
Message-ID: <CAJsYDV++V0HCNqM-GnpBBwDjwBSfgw8ZO56wDwD3iMPJ4joSvg@mail.gmail.com>
Subject: Re: [PATCH] mtd: spinand: add support for ESMT F50x1G41LB
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Daniel Palmer <daniel@0x0f.com>, open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_220800_315734_ABCABBB7 
X-CRM114-Status: GOOD (  13.55  )
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

On Wed, Apr 13, 2022 at 12:23 PM Chuanhong Guo <gch981213@gmail.com> wrote:
>
> This patch adds support for ESMT F50L1G41LB and F50D1G41LB.
> It seems that ESMT likes to use random JEDEC ID from other vendors.
> Their 1G chips uses 0xc8 from GigaDevice and 2G/4G chips uses 0x2c from
> Micron. For this reason, the ESMT entry is named esmt_c8 with explicit
> JEDEC ID in variable name.
>
> Datasheets:
> https://www.esmt.com.tw/upload/pdf/ESMT/datasheets/F50L1G41LB(2M).pdf
> https://www.esmt.com.tw/upload/pdf/ESMT/datasheets/F50D1G41LB(2M).pdf
>
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> [...]
> +static const struct spinand_info esmt_c8_spinand_table[] = {
> +       SPINAND_INFO("F50L1G41LB",
> +                    SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0x01, 0x7f,
> +                               0x7f, 0x7f),

This patch is broken. SPI NAND core doesn't support 5-byte ID atm.

-- 
Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
