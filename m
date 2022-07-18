Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD972CCA479
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Jul 2022 18:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uiyiBDfVcXp8cQKurrQleiXtQ6FEKBqTJ95ErxW/WJg=; b=KbGa3X28zVKagj
	CRkg+u1iDlfc1jXgK5k0kSVcmTOF9/Nu5Rt5vOJbe4I8QxppRfXCtzEY/NSeGo8RJXZj3CC3ndCLW
	TmpsYaSt5ln0o0lDwzLIqqqyCVvWtbez8l73TCwh+0vpuT/pi9kYqCf/zfMUP0Pz2Zy//vIsUQor7
	rr3rW0JlgFGc7OLnezT7V/HIMufkPWD2clwJNUKymQ4iD37JxQKxmO3snICtSHFPuNKY1cuNDOSts
	Qy1yUqCHsCerTMdubUW8x3xiwq5IXkZzvNMej+wfIkCMma0MAyurJ9/F7fnbQcTidAAlAYu6E/7G5
	OUlyhsZvmz2xhrSPSKIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDVoR-0007gq-1q; Mon, 18 Jul 2022 18:49:47 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDVoN-0007eD-MM
	for linux-mtd@lists.infradead.org; Mon, 18 Jul 2022 18:49:45 +0000
Received: by mail-ej1-x635.google.com with SMTP id oy13so22926858ejb.1
        for <linux-mtd@lists.infradead.org>; Mon, 18 Jul 2022 11:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ajZurwdncCAgynNzM1MrS9PWiOGYl6kXPZjU9+ZXs/g=;
        b=SO2JrpLHD8/U3tQZJl9vxDLzH9y1488eAfsc5OcHp4Ap/tQCTnUC8PrSHYfv82S3AY
         rDFWm3RtyD9e3TE/1uDsGyymMJEEEMBnPQkCIUVOBY/eCGCKLcqhQNJQxoAo0+YTVpt7
         L2jBrfJnsljJupsGuLN1QTmblDUhugZTNDQK/blCup99f4pKeXmjWFAzyLbBZomHVC6m
         /pvwuuC/QnFA4NJ0ScysJwkXFElXIV1vcoDtITwMImEO9yCfv+VIeg6loUzh4Rl8o/+T
         x53vSTUGoTNHfrV7fWU+VWzR60c4ckzl6c4f6WqYvHqPYGHufFv2LUK1fsPr74/HEUZW
         lC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ajZurwdncCAgynNzM1MrS9PWiOGYl6kXPZjU9+ZXs/g=;
        b=IiYzklTbqczVqWhXjmonmt6FeOAhocwtfRbeRPVidc2RuoBD+W2TI+7sFVf5wNEqu6
         sD7UP+wlzrqODcNG+37AD27F9EXnvaf4UAwHwZUKabFKdQB9m9BoNGOukhhQnWvRrKFn
         iGhT7/zFyHABvDyA+iM5qY4Ex5mlpDJ3lZZiuyLspFc5npndhbHQE97TFHFcUQFiEqig
         R1Jng7WidnpeC3W38ucMhSP7wbrEzs+IycHNh5BnNSBHDNwGVR03h5nlLnNPMp1nZ95H
         krik8RJRKYVulbTJb17ZnLP4eqVQLWGQ+ov/wMpoVhXrrs99GKjduMqkdLb045viFkl5
         /BHQ==
X-Gm-Message-State: AJIora+t4lgs0UZdqu8gx+egw7O4Ay3Vi6sI7fzfb0Qc+gXMtS+iZD0L
	uUo9GjUyoq6bXgSRmBg+SRxdRtDLT6KqwVsldr6blQ==
X-Google-Smtp-Source: AGRyM1uLbEvkc2rMlroHMhlr35e2sn4YRTKHuTV3sqCTjdfNxB3zt4pfVIM3eVGqnYLKlWJBuDZLe0PPWNJqIolIXwg=
X-Received: by 2002:a17:907:2888:b0:72b:8f41:1405 with SMTP id
 em8-20020a170907288800b0072b8f411405mr26049141ejc.564.1658170180010; Mon, 18
 Jul 2022 11:49:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220712163823.428126-1-sudip.mukherjee@sifive.com>
 <20220712163823.428126-3-sudip.mukherjee@sifive.com> <3a9877d0-3cc5-6452-764b-d07b38c72b00@microchip.com>
In-Reply-To: <3a9877d0-3cc5-6452-764b-d07b38c72b00@microchip.com>
From: Sudip Mukherjee <sudip.mukherjee@sifive.com>
Date: Mon, 18 Jul 2022 19:49:29 +0100
Message-ID: <CAHyZL-fK-d+dPWG63dcFUz17uP-sG4bnSFVW_gt16snnOVTzpQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] mtd: spi-nor: add support for Quad Page Program to no_sfdp_flags
To: Tudor Ambarus <Tudor.Ambarus@microchip.com>
Cc: Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Jude Onyenegecha <jude.onyenegecha@sifive.com>, William Salmon <william.salmon@sifive.com>, 
	Adnan Chowdhury <adnan.chowdhury@sifive.com>, Ben Dooks <ben.dooks@sifive.com>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_114943_820321_D95C2639 
X-CRM114-Status: GOOD (  17.27  )
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

On Mon, Jul 18, 2022 at 6:02 PM <Tudor.Ambarus@microchip.com> wrote:
>
> On 7/12/22 19:38, Sudip Mukherjee wrote:
> > [You don't often get email from sudip.mukherjee@sifive.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > Some flash chips which does not have a SFDP table can support Quad
> > Input Page Program. Enable it in hwcaps if defined.
> >

<snip>

> > diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> > index 58fbedc94080f..dde636bdb1a7c 100644
> > --- a/drivers/mtd/spi-nor/core.h
> > +++ b/drivers/mtd/spi-nor/core.h
> > @@ -462,6 +462,7 @@ struct spi_nor_fixups {
> >   *   SPI_NOR_OCTAL_READ:      flash supports Octal Read.
> >   *   SPI_NOR_OCTAL_DTR_READ:  flash supports octal DTR Read.
> >   *   SPI_NOR_OCTAL_DTR_PP:    flash supports Octal DTR Page Program.
> > + *   SPI_NOR_QUAD_PP:         flash supports Quad Input Page Program.
>
> You don't need this flag if your flash supports the 4-byte Address
> Instruction Table. Does you flash support it? Can you dump all the
> SFDP tables, please?

Not sure what the correct way to dump sfdp is. I did this from sysfs.

# cat sfdp | xxd
00000000: 5346 4450 0601 01ff 0006 0110 3000 00ff  SFDP........0...
00000010: 9d05 0103 8000 0002 ffff ffff ffff ffff  ................
00000020: ffff ffff ffff ffff ffff ffff ffff ffff  ................
00000030: e520 f9ff ffff ff0f 44eb 086b 083b 80bb  . ......D..k.;..
00000040: feff ffff ffff 00ff ffff 44eb 0c20 0f52  ..........D.. .R
00000050: 10d8 00ff 234a c900 82d8 11ce cccd 6846  ....#J........hF
00000060: 7a75 7a75 f7ae d55c 4a42 2cff f030 faa9  zuzu...\JB,..0..
00000070: ffff ffff ffff ffff ffff ffff ffff ffff  ................
00000080: 5019 5016 9ff9 c064 8fef ffff            P.P....d....


--
Regards
Sudip

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
