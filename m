Return-Path: <SRS0=9wI6=I7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACDA2C433ED
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 14:29:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46D94610CB
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 14:29:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46D94610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4S/3L09DGaKmWcoGXP7ad25APpIAAWfIWRZj20ZkmQE=; b=grUosKrppOAE1HswWSOsAzngU
	j9wEZct8Hx3Ord7Wi9djwW8GN25C+R5qTTImybHCp2sje70pNc4vg8BuLbO1vRn3+rzXVZ8fM93RT
	D4Ppccfu43e2DK3cD23GBKn4hvCy315h6DHSVxS57LXfvEIKlmw5U0O4BB12qK0Pexk1hSIS6x63s
	8cxtUVi+tJNsyXM1bbSTYPxMCRl3p38GesiUWU7Kh4Qq9PBIZ2VExmFTO5M5z2d3P4H1ImIMpPGLA
	seVkf7jPwoMYc7Gmi76MKCbgDazFm39gaZa6isCujSg9yKsdhFEByCzekdyhqbQKkl74fXmu1zr9e
	yl+rAKgpQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSKlx-00D8Bi-T4; Fri, 02 Apr 2021 14:27:41 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSKlt-00D8BH-Kp
 for linux-mtd@lists.infradead.org; Fri, 02 Apr 2021 14:27:39 +0000
Received: by mail-pf1-x42a.google.com with SMTP id q5so3691333pfh.10
 for <linux-mtd@lists.infradead.org>; Fri, 02 Apr 2021 07:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=T3DVNLHJQeSHfhXNKz9gWp+Tv1DR+kLOwzGQWhc+nWA=;
 b=P7PnM9/F2Rzjf71XMFNGpkG+o4amPJ9qgD+JRcXsUoz805jFetgua3n/+Fqp6EggUt
 VRLWl6TP2Wqr+yiujTkrQVaeDNyU9PVkvxtWRQNmecAoMARtvVOE2cmr33ke26IMPQoC
 ONeD+8CXvvl5IQkINWc8dBBxsSpsNY+JsmW4gbxCIhDrVmkwoNmeyQ6HNoHqe50Add9y
 etKmbMJVsYI/8KKCoH12VcRrwrBGbWzZuN7Z1PzZO1qY1D0J9dXWYSiJpWwCXfrPgDBr
 MMYbeWXhev1YdG+Meukulm71mxAMMi9TLWgKLsrcegnKrxsA5tfTZevKmAYt9Gm+hRnH
 s5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=T3DVNLHJQeSHfhXNKz9gWp+Tv1DR+kLOwzGQWhc+nWA=;
 b=EKlk9dUtTaipHRA4dUHUYzr2isDyIjAYyuP1CQpqg6/CZTRK2AsJTidc0Qp0hpvjkQ
 ymP9p0ResOXdhS/XpkIDmxaiQA0XXG0njXNk1bp5y4Jy344CqvxjvaVK5rvJldERqHrw
 Q84WeSbmA7H+1CjUaCxHnql0gZZqdZiAH29V+n7RFVoVk8FuIHoEtiTHjpeBmqf93OFw
 B7qGUkIkK2K8VUiqsngKpg4YSAGnTyUGeQ+JsyNacUl0juM5OxligFH4s8VYbr9fNjew
 49tJKE1khzv249VgWO6TNomX2F3kQBdGivguDDIVeHBLsd/LawGH1URB/vGT2kBDzJxm
 56Pw==
X-Gm-Message-State: AOAM532Pv8ma+NN5rrftcjMpnbHDo0RXkqp3AC+II9JohLLBBUHkWgbC
 VdudCff8l3SBX/6BbAcNoQJPVOodzoiL
X-Google-Smtp-Source: ABdhPJyg2TA0SpbCUUf/oOc4ML06NB7wRTSDPCziI9Y/12+4l5psy1DKY3L9m8r9PO487eIRbvnaGw==
X-Received: by 2002:a63:d7:: with SMTP id 206mr12092114pga.30.1617373655350;
 Fri, 02 Apr 2021 07:27:35 -0700 (PDT)
Received: from work ([103.77.37.174])
 by smtp.gmail.com with ESMTPSA id w4sm8187408pjk.55.2021.04.02.07.27.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 02 Apr 2021 07:27:34 -0700 (PDT)
Date: Fri, 2 Apr 2021 19:57:30 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org
Subject: Re: [PATCH v10 3/4] mtd: rawnand: Add support for secure regions in
 NAND memory
Message-ID: <20210402142730.GA10498@work>
References: <20210401151955.143817-1-manivannan.sadhasivam@linaro.org>
 <20210401151955.143817-4-manivannan.sadhasivam@linaro.org>
 <20210401175421.65db63bf@collabora.com>
 <20210401161622.GH14052@work>
 <20210402105154.0a2a3af5@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210402105154.0a2a3af5@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_152737_772989_D5207D6F 
X-CRM114-Status: GOOD (  18.44  )
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

On Fri, Apr 02, 2021 at 10:51:54AM +0200, Boris Brezillon wrote:
> On Thu, 1 Apr 2021 21:46:22 +0530
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> 
> > On Thu, Apr 01, 2021 at 05:54:21PM +0200, Boris Brezillon wrote:
> > > On Thu,  1 Apr 2021 20:49:54 +0530
> > > Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> > >   
> > > > @@ -565,6 +608,11 @@ static int nand_block_isreserved(struct mtd_info *mtd, loff_t ofs)
> > > >  
> > > >  	if (!chip->bbt)
> > > >  		return 0;
> > > > +
> > > > +	/* Check if the region is secured */
> > > > +	if (nand_region_is_secured(chip, ofs, 0))
> > > > +		return -EIO;  
> > > 
> > > That would is still wrong, you should never pass a 0 size to
> > > nand_region_is_secured().
> > >   
> > 
> > Size doesn't matter here, that's why I passed 0. Maybe 1 would be
> > appropriate?
> 
> You're checking if a block is reserved, so I think passing the
> eraseblock size would make more sense, but I actually don't understand
> why you need to check if the region is secure here (looks like
> nand_block_isreserved() does not access the flash).
> 

Ah yes indeed, brain fade...

Thanks,
Mani

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
