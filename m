Return-Path: <SRS0=6iW2=DF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D28AC2D0A8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2020 16:26:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 077A1207F7
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2020 16:26:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SerCwrO/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 077A1207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g2yXSg9LJoHK+TIh7t9Uu4Tf4XzlmnC+NUYl0Z3hyEQ=; b=SerCwrO/kLk0ALBlV2DRqn5oY
	g23TYJECdvHTSoZSu2pXynVuVuXwNX52/EHE5H8wC9Pl5m/qWOh59LXR8uHQnbVTmffuDrPON3ttm
	Cqe+RSmOlhClWM00rIj8rCRd1pELmeHHK3H5rnom8ZCkmTP+It7mz0md8JCVuzXHBYnhWUJAayxo+
	4b3hRJXd3JalIgcOQN5yletHnsdWI4uSicOfEiABL062tn0qJmEWS6XC+7VIY22jG3fN5CYsgPPNb
	xEM1nsQBWiG73Nyy3aCIAsj41bw5QHwJWcIPRZIoKFbmtKIUWZbyeKEZaMi9slWYPd7cJbgoL98oB
	vcNuAEOrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMvyM-0007JZ-JD; Mon, 28 Sep 2020 16:25:54 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMvyK-0007Iv-5h
 for linux-mtd@lists.infradead.org; Mon, 28 Sep 2020 16:25:52 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3F4AA29AD51;
 Mon, 28 Sep 2020 17:25:49 +0100 (BST)
Date: Mon, 28 Sep 2020 18:25:45 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 1/2] mtd: spinand: micron: Generalize the function
 and structure names
Message-ID: <20200928182545.1e972f3b@collabora.com>
In-Reply-To: <20200928182159.5a6cf46a@xps13>
References: <20200913161533.10655-1-nthirumalesha7@gmail.com>
 <20200913161533.10655-2-nthirumalesha7@gmail.com>
 <20200915101321.1afa5033@xps13>
 <CALKVOUomKLZ5GEHmXb+VfEq8UiNUpCN-Vqkx3N+yykEnCrHkDA@mail.gmail.com>
 <20200928165528.54e5db6e@xps13>
 <20200928174505.75fda272@collabora.com>
 <20200928175005.48783b61@xps13>
 <20200928180343.4c5302a5@collabora.com>
 <20200928182159.5a6cf46a@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_122552_306029_4459501C 
X-CRM114-Status: GOOD (  25.74  )
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
 Thirumalesha N <nthirumalesha7@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Chuanhong Guo <gch981213@gmail.com>,
 Shivamurthy Shastri <sshivamurthy@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 28 Sep 2020 18:21:59 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Boris,
> 
> Boris Brezillon <boris.brezillon@collabora.com> wrote on Mon, 28 Sep
> 2020 18:03:43 +0200:
> 
> > On Mon, 28 Sep 2020 17:50:05 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >   
> > > > > The way OOB
> > > > > bytes are organized do not seem relevant to me, I think i prefer the
> > > > > "_4_/_8_" naming,even if it's not very explicit.        
> > > > 
> > > > The ECC strength doesn't say anything about the scheme used for ECC
> > > > bytes placement, and you might end up with 2 different schemes
> > > > providing the same strength, or the same scheme used for 2 different
> > > > strengths.      
> > > 
> > > So perhaps both should be present in the name?    
> > 
> > No, the point was to re-use the same functions for various strengths if
> > they use the same ECC placement scheme.  
> 
> I get the point, but is the current implementation generic enough? I
> see hardcoded numbers, I have no idea if these numbers are common to
> all strength given a specific layout, or if they only match for a given
> strength?
> 
> +static int micron_4_ooblayout_ecc(struct mtd_info *mtd, int section,
> +				  struct mtd_oob_region *region)
> +{
> +	struct spinand_device *spinand = mtd_to_spinand(mtd);
> +
> +	if (section >= spinand->base.memorg.pagesize /
> +			mtd->ecc_step_size)
> +		return -ERANGE;
> +
> +	region->offset = (section * 16) + 8;
> +	region->length = 8;
> +
> +	return 0;
> +}
> 
> If possible, I would like to avoid several successive renaming.

Right, I thought those functions were patched to be generic, but that
doesn't seem to be the case, so I guess sticking to _<strength>_ makes
sense for now.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
