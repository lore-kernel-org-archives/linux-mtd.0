Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01983C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Nov 2022 00:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Wy1gJv/N3fSiAE+AdvQ3l9yzvYXQIc0wPyhXB9THTU=; b=N2jNjzlnRwULUN
	TOiseoC1bbUKo2/U7NMfC2jm/ZYQzT7AVVLMQb54yQoBz45P+6vzSK9VOq3aADOQWIgVUzO1NQGzv
	Ekq5F7xEZa8/MprkDVwtzsaB+LbWD2XwKvYahW2t6iU1EjDsrOgyGeAFs7MeMyO/xggD7TkAExjov
	6jRShsQq5wTZLx2bcLRBMA4cLqrwDkfW3vOKFz6D3tRqRvXPz04kavgL+1OkaVK060HDnEiXD9d2c
	gxm+fT9nfiE7W/MJhteKcVSVynCXylOfbLzBbG9caSNdoTR0O/Kpr1E9779jYSbb5Uw2HZKYJJCCu
	UQh2BGNk7B7ldPScbknQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otI57-00BWYF-LC; Fri, 11 Nov 2022 00:39:41 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otI53-00BWXJ-DQ
	for linux-mtd@lists.infradead.org; Fri, 11 Nov 2022 00:39:38 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1otI4k-0006Am-98; Fri, 11 Nov 2022 01:39:18 +0100
Date: Fri, 11 Nov 2022 00:39:15 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Richard Weinberger <richard@nod.at>
Cc: Jens Axboe <axboe@kernel.dk>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Matthew Wilcox <willy@infradead.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Chaitanya Kulkarni <kch@nvidia.com>, Ming Lei <ming.lei@redhat.com>,
	linux-block <linux-block@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	linux-efi <linux-efi@vger.kernel.org>
Subject: Re: [PATCH v4 4/5] mtd_blkdevs: add option to enable scanning for
 partitions
Message-ID: <Y22Zs7Jg0FNFHeHD@makrotopia.org>
References: <Y2rgbfpYfpbLKHaf@makrotopia.org>
 <1691046252.219046.1668109493753.JavaMail.zimbra@nod.at>
 <Y21ZXRKJF3hZg8wk@makrotopia.org>
 <871124728.219224.1668111155161.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <871124728.219224.1668111155161.JavaMail.zimbra@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_163937_460213_50F32A14 
X-CRM114-Status: GOOD (  20.01  )
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

On Thu, Nov 10, 2022 at 09:12:35PM +0100, Richard Weinberger wrote:
> ----- Urspr=FCngliche Mail -----
> > On Thu, Nov 10, 2022 at 08:44:53PM +0100, Richard Weinberger wrote:
> >> ----- Urspr=FCngliche Mail -----
> >> > Von: "Daniel Golle" <daniel@makrotopia.org>
> >> > +
> >> > +		if (!IS_ENABLED(CONFIG_MTD_BLOCK_PARTITIONS) || mtd_type_is_nand(=
new->mtd))
> >> > +			gd->flags |=3D GENHD_FL_NO_PART;
> >> =

> >> I know that NAND should not get used with mtdblock because lack of wea=
rleveling
> >> and
> >> in general too many writes. But what exactly is the rationale to deny =
part
> >> scanning for NAND?
> > =

> > As UBI should be used on NAND, partition scanning should be enabled for
> > ubiblock devices to have uImage.FIT filesystem subimages mapped by the
> > partition parser.
> > =

> > If not skipping partition scanning on NAND-backed mtdblock devices the
> > scanning itself will already trigger multiple warnings which now happen
> > every time when a NAND-backed mtdblock device is being opened since
> > commit 96a3295c ("mtdblock: warn if opened on NAND").
> =

> I see, you want to promote UBI. Makes sense.
> In case you do a v5 series, please add a comment to the code.

Will do, I'm planning to send v5 early next week.

If we are going to have only CONFIG_MTD_BLOCK_PARTITIONS and no other
config symbol for ubiblock devices I'd also merge the two patches for
mtdblock and ubiblock partition scanning into a single one.

Thank you for reviewing!


Daniel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
