Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231CEC433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Nov 2022 20:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q8Ul0lXIQnDoiO0RFiAKjAJPwPNYBiYwRc22GEG61Bk=; b=H0F9uK9Y6xdMTx
	vWyqlbZBrxdAEKgU3KAw9X0JX8n+IqdO5G0JpfOQyzCLQfAYNtjcLv5JitSZzNt+pGgU0rfgx5hq7
	Rbbqtxq5OOMmDYSwgOp6ffFs+0Z0UCYAKz4tNIADlNtp5kPbgHC//TNVawwBkb9kXnxTgWOmll1RS
	g9P4ejSX9Y6HkqCn0NE4dn0kDfctBkHKDC/RiVuHRlm0ud+ECZsA7MbeWrV4Fdze5QRpWTTSXx3b7
	5eWIVKhxqSpQKhFrfoWyIGudbeTi0W8LmLhw2cES9/TYwRpz6PlHjF+NTGftJJCU9C2IGNNTeAJte
	WUr+w6o+ucFRVqquPvrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otDnX-0097CE-95; Thu, 10 Nov 2022 20:05:15 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otDnU-00979q-0k
	for linux-mtd@lists.infradead.org; Thu, 10 Nov 2022 20:05:13 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1otDn6-0005Xu-LQ; Thu, 10 Nov 2022 21:04:48 +0100
Date: Thu, 10 Nov 2022 20:04:45 +0000
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
Message-ID: <Y21ZXRKJF3hZg8wk@makrotopia.org>
References: <Y2rgbfpYfpbLKHaf@makrotopia.org>
 <1691046252.219046.1668109493753.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1691046252.219046.1668109493753.JavaMail.zimbra@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_120512_097651_886F367D 
X-CRM114-Status: GOOD (  12.02  )
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

On Thu, Nov 10, 2022 at 08:44:53PM +0100, Richard Weinberger wrote:
> ----- Urspr=FCngliche Mail -----
> > Von: "Daniel Golle" <daniel@makrotopia.org>
> > +
> > +		if (!IS_ENABLED(CONFIG_MTD_BLOCK_PARTITIONS) || mtd_type_is_nand(new=
->mtd))
> > +			gd->flags |=3D GENHD_FL_NO_PART;
> =

> I know that NAND should not get used with mtdblock because lack of wearle=
veling and
> in general too many writes. But what exactly is the rationale to deny par=
t scanning for NAND?

As UBI should be used on NAND, partition scanning should be enabled for
ubiblock devices to have uImage.FIT filesystem subimages mapped by the
partition parser.

If not skipping partition scanning on NAND-backed mtdblock devices the
scanning itself will already trigger multiple warnings which now happen
every time when a NAND-backed mtdblock device is being opened since
commit 96a3295c ("mtdblock: warn if opened on NAND").

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
