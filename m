Return-Path: <SRS0=TxUZ=KP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6042C433B4
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 19:48:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F2EB611AB
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 19:48:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F2EB611AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9J/jIpl1v4KXaEyEkgj26RHsNDzo96L0iL89X4j1tKs=; b=F+LLqjeaxaL9NYv4ccyH/Mw81N
	7JMcLjJkR+atAPzRR2cfIis/dJejw+csc3QiWpDQP/ZkP1xfT3nchOaiX2X+HEDXLAdFCow6Fdjbg
	53E7K46Qmm/S38tL21D5x8og36Z+qAFllhN2kbCKFSnPYw/wPXgFGfZ9PXdWC/Am8Hfj+48ZcUiaP
	NpYx6pcoujLt40vkqFsyLu/Nge245HQuNFZ85+KScuwDLGwXbmGAJ1zQIzKlzPXD4+U8Q6umSQYsS
	sICGkaGTe4prFPT/9V9AJYQKfvP1pGTyKDZaZnkZGnCBA2lTRy6my7wSCYL99z+Kz9jM1Viss3bXA
	RJNHSb7Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljode-002Xyc-1W; Thu, 20 May 2021 19:47:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljodW-002XxB-Jt
 for linux-mtd@desiato.infradead.org; Thu, 20 May 2021 19:47:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:References:
 In-Reply-To:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=2cqJ9Lm92bfvueGLR5tvGXUavON1VXTGmNbJD+CtptU=; b=u2/EH6YjUw+WhkciT283HRbMB7
 sBbXrpvqD77uMQiUS3dPP0ZuTmzjgge+sBKTA7z5I7j20vW64Z8h+9IP57ZxVxoDK50uQF2tuvnnr
 ZJOe5JjEcn1Fc+ZajcZuwQEWDgB6F33VJQOqMko8hrljFGmtC+pkDgjt9ClW8j6uAVnS7I4KGRfwx
 IxY9TD0CpkCem3VOcJpibC3DyDxDAYq5mLa976XsqaFg9on1mq6/RpykZQiRGJHIW4hx38EBEOrZJ
 hGp12gneFg9kIY+et4jNjRMFjjl4vSUWh5BxGEdSDJ7klODfCHrzU+1KKn9oAT7fcOiomAX3mDls9
 0wn7+Jfw==;
Received: from mail-ot1-f45.google.com ([209.85.210.45])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljodR-00Gd39-FE
 for linux-mtd@lists.infradead.org; Thu, 20 May 2021 19:47:10 +0000
Received: by mail-ot1-f45.google.com with SMTP id
 80-20020a9d08560000b0290333e9d2b247so5373938oty.7
 for <linux-mtd@lists.infradead.org>; Thu, 20 May 2021 12:47:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=2cqJ9Lm92bfvueGLR5tvGXUavON1VXTGmNbJD+CtptU=;
 b=aNQF28s9+fvx34CVezlO7ntP49awOmPDViOIwZT6wRNZizwRn0a4mT2z5CqbstllSS
 xj8SfQIDhUblFMPWDmd4NLrRSLVoEAJ/XMVZB/P6mM02Co7TBRE4kow60O/rw/nMc9G5
 oTuIaYGMua9c0lBrYxOabasuGA5n1yZ4CM7434ID3YTls2NF1hlWMVr8ImKVYgbBXzl7
 /FuFnhNjfxGQfiecQvOttQfReLFe7OoQegfDMJLNiaJWrg7KHzHZvJkfETsYB2+uwOdz
 ZU/UdiDneL7OPXD7c5WssJZiQnomdCzu8KDwPrT99RxJHGjP2Qh7brOTuSDDFmts1Y6e
 /Vww==
X-Gm-Message-State: AOAM533NbU1pa365y2u/1rUsYAxYfZPK9tmTB9oAx7IUtdTPNnm4Z1dA
 tUsg6XdxuYajLsVSfc2p2A==
X-Google-Smtp-Source: ABdhPJzJjXyZ1VC2/9pFKedH1RRswHevC8vq2DoHe1NWhWt/JyAMDE2wOWuwF6XbpLZQiR1evfVvpw==
X-Received: by 2002:a9d:5e0a:: with SMTP id d10mr5097616oti.44.1621540027673; 
 Thu, 20 May 2021 12:47:07 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r83sm714200oih.48.2021.05.20.12.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 12:47:06 -0700 (PDT)
Received: (nullmailer pid 1823977 invoked by uid 1000);
 Thu, 20 May 2021 19:47:05 -0000
From: Rob Herring <robh@kernel.org>
To: Corentin Labbe <clabbe@baylibre.com>
Cc: devicetree@vger.kernel.org, richard@nod.at, linus.walleij@linaro.org,
 miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org, robh+dt@kernel.org,
 vigneshr@ti.com, linux-kernel@vger.kernel.org
In-Reply-To: <20210520115732.1276569-1-clabbe@baylibre.com>
References: <20210520115732.1276569-1-clabbe@baylibre.com>
Subject: Re: [PATCH] dt_bindings: mtd: partitions: redboot: convert to YAML
Date: Thu, 20 May 2021 14:47:05 -0500
Message-Id: <1621540025.698388.1823976.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_124709_531827_908768B4 
X-CRM114-Status: GOOD (  11.36  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 20 May 2021 11:57:32 +0000, Corentin Labbe wrote:
> Converts mtd/partitions/redboot-fis.txt to YAML.
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  .../bindings/mtd/partitions/redboot-fis.txt   | 27 ------------
>  .../bindings/mtd/partitions/redboot-fis.yaml  | 42 +++++++++++++++++++
>  2 files changed, 42 insertions(+), 27 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/partitions/redboot-fis.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/redboot-fis.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/mtd/partitions/redboot-fis.example.dts:19.17-24.11: Warning (unit_address_vs_reg): /example-0/flash@0: node has a unit name, but no reg or ranges property

See https://patchwork.ozlabs.org/patch/1481605

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
