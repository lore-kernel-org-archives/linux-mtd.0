Return-Path: <SRS0=k7nY=OK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D48A2C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 17:37:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5DA8615A6
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 17:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A5DA8615A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HkDWTVDgW8qjEJ1fM2kh4Up7wQW+Gk7Mk/uvAPCdrD4=; b=owHbdyVsys/5gp
	Ua2X+joeL1H7yLwbjjfMpJLtrepJgsebCUkNeXQH2EZBqz2jYsj2jc0EEehdW21jCN7Tt5T62cboy
	TbD5OXYBSzwnRmXCl/sqNzF6eGUfq1w1fysgBnPVknThhAmnADNdDD5+xTHwRk2xaCS6+6ris+c/L
	AVIMTQN+jfC5Vi51X2gO29WTW8LH7r8dpup51TJ7ym2wNHxiJFo7XLWjVMe3v7mFceHCyKU6llRLP
	xIOVgeUzJDojNE8dvQZ79EY8Sm46D+3vhbIeTojj6IixJz2VIdmVHtRlKRgWFjky/Lz7qIB9HKExh
	Y0aPiu3JdKVMeht+SGJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSNDR-002ePC-5V; Mon, 20 Sep 2021 17:36:29 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSNDO-002eNj-FK
 for linux-mtd@lists.infradead.org; Mon, 20 Sep 2021 17:36:28 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18KHaIG1046675;
 Mon, 20 Sep 2021 12:36:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1632159378;
 bh=JehA/AdZ62AVPkLLoqCPDg/CoSo8j/lugoyiuCZiRnQ=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=elLuM0fsfzsZXoNfsPZJ0028D7v8svy0M1v3N4mDFayb5MTLhASXfrWpE2DcT/yoD
 WGlkPW2v5JXRjlJ+8vSgrXy46vPhiVWP+gdmAj98X9HdZ/gy750TskcPWB4z95ngrz
 xwvhFeKniuXdJWpfkPtVNklXp2F7FHxn83oJw1Vo=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18KHaIA1042167
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 20 Sep 2021 12:36:18 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 20
 Sep 2021 12:36:17 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 20 Sep 2021 12:36:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 18KHaGp4011525;
 Mon, 20 Sep 2021 12:36:17 -0500
Date: Mon, 20 Sep 2021 23:06:15 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Serge Semin <fancer.lancer@gmail.com>
CC: Apurva Nandan <a-nandan@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <michael@walle.cc>
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: spi-nand: Convert to DT schema
 format
Message-ID: <20210920173613.oqk6lnmipabkt25s@ti.com>
References: <20210920142713.129295-1-a-nandan@ti.com>
 <20210920142713.129295-2-a-nandan@ti.com>
 <20210920150651.vvdhennblwhdi3jw@mobilestation>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210920150651.vvdhennblwhdi3jw@mobilestation>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_103626_659826_1AFB8480 
X-CRM114-Status: GOOD (  22.62  )
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

On 20/09/21 06:06PM, Serge Semin wrote:
> Hello Apurva
> 
> On Mon, Sep 20, 2021 at 07:57:12PM +0530, Apurva Nandan wrote:
> > Convert spi-nand.txt binding to YAML format with an added example.
> > 
> > Signed-off-by: Apurva Nandan <a-nandan@ti.com>
> > ---
> >  .../devicetree/bindings/mtd/spi-nand.txt      |  5 --
> >  .../devicetree/bindings/mtd/spi-nand.yaml     | 62 +++++++++++++++++++
> >  2 files changed, 62 insertions(+), 5 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.txt
> >  create mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.yaml
[...]
> 
> > +  spi-max-frequency: true
> > +  spi-rx-bus-width: true
> > +  spi-tx-bus-width: true
> > +  rx-sample-delay-ns: true
> 
> Since it's an SPI-client device there are more than these properties
> could be set for it. See the SPI-controller bindings schema:
> Documentation/devicetree/bindings/spi/spi-controller.yaml
> So there is two possible ways to make it more generic:
> 1) Detach the spi-client part from the spi-controller.yaml bindings
> into a dedicated DT-schema file and refer to that new scheme from
> here.
> 2) Forget about these controller-specific properties and let the
> parental SPI-controller bindings parsing them. Of course there must be
> at least one of the next properties declared for it to work:
> {unevaluatedProperties, additionalProperties}.

I proposed a patch series [0] to fix this for SPI NOR, which can be used 
here as well. A re-roll is long overdue though. Let me see when I can 
find time to get to it. In the meantime, this should be fine IMO.

[0] https://patchwork.kernel.org/project/spi-devel-general/list/?series=497129&state=%2A&archive=both


-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
