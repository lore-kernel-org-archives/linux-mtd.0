Return-Path: <SRS0=hs7p=63=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 578F8CA90AF
	for <linux-mtd@archiver.kernel.org>; Wed, 13 May 2020 13:59:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B307C2064E
	for <linux-mtd@archiver.kernel.org>; Wed, 13 May 2020 13:59:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="laX6K8oD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B307C2064E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KIPNQ2HTvfS4gmXs9SaP68ODCK63+yK2TFa2HmBCLXA=; b=laX6K8oDvaDLG5
	3iGQLs/TC7aLtndE07W6GCSCOVmv0bl/mL4rJEOp6CXA61vQS6z5Womix2LD2FmLxE2IZh/bXdtBY
	ev2k1mwGG+az6xcZ26Xvs3d7G7+55eb2G5kEmAPzY/M/CiptKhigB+hsM6pFGgfEf67wNgNU4MQxS
	ULJA4H2iump/kpWK/vWzWMjR3X/3+wEp665RWlMHclCHFwPYT13WcA9Oe2aJTDMfmp6Ffe0VNDOB/
	ZFpj/gP+A2SOlQnI/TnkwSPzy6EB6QF6UP0Rj+FpGdHLUxY4XMv7LMgVC87VhRSm78irqqsNXH0HF
	iTfuAJ4xlsHgp9kfX8LA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYrut-0003Wl-3t; Wed, 13 May 2020 13:59:23 +0000
