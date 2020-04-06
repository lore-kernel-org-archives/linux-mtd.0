Return-Path: <SRS0=p/wV=5W=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3230C2BA19
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Apr 2020 12:49:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC78E206F8
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Apr 2020 12:49:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qyAx5iAW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tc47wP7v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC78E206F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rkTcZAb7/F9C63C/9f+yBAUTR028xKRt6hPyetXSoxw=; b=qyAx5iAW0kcdAAam8jh/LB3+r
	NTQTNJndLk5Z3YTbkeTbZAaT4+2Do/J6a1otv6oXAGXWhfrKoZkPmtmiO+60grriwHO9Z5AteVVb+
	GM9oEnVsXzf1CPOowei0fr/l3ej3iqwnyFyJrdcoiqo9vieonyWzY1OQS5JgATMTwyCknwhhPWY8P
	/VGefPPmi/+v9cKaIoQXAxYhhrR2w1sdzWZgg+MvHgXWJa4L2hlgbRm7/46AyTRi1MtI1w2d1FUnc
	/ebMAD5E5MOOqOu3n/YgWb+SDE2EbhEBbWFfBTJ6znuI6RIRHv6wyLWtOQ/7tl0/whjTmARSfA9VS
	x4J6vmWxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLRCA-0002Ra-H7; Mon, 06 Apr 2020 12:49:42 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLRBk-0002PI-Db
 for linux-mtd@lists.infradead.org; Mon, 06 Apr 2020 12:49:32 +0000
Received: by mail-oi1-x242.google.com with SMTP id l22so12868293oii.12
 for <linux-mtd@lists.infradead.org>; Mon, 06 Apr 2020 05:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fFB4VdA84Kugwzr7cseBJwu0dBCE6rHh8pgVv8EEcS0=;
 b=tc47wP7v2iRxBHrC4XRQCCKeCh3hWP45Nin6JzgR3+4GyevHAWChQgDAKOfMtyjmK9
 VOsVxkgLbMbW58sh4UpBrQRTKFdFnniHrU/yt309hGVa0gub/FsysLJMwD1xquCmQRGA
 xiHuAJuoFhQl7veK5j9wCnk3W9bbPkO2EXrmvpEJSXzypOIDJPVQDKErZodbebvt726B
 h8M5jUCKjLQUotXM4U7CGxB8CF+Vx3RWNrL/KOonulMVcijs/zR52xudTFNRPq0WJyy6
 X/MOFAgZizYVSLrK6cSA4ll9AK3iZJc5H8yorq0nmHOZcnLLK/IpwO+eBBCCzUTL8+kV
 EN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fFB4VdA84Kugwzr7cseBJwu0dBCE6rHh8pgVv8EEcS0=;
 b=rrihNz0QnzyGzP75qqgxg/laNZzK/a3/vkGW7Ao8Clg7OJ6Qu+hC4iEwCuseIDtfrg
 95GlaztPnMstHUnVdVL+cCNnSo49O3FcZNpo2M8dbN3Lls0X3AIDEw9Vi3e7x90uKK7U
 qDE7zvkM/K7oYQ8PL7daUpGOHORHPNbpjc7EA5FyFMBWV1Zyjyf9PVPBfQiTUdtFAnJE
 zZrjtsqc1Cq9nx9yqRB4Om48dfxthWA8JxPCFoepbM4ly7PYMoUopnd7o4sbJnY4XchF
 keBEZs4L8wssOG0FpTAjr2hBpbpNxYC6FkMVbjGCzAGBvLnAp3McC1gHg+nnGqmvzCOo
 L3bQ==
X-Gm-Message-State: AGi0PuZBGozcUiidfRjOCpklk+Vb7Pgp+wqim6CbDzUpzf1+niihoUpS
 /OKrSolSYK7vssrxjqc5cxcl89kufxyxZ3Rq5P0=
X-Google-Smtp-Source: APiQypK+8VytYADNh4P+zG7WCNGv9WUis8t/SIv0S1IzfcExS1VnQzKmLTrz8eNCcJ0u1hURK/PclnoAZK+H2zmiSR4=
X-Received: by 2002:aca:3196:: with SMTP id x144mr12841366oix.77.1586177354089; 
 Mon, 06 Apr 2020 05:49:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200404125845.1381080-1-gch981213@gmail.com>
 <CAJsYDVLA3fgjBGdStkiZeqEv8q2j2sUdDzgj3QdahB=tvyYJWg@mail.gmail.com>
 <CAOX2RU7ZU0Jj71YCAoP=qaqUomaHKTi=XMV8wGvwRg_fYpfoMg@mail.gmail.com>
In-Reply-To: <CAOX2RU7ZU0Jj71YCAoP=qaqUomaHKTi=XMV8wGvwRg_fYpfoMg@mail.gmail.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Mon, 6 Apr 2020 20:49:02 +0800
Message-ID: <CAJsYDVJbczAST7HPtkPAtQXhm+RdZFyAJz4XVjwkNMPDdMnDyQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "mtd: spi-nor: Add 4B_OPCODES flag to w25q256"
To: Robert Marko <robimarko@gmail.com>
Content-Type: multipart/mixed; boundary="000000000000be6f7405a29eb139"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200406_054924_572435_DF8BE8F1 
X-CRM114-Status: GOOD (  12.87  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, open list <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--000000000000be6f7405a29eb139
Content-Type: text/plain; charset="UTF-8"

Hi!

On Mon, Apr 6, 2020 at 8:23 PM Robert Marko <robimarko@gmail.com> wrote:
>
> It appears that W25Q256JV has an SFDP table and in it advertises 3B or 4B modes.
> >
> > [    1.957903] spi_qup 78b5000.spi: IN:block:16, fifo:64, OUT:block:16, fifo:64
> > [    1.962185] SFDP advertises 3B or 4B
> > [    1.977393] spi-nor spi0.0: w25q256 (32768 Kbytes)
> >
> I have used the attached patch to check what does the SFDP DWORD 1 advertises.
> If FV version has or does not advertise 4B support than that can be
> used to differentiate them.

My old w25q256fv spits all 0xFF to 0x5a read sfdp instruction.
I've asked someone with a newer w25q256fv to dump the entire SFDP
for me and it's in the attachment. You could do a comparison between
w25q256jv with this dump.

> Can you apply this patch and check what the FV version advertises as I
> don't have a device using that revision.
> FV version also should have SFDP as datasheet for it clearly advertises is.

I've checked the sfdp dump in the attachment and it's also advertising
3B or 4B in 1st BFPT dword.

-- 
Regards,
Chuanhong Guo

--000000000000be6f7405a29eb139
Content-Type: application/octet-stream; name="sfdp-w25q256fvem-wson8.bin"
Content-Disposition: attachment; filename="sfdp-w25q256fvem-wson8.bin"
Content-Transfer-Encoding: base64
Content-ID: <f_k8ogxpxp0>
X-Attachment-Id: f_k8ogxpxp0

U0ZEUAABAP8AAAEJgAAA////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
///////////////////lIPP/////D0TrCGsIO0K7/v//////AAD//yHrDCAPUhDYAAD/////////
////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////w==
--000000000000be6f7405a29eb139
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--000000000000be6f7405a29eb139--

