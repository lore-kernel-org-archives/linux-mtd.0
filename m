Return-Path: <SRS0=IhQK=BN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09675C433DF
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 08:31:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C97D8206D7
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 08:31:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j0tXyQgy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tGUNveHs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C97D8206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W7C+hcaO6AkDd6NAmpR8y2IRsorE86jTtJ2E/ppdWXQ=; b=j0tXyQgyX5y2yk+t2ddnV43fj
	dN+5v4PvygfVlbQZ/saO5/L0NuWCVxBG/id4tbqUYLyuZv/RXMVKBkxVnQUPryEL6WlVlYODySq/f
	fTiRL+tuweFGxxj5PFyCtQPym03CJwfxLxIkj2yC7Iw+RIt3Zph7Qx6ASUrmenfJe4dCphwF7LkG/
	vEDcfAH2dc+3+Jf88XLHIN3aXzSW8WYhSWShPlLuzqcd2wkBx0KH/OPw3iRYq90gHUUpzLIoHxRFT
	q3WLqpoH7azS2piM88qbXHwZ6R/H9HA19+y8Ucm5SHqxnwki+SYvh7zkbwJw3oQaFiKjvAKg1U3Or
	HoopjjZjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2VrX-0000Ko-HJ; Mon, 03 Aug 2020 08:30:27 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2VrU-0000JR-0Y
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2020 08:30:25 +0000
Received: by mail-qt1-x844.google.com with SMTP id x12so19124410qtp.1
 for <linux-mtd@lists.infradead.org>; Mon, 03 Aug 2020 01:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ISozrYU7PU025jNI1enkOjYZmbhwtke0gCttoOX9kqk=;
 b=tGUNveHsuaU9PyTum3oTuY5taxf3JVReIws4TlBnCqrkdijNxnB4auJkiXaxthKNnh
 MYRxpDsg3ChpcM/haFRhvr5+iK6xkUm55sRyMsKaoxXc45LY6DwGf8up+VBpD3diuDgZ
 FNqtFXsn53umL7D3roUAv4r8/DJnWVGuUPYsvg23omECsaHjzgMqjqXQay7WJe9z8XMb
 AUYJkL91Y5RBprQcvU10i20oh5oExwWCzLcNgvUGRGHzedG1fRInLwcVbEWxjrIxG9b8
 ikHGCJLHRtRTLNoIbgHCfdLGf6rWmlSE9PvSmhBXELMeZWg/w2tekJFXJKS1iCVF2wnk
 i+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ISozrYU7PU025jNI1enkOjYZmbhwtke0gCttoOX9kqk=;
 b=QQDeST/FF/eldVOpRMjfodbHcTTZpafxZgpdYPSsyqVnrfR+o4Cu+iC3igyrPgmJ+d
 NDdcogcXozEylDCgeP5iytTrXI7YG9jIVrQBLMgRbX4+FkUMMik180AVyCHb/dAikBKp
 2679ApWl8E5BbNqsa7WCPEc3g15SZbAvmadE4EGtVCEhvfDVdXISeIkTa4NqN2Q/j8B0
 5qyQGGdhjRDgrk8g9QQNXafrWrX1EyxGDWU6pwOY2tLaK2hFM+xYopOE1wDVz/GXViET
 UwxRq3TMdfIdVTZQbP61GMrPlVEp+IrPyZcRot6tIyzuRrjQCV3m94cukE8OYAf23/ds
 Gd0g==
X-Gm-Message-State: AOAM532IEzK2bk47YqueDjF0pxCptvw7VthmhQueo1v5O5JeYugxAFoN
 nPl1INnzHrCXWufnNWLa9W/eEXikcDzjuc19236/+Hci
X-Google-Smtp-Source: ABdhPJyKw+RgDkBuXTKgdpgruGA04Kn+radSUXwOOWOnTskTdxOHikH00u+RqlvJKsqlNEcPZz646HF1Tuy3maCksxg=
X-Received: by 2002:aed:3b7a:: with SMTP id q55mr15410769qte.78.1596443422006; 
 Mon, 03 Aug 2020 01:30:22 -0700 (PDT)
MIME-Version: 1.0
References: <MN2PR13MB3309227C223D0CD8AFE5836AB37E0@MN2PR13MB3309.namprd13.prod.outlook.com>
In-Reply-To: <MN2PR13MB3309227C223D0CD8AFE5836AB37E0@MN2PR13MB3309.namprd13.prod.outlook.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 3 Aug 2020 10:30:11 +0200
Message-ID: <CAFLxGvx5TLu3b8-hXWBaRn3Z-vNL4kqM-JQyh_mzeNhyhLAOtg@mail.gmail.com>
Subject: Re: [PATCH] Fix corner case in bad block table handling.
To: "Doyle, Patrick" <pdoyle@irobot.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_043024_103417_EC420957 
X-CRM114-Status: GOOD (  16.89  )
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
Cc: "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Jul 15, 2020 at 4:54 PM Doyle, Patrick <pdoyle@irobot.com> wrote:
>
>
>
> In the unlikely event that both blocks 10 and 11 are marked as bad (on a
> 32 bit machine), then the process of marking block 10 as bad stomps on
> cached entry for block 11.  There are (of course) other examples.
>
> Signed-off-by: Patrick Doyle <pdoyle@irobot.com>
> ---
>  drivers/mtd/nand/bbt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/bbt.c b/drivers/mtd/nand/bbt.c
> index 7e0ad3190c..eb1184aadb 100644
> --- a/drivers/mtd/nand/bbt.c
> +++ b/drivers/mtd/nand/bbt.c
> @@ -124,7 +124,7 @@ int nanddev_bbt_set_block_status(struct nand_device *nand, unsigned int entry,
>                 unsigned int rbits = bits_per_block + offs - BITS_PER_LONG;
>
>                 pos[1] &= ~GENMASK(rbits - 1, 0);
> -               pos[1] |= val >> rbits;
> +               pos[1] |= val >> (bits_per_block - rbits);

Looks good to me.

Fixes: 9c3736a3de21 ("mtd: nand: Add core infrastructure to deal with
NAND devices")
Reviewed-by: Richard Weinberger <richard@nod.at>

--
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