Received: from mout.kundenserver.de ([212.227.126.135])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYruq-0003WC-C6; Wed, 13 May 2020 13:59:21 +0000
Received: from mail-qt1-f180.google.com ([209.85.160.180]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M8Qme-1jUS3x1Bj6-004PDC; Wed, 13 May 2020 15:59:17 +0200
Received: by mail-qt1-f180.google.com with SMTP id h26so14176380qtu.8;
 Wed, 13 May 2020 06:59:16 -0700 (PDT)
X-Gm-Message-State: AOAM533rwAvGouUl3PaBiBeas576nRKTHQJK7Vi551gZYZoCXinkrjsZ
 rdRbAh4fOaQ09SjuxvYhR2FVh9Ze16w/ORXZ7hU=
X-Google-Smtp-Source: ABdhPJyT+xoQj2vuKGXfbqYoiOi6Hc8NT8YpW0uPPacFX2RP08sMKF0vH8szzdRoVXUir3s6SbUHWVSdmu9IPamQdT4=
X-Received: by 2002:ac8:518f:: with SMTP id c15mr11201103qtn.142.1589378355789; 
 Wed, 13 May 2020 06:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200429223134.789322-1-boris.brezillon@collabora.com>
 <20200508121041.64f91276@xps13> <87lflwngey.fsf@belgarion.home>
 <20200513151737.757513cf@collabora.com> <20200513152327.3879010c@xps13>
In-Reply-To: <20200513152327.3879010c@xps13>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 13 May 2020 15:58:59 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2X3chQ36E_RHH5nJkTu-QUiD4Wwccnhn9KNct+-5ytDw@mail.gmail.com>
Message-ID: <CAK8P3a2X3chQ36E_RHH5nJkTu-QUiD4Wwccnhn9KNct+-5ytDw@mail.gmail.com>
Subject: Re: [PATCH 0/3] mtd: rawnand: Get rid of the cmx270 driver
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-Provags-ID: V03:K1:cFfqyaWSsn9t4bgliZdZLn11WqQJJk/a4gB5eho7jriQnGL0xnp
 CPVmbVCnEhFrELqATt2TralKiysOe0JqAb8T6hJ3dbe6d8CMEKwYMsBV8sp5eZzzpeg+pKG
 cNOO2rFnugbCSL8sC8R4lGreHpcr7Y0/ZwHK8a7AxtRqkalyzOOENAB4NBzfo7zUg4Izu5I
 gNYDVXTS8xgUmp+5Hd3Aw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6zSQnYyiTGE=:TP0ea6lE31Z8TUqSO3PS3d
 41Od77rz1R3IkEBXol7LK578hrt1bxWTnFUy59BLgoLeAzgz+R33BFrWGHnttkmwwSi2DcIyu
 c1pA8M8fobth7yMq1N+OnUFG+U2KlizbajYIt7pQaKhua5ZWH3ynFEqUaAlfZvuiAkPyOR7sT
 GokKGPBvjYAtMSj88Q3sKtpnYNRi1A3688ETA4OzhlPUhMxZ8a8s/rxmcgm+hIS4/x95RT/Lq
 AT/NPrwzgvD+FyH1fe2T5rTpOqLYID6sLOStssQWaiIqoqDzEbXccxD+lMGUGY99LwoinVOU/
 lEbkcvQskcAWV7un9ZREW83etoBkJanyR6XHayU26HGADhRwO0sUC4k2RUJ7mN75CR5x1azAh
 ZvuOGBITkwidIIi8lQE4Vr2gmOorwsvoirE6gf4d4vScaRPpmfuIUcCEZe7muM6w1RAZBrKn0
 KwmMPLcrOjyCP1n90TiVega6EaW+8zUhCDwu/e6txxaj3E4C1vBvjpDfbChlYscMQR/00VtVH
 7CPynX326bY+7JC3jysnTauFW0TcNYshCBrQKhcDWRo45UENC9hPtdyF3WLJyOm80tjGW2z/f
 QDrhGfN5RdgPZKH1H+ifkVmT9/1orbpC39X4wMK1FfuSQhGYj9at8FfZI/vLN3DtGq+7Of2mS
 RUuiXOHobggnTvefQiqx/qB/PNyyVMJUMOXkZljI4orRVUYUoD5tY1YGgo0SsFPWVj49woKCJ
 yuTYYGwQhn6/73XeIXiBsKo0ZE+lbvyZ0cgPgkhGBr+vwKOWKcfP9Zt6DqzcbU2HdDVOvDWZ7
 XS975MNe/QHeTjkrzrm3rPxhAjafZUChH88GALweOhAfhfk4Ok=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_065920_707983_8244F46F 
X-CRM114-Status: GOOD (  19.40  )
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
 Richard Weinberger <richard@nod.at>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 igor <igor@compulab.co.il>, Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, May 13, 2020 at 3:23 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> Boris Brezillon <boris.brezillon@collabora.com> wrote on Wed, 13 May 2020 15:17:37 +0200:
> > On Wed, 13 May 2020 14:55:01 +0200 Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> > > Miquel Raynal <miquel.raynal@bootlin.com> writes:
> > >
> > > >> I hope someone still has a board to test that.
> > > No, unfortunately I don't have this board, nor do I know of anyone having
> > > one. It's the second time I see patches on cmx270, and the question to whether
> > > we shoud keep this board in kernel is still in my mind ... given that cm-x300 is
> > > fully supported and testable, and no one I know has a cm-x2700 ...
> >
> > What's the point of keeping support for a board no one has or no one
> > cares about? I know I don't have my word in this decision, but I would
> > strongly recommend getting rid of it, especially when I see such
> > crappy/unmaintained code lurking around in the drivers/ tree.
>
> I also agree on the fact that spending time on maintain unused boards
> is lost time. We have so many drivers to handle, maybe it's time to get
> rid of these "too" old drivers.

The cm-x255/cm-x270 came up in another discussion last year because
of its unusual PCI_HOST_ITE8152 PCI support that I'd like to kill off.

We did not see a strong reason to keep the board support at that time,
but nobody sent any patches. I think it would be reasonable to just
kill off MACH_ARMCORE, PCI_HOST_ITE8152 and
MTD_NAND_CM_X270 along with anything else that is no longer
used after those are gone, such as the pcmcia support.

       Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
