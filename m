Return-Path: <SRS0=cHBa=H3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99AA0C433E9
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Feb 2021 13:21:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EC5364EF5
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Feb 2021 13:21:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EC5364EF5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MLEfjiVUxT4iWMLXE1e0XevVTEOYdYs5x8OJ6KL1gIY=; b=VQ47fOp0Fd6ZmuLBNd/tGwdxz
	rX1WjCB0yRj0EYoyu1sF+p+XKamIG0bOu5vkdD29TReeORppbOnJCGF0pU+3H16jp0LWRwbxDZ/fi
	LURBu9GaWPQmvZvgU74f95gjsrrcxjBzpBIAj9Ez0aeM557vKHTEuSz1VgREKUWd0o92yN8ujnQ5b
	nQkrgXEklghf1B7n1Iykm8obHgxTUd/iBbNUKyqeWahjW5CIwIQ+KtxFSVKhd00fGbJ2Fqx4YQpq7
	rx46AY2lbxBVZrvrmbTeqqtuuta+jZETgN+XwLC4/mw6XbueKf2Oikf7YDZYEnpGCHsJjS3YTNQOY
	NkVhU0cng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFGYg-0001CX-DK; Thu, 25 Feb 2021 13:19:58 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFGYe-0001Bx-HT
 for linux-mtd@lists.infradead.org; Thu, 25 Feb 2021 13:19:57 +0000
Received: by mail-pg1-x530.google.com with SMTP id h4so3738022pgf.13
 for <linux-mtd@lists.infradead.org>; Thu, 25 Feb 2021 05:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=MYaVOndqYqRzFcMWeHU+nKNr8k71qXO1KVOhfREMeAw=;
 b=TO16avrGfx98ow4rMCnewYEHt/duYe8C4ZsmuaRCfuXDZU5M8WHcVoA5NHZGN1b9e8
 h1NrZJUqYRL3L0EEnP5VqUN6CCaPsqGGW4J9wqtMS3dgtWdgmFeK/6JBtzy4MuGur0vh
 oa6o9Oz4RiYbVF/AQXdSt0f+QOK0tAhkFA7AAuz2sNCxwkFUAxWcGNZI++hTZF2NzQV8
 o7EmvbCRxJL87Pvobv/6V/xc/JYojRGw4FkxoYLVcTeXBGsCTEwkLpDKkLwK6p3fUYf8
 ORCM/DfTmjjsR2jjGK2ww7PIXOyo90wrVj1BymRDtDpnIKFO1Yqzju8Zf6MtGDWlPvA8
 Pp4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=MYaVOndqYqRzFcMWeHU+nKNr8k71qXO1KVOhfREMeAw=;
 b=rLOvSWELGRkFiOIcpFo0r3Iyttq+KWpEVczO+q9BTUfr0brIO/Pe9W8uvKF0egKpWx
 xiPF/PjCxVHCYwlrahWjwpK3Vq6EwDuP+bFMmbtvEELLtjwp0fqvtLktDsjwSaxyPa8r
 CzsG4h//P4FC0KoZBNhAqdFR7S0sL+tYKplkTVy8P7+gg2rPjIx1ZefId6gzLQCUu6uI
 QBkB1/qBKGljvtdlcDXCBcNj2NDFXPW33mxed7Fgn3IGvBtheLwjYnKS0XDyra3Lyyve
 FXiRoU+e7DsR7lD6w2N1n80j9cAGvEeQeDE3eRIZ0WFcXSiZDhvYg1Amcb43OZSTBMVl
 d/nw==
X-Gm-Message-State: AOAM533NhWrylLz2RW8+OrnWu9RORpnI8DfVErPBHzsMseoFEA5rqP5T
 x0wKcHxdlzQhqZtfVNM4i7Ry
X-Google-Smtp-Source: ABdhPJxhkEfI0s3psqqgzhaH4cXP4KgLt6o7iidjFzncNsP8Dp1PclPkXQbuZYx4j/xM1qSlVLce+Q==
X-Received: by 2002:a62:e708:0:b029:1ed:f93d:e985 with SMTP id
 s8-20020a62e7080000b02901edf93de985mr3369536pfh.48.1614259194082; 
 Thu, 25 Feb 2021 05:19:54 -0800 (PST)
