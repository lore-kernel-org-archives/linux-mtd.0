Return-Path: <SRS0=iVWO=M6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F47AC4338F
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Aug 2021 07:54:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA4FF610E7
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Aug 2021 07:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA4FF610E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mess.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aNz1hBhT4XDZPmBc5FOXJ2ntkT/5CZI1T0wLWX7ZWig=; b=3Wl5e702S40MmT
	AWE+O+K4MowcOqG47Oims0DtYX66+JvhsHXownP+4Uf2vqgH0jYWxt550O1uCSV3KLmOVpuuE9ZSc
	W5jktHI+fJUQhLN/6PQC1khhXytn6Yb5vvL5j42ybGTgW9/JqCn63gu+u3dBA5u8PPi0st0Z6yb4Q
	Q5xWAdfN3VbJ2iTdz4QuBrZkazq+sPWQIYxuUqB5XsRrEKBuHPdFhPG1JqiEo/0Ko0M34TGGDhKdZ
	9Rvpz+pEpv4oN2Ff0g/Fsi5JEKdRGiRbPY+K2Qvo+5ZIN0qRUxJ2rZRNqMsKHwkix4p3kS45PwIlS
	s9uiQdwZIn6surYVDOkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCH9Z-00EKR7-0Y; Sat, 07 Aug 2021 07:53:57 +0000
Received: from gofer.mess.org ([88.97.38.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCH9V-00EKQi-4F
 for linux-mtd@lists.infradead.org; Sat, 07 Aug 2021 07:53:55 +0000
Received: by gofer.mess.org (Postfix, from userid 1000)
 id 4BAA5C63FB; Sat,  7 Aug 2021 08:53:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
 t=1628322826; bh=Bkut+OZMcp1xMzC0oXZ/GnVmh86FD4MH9H3mfrJxuAA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JaTOCy/Pa0byqHJU8m/0ZaXLjSYKE1abPcT/Rl0ypKFh3N2+0PjPAWef0YI3mZn3L
 BdN/5QFmh/h0ZBi1fhgjI2R5qoJU607mI6Mn7iR+0QkpSOtHp6jVEa18pH+KxEp8IA
 KQua/HOishr2u4lu1TfSSPVzge2IW5hITD/oKDfm9JyrVhgARpZnnr8qN7IfaMnF9C
 eCoh+i0izYyI7go6z885Ws38msmgpMmDREEown0JLTkYKijaF8AYPFidltUPr3CdGV
 VhdllV41+nyT99C3OYA5sq2THuFXkM2f2jz+14dHtONOUk1n3sKlS9JICxky7F41iA
 qQirca7aujQZA==
Date: Sat, 7 Aug 2021 08:53:46 +0100
From: Sean Young <sean@mess.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/4] mtd: rfd_ftl: allow use of MTD_RAM for testing
 purposes
Message-ID: <20210807075346.GA2522@gofer.mess.org>
References: <cover.1626169090.git.sean@mess.org>
 <5f9ca4ce43ab49e900339e2cef26782825e3ab6f.1626169090.git.sean@mess.org>
 <20210806201629.0aaf6cc6@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210806201629.0aaf6cc6@xps13>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210807_005353_503726_00834074 
X-CRM114-Status: GOOD (  22.03  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Aug 06, 2021 at 08:16:29PM +0200, Miquel Raynal wrote:
> Hi Sean,
> =

> Sean Young <sean@mess.org> wrote on Tue, 13 Jul 2021 10:44:00 +0100:
> =

> You miss a commit message here.
> =

> Is this a real patch or just something for debugging purpose that we
> should keep out of tree? I don't really see the reason for this patch
> even though I am not strongly opposed to it.

This allows the mtdram module to be used as a test bed. This means
different mtd sizes can be tested and it can be tested on platforms
without an mtd device.

I'll add a better commit message for v2.

Thanks for the review

Sean

> =

> > Signed-off-by: Sean Young <sean@mess.org>
> > ---
> >  drivers/mtd/rfd_ftl.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > =

> > diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
> > index 6e0d5ce9b010..7b243f2b2fa3 100644
> > --- a/drivers/mtd/rfd_ftl.c
> > +++ b/drivers/mtd/rfd_ftl.c
> > @@ -720,7 +720,8 @@ static void rfd_ftl_add_mtd(struct mtd_blktrans_ops=
 *tr, struct mtd_info *mtd)
> >  {
> >  	struct partition *part;
> >  =

> > -	if (mtd->type !=3D MTD_NORFLASH || mtd->size > UINT_MAX)
> > +	if ((mtd->type !=3D MTD_NORFLASH && mtd->type !=3D MTD_RAM) ||
> > +	    mtd->size > UINT_MAX)
> >  		return;
> >  =

> >  	part =3D kzalloc(sizeof(struct partition), GFP_KERNEL);
> =

> Thanks,
> Miqu=E8l
> =

> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
