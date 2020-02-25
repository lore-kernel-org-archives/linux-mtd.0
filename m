Return-Path: <SRS0=ETWj=4N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A51CFC35E0C
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Feb 2020 17:31:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A63C2084E
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Feb 2020 17:31:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bkJcfXgX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A63C2084E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hNSFxVEWvdzU49B4hS+6Ya0UbZs1lRyUW2xviXHwEvc=; b=bkJcfXgXAISGeT
	tGjpVLAbsFFSQjaIsrDihQHx/kdfpDvJGEUEdx4aJett57DmCybvL01/pB5B55MgfnG3jrkealoVx
	oOPD1P4Y+YJ85kklyXrP8FDUO+fTmla7LfVykWVlmGIarwv5RIATv2xex/IG3nBtCrWxlP0yUUeXT
	MxQ2M9p9rGRtgTCOVMzPdb42laOMMksEE+WTbi+37VGQhLWI5ZbERhpG/jjPkxYh76j3hB+uhYAHT
	+HkFp3xrdmu5Hvs5DiRt9oGM5Wn9CNmeYYGgZgVSLT6Lcq8SLH9BvGpdtvDAveaT94uNWA8Yfwv15
	/gbpgGAcNK5nqWigPH4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6e3d-0007Gh-3i; Tue, 25 Feb 2020 17:31:45 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6e3a-0007EW-1z; Tue, 25 Feb 2020 17:31:43 +0000
Received: by mail-ot1-f67.google.com with SMTP id r16so304888otd.2;
 Tue, 25 Feb 2020 09:31:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QS0K6caHcm4ENnIoTn05eBvdx/7W9kVs7Tic77EWV3U=;
 b=hsIz/bxPRi4SG+/Vu44pJYjU95WbdEzG96YD0bUmWGHIr1QJIyFkwLvz6v/7NetUKc
 8RQ2ffdUFfzk5AbA/H4Vcqj7RUL3hwohsdrvhkTsnkhP5KbT5MR+lU76pQ1WZRNAL+nZ
 SeYYxjbCVI+D05v8JZS1MNkDgX3s+I4AkkzaLCWnmT46aJjGNtpQMR5Zn/f03UjSPpUh
 MLSSCsx1utNwqZ7gGwYAVn88BHYCzj+IOeLprRBVmnclQqNDyPgu9v2JK+HOhnQ6I7eo
 i4mTyiWkeFN/J+BzKms+AlumYx8/aYQzXpL+Q/Qr8iVIxExLhGWQ+tytwm6o/foAhmoJ
 kblg==
X-Gm-Message-State: APjAAAWmlbEdoT0NW7ONQhn8wypTLbWyOtbKNYLJrv3L5ojoUBL5oHg+
 14eeMPXLbYun2hIRVHrfNQ==
X-Google-Smtp-Source: APXvYqwB2+0s7QgvbO4hUWGFqaHT7kZzFUz3IlneivicGP+fTVhYNubNwANumJrX5ONqlNtblqsZ9g==
X-Received: by 2002:a9d:7559:: with SMTP id b25mr44320296otl.189.1582651899014; 
 Tue, 25 Feb 2020 09:31:39 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l12sm5915266oth.9.2020.02.25.09.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 09:31:38 -0800 (PST)
Received: (nullmailer pid 2861 invoked by uid 1000);
 Tue, 25 Feb 2020 17:31:37 -0000
Date: Tue, 25 Feb 2020 11:31:37 -0600
From: Rob Herring <robh@kernel.org>
To: Chuanhong Guo <gch981213@gmail.com>
Subject: Re: [PATCH 0/2] rewrite mtk-quadspi spi-nor driver with spi-mem
Message-ID: <20200225173137.GA31830@bogus>
References: <20200215065826.739102-1-gch981213@gmail.com>
 <20200218125557.GD4232@sirena.org.uk>
 <CAJsYDVL03KJv7eewGekBPCfpbOuTX0tJ6qZaydvJnBDzZ5vEwg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJsYDVL03KJv7eewGekBPCfpbOuTX0tJ6qZaydvJnBDzZ5vEwg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_093142_096472_F93FA678 
X-CRM114-Status: GOOD (  11.69  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, open list <linux-kernel@vger.kernel.org>,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Feb 20, 2020 at 07:58:06AM +0800, Chuanhong Guo wrote:
> Hi!
> 
> On Tue, Feb 18, 2020 at 8:55 PM Mark Brown <broonie@kernel.org> wrote:
> > This is an ABI break so you shouldn't be doing this, if the existing
> > binding works it should continue to work.
> 
> The missing spi-max-frequency is the only part preventing old
> device tree to work with this driver.
> If the goal is to make existing dt binding work, I could patch dt using
> of_add_property in v2. I saw similar device tree patching for legacy
> bindings in pinctrl-single driver.

You should should really only need 'spi-max-frequency' if the max freq 
is less than the minimum of the host and device max freq.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