Received: from work ([103.66.79.45])
 by smtp.gmail.com with ESMTPSA id e129sm6561005pfh.87.2021.02.25.05.19.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 25 Feb 2021 05:19:53 -0800 (PST)
Date: Thu, 25 Feb 2021 18:49:48 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 3/3] mtd: rawnand: qcom: Add support for secure
 regions in NAND memory
Message-ID: <20210225131948.GA28614@work>
References: <20210225041129.58576-1-manivannan.sadhasivam@linaro.org>
 <20210225041129.58576-4-manivannan.sadhasivam@linaro.org>
 <20210225084702.2c753b99@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210225084702.2c753b99@xps13>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_081956_856839_158D5536 
X-CRM114-Status: GOOD (  26.07  )
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
Cc: devicetree@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 bjorn.andersson@linaro.org, robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Daniele.Palmas@telit.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

On Thu, Feb 25, 2021 at 08:47:02AM +0100, Miquel Raynal wrote:
> Hi Manivannan,
> =

> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote on Thu,
> 25 Feb 2021 09:41:29 +0530:
> =

> > On a typical end product, a vendor may choose to secure some regions in
> > the NAND memory which are supposed to stay intact between FW upgrades.
> > The access to those regions will be blocked by a secure element like
> > Trustzone. So the normal world software like Linux kernel should not
> > touch these regions (including reading).
> > =

> > The regions are declared using a NAND chip DT property,
> > "nand-secure-regions". So let's make use of this property and skip
> > access to the secure regions present in a system.
> > =

> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> =

> [...]
> =

> >  	config_nand_page_write(nandc);
> > @@ -2830,7 +2865,8 @@ static int qcom_nand_host_init_and_register(struc=
t qcom_nand_controller *nandc,
> >  	struct nand_chip *chip =3D &host->chip;
> >  	struct mtd_info *mtd =3D nand_to_mtd(chip);
> >  	struct device *dev =3D nandc->dev;
> > -	int ret;
> > +	struct property *prop;
> > +	int ret, length, nr_elem;
> >  =

> >  	ret =3D of_property_read_u32(dn, "reg", &host->cs);
> >  	if (ret) {
> > @@ -2886,6 +2922,24 @@ static int qcom_nand_host_init_and_register(stru=
ct qcom_nand_controller *nandc,
> >  		}
> >  	}
> >  =

> > +	/*
> > +	 * Look for secure regions in the NAND chip. These regions are suppos=
ed
> > +	 * to be protected by a secure element like Trustzone. So the read/wr=
ite
> > +	 * accesses to these regions will be blocked in the runtime by this
> > +	 * driver.
> > +	 */
> > +	prop =3D of_find_property(dn, "nand-secure-regions", &length);
> =

> I'm not sure the nand- prefix on this property is needed here, but
> whatever.
> =


I was not sure either but added it since most of the other properties
had it. But I can remove it.

> > +	if (prop) {
> > +		nr_elem =3D length / sizeof(u32);
> > +		host->nr_sec_regions =3D nr_elem / 2;
> > +
> > +		host->sec_regions =3D devm_kcalloc(dev, nr_elem, sizeof(u32), GFP_KE=
RNEL);
> > +		if (!host->sec_regions)
> > +			return -ENOMEM;
> > +
> > +		of_property_read_u32_array(dn, "nand-secure-regions", host->sec_regi=
ons, nr_elem);
> > +	}
> > +
> =

> I would move this before nand_scan().
> =


Okay, I'll do it.

Thanks,
Mani

> If you don't, you should bail out with a nand_cleanup() upon error.
> =

> >  	ret =3D mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
> >  	if (ret)
> >  		nand_cleanup(chip);
> =

> =

> Otherwise lgtm.
> =

> Thanks,
> Miqu=E8l

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
