Return-Path: <SRS0=PdnT=UR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C68DC31E5B
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Jun 2019 00:25:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C94320873
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Jun 2019 00:25:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ff9OxE9V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C94320873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+9EUS74W+56KAAd3YvFr35QLleXYF0ND0fdZXwBstYc=; b=Ff9OxE9V7JtxMX
	3yGwqZZkeyjzu0kYMiwHh0MDWv2/Vu8HKtZoyIvgv9NBzxg+sUN7PxzJktiA9Bt7fJUszbLCRBU0V
	38xeXorGKLylFRzHjKGq2KIjhsgef91rO1d1sFdCMHpZw1jtQqxEFKGphEgBt290PHZvXMH9T6lpt
	gYI1Sh4lWA1eWHV8qyyOL9CbMje3/wiIF6UYUFY0CBhmDFSJCWyT/dZQoJ4SR7UcQlUKOLArnCJ2s
	xpObmoy9XPeoudJesBxorNF1IqPpd33kCPuatxLoNa0HigMyTe9osjxXbMlYIs+WxqoM9B8WysjrL
	3CTzFSlPxSH91QqzaE6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hd1wN-0004st-4t; Tue, 18 Jun 2019 00:25:35 +0000
Received: from smtprelay0202.hostedemail.com ([216.40.44.202]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hd1wK-0004sV-J8; Tue, 18 Jun 2019 00:25:33 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id 29EC41F0A;
 Tue, 18 Jun 2019 00:25:20 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: clock60_4b5582c271355
X-Filterd-Recvd-Size: 2222
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
 (Authenticated sender: joe@perches.com)
 by omf09.hostedemail.com (Postfix) with ESMTPA;
 Tue, 18 Jun 2019 00:25:17 +0000 (UTC)
Message-ID: <547e251d87e307fa4d1e31dfc61b496c152f0905.camel@perches.com>
Subject: Re: [PATCH v5 2/3] mtd: spi-nor: add support to unlock flash device
From: Joe Perches <joe@perches.com>
To: Sagar Kadam <sagar.kadam@sifive.com>, Vignesh Raghavendra <vigneshr@ti.com>
Date: Mon, 17 Jun 2019 17:25:16 -0700
In-Reply-To: <CAARK3HmFg=v+cMGAykPPpwxDGaSKk5k+Gz4fSHQPQmg-rCjPhQ@mail.gmail.com>
References: <1560336476-31763-1-git-send-email-sagar.kadam@sifive.com>
 <1560336476-31763-3-git-send-email-sagar.kadam@sifive.com>
 <70732c8e-111f-7c46-9e93-11894d944a1d@ti.com>
 <CAARK3HmFg=v+cMGAykPPpwxDGaSKk5k+Gz4fSHQPQmg-rCjPhQ@mail.gmail.com>
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190617_172532_706770_DEB53984 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
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
Cc: aou@eecs.berkeley.edu, tudor.ambarus@microchip.com,
 Wesley Terpstra <wesley@sifive.com>, richard@nod.at,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, miquel.raynal@bootlin.com,
 linux-riscv@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2019-06-17 at 21:10 +0530, Sagar Kadam wrote:
> On Sun, Jun 16, 2019 at 6:35 PM Vignesh Raghavendra <vigneshr@ti.com> wrote:
[]
> > > +static int issi_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
> > > +{
[]
> > > +     if (ret > 0 && !(ret & mask)) {
> > > +             dev_info(nor->dev,
> > > +                     "ISSI Block Protection Bits cleared SR=0x%x", ret);

Please use '\n' terminations on formats

> > > +             ret = 0;
> > > +     } else {
> > > +             dev_err(nor->dev, "ISSI Block Protection Bits not cleared\n");

like this one

> > > +             ret = -EINVAL;
> > > +     }
> > > +     return ret;
> > > +}
> > > +
> > > +/**
> > >   * spansion_quad_enable() - set QE bit in Configuraiton Register.

s/Configuraiton/Configuration/



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
