Return-Path: <SRS0=LI9S=HF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0876C433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Feb 2021 10:20:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B0AF64E3E
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Feb 2021 10:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B0AF64E3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JNRBRSwHbdYYX75y+kBvkpVyZgwwhKGq6YqxM4V6/rM=; b=xESnmmtHRZtr34MEWU2yoc/2M
	Ix/z1SBoMn3ff+4DPW4N8lebFd3IYLfS6ZtBz9oZ0eOR+M/pNoYVRxpemPSY4hDnf4/aBuSMdw0Lb
	Q0Sctcdgn7XSxfKY6HPvACkPU8DowT3S0b0PpNJTw3Uc95XuSjdSmgL8kCvBxQRMkxkqoOCS4e0Ux
	EEonuMSg+Cqoo6zByOikZwHLDMR/6WxFXx2V+hoVl8xNdpegYsr9ig80j0ZKr2nloW4y96Pv0dyXi
	YF/a+NoNJAHNwEEF/bIljnsw+flyR4+w+IWlgl9bngEkbOOYaflzWUoINMy02CnhUdOJk6C7V7rWZ
	mQd8RBVSg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7FFr-00028s-TH; Wed, 03 Feb 2021 10:19:23 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7FFp-00028M-Il
 for linux-mtd@lists.infradead.org; Wed, 03 Feb 2021 10:19:22 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D17DB1F452BC;
 Wed,  3 Feb 2021 10:19:17 +0000 (GMT)
Date: Wed, 3 Feb 2021 11:19:14 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH] mtd: rawnand: Do not check for bad block if bbt is
 unavailable
Message-ID: <20210203111914.1c2f68f6@collabora.com>
In-Reply-To: <EBDAB319-549F-4CB1-8CE3-9DFA99DBFBC0@linaro.org>
References: <20210130035412.6456-1-manivannan.sadhasivam@linaro.org>
 <20210201151824.5a9dca4a@xps13> <20210202041614.GA840@work>
 <20210202091459.0c41a769@xps13>
 <AFD0F5A6-7876-447B-A089-85091225BE11@linaro.org>
 <20210203110522.12f2b326@xps13>
 <EBDAB319-549F-4CB1-8CE3-9DFA99DBFBC0@linaro.org>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_051921_732510_D930679A 
X-CRM114-Status: GOOD (  17.41  )
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
Cc: vigneshr@ti.com, richard@nod.at, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 03 Feb 2021 15:42:02 +0530
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:

> >> 
> >> I got more information from the vendor, Telit. The access to the 3rd  
> >partition is protected by Trustzone and any access in non privileged
> >mode (where Linux kernel runs) causes kernel panic and the device
> >reboots. 

Out of curiosity, is it a per-CS-line thing or is this section
protected on all CS?

> >
> >Ok, so this is not a chip feature but more a host constraint.
> >
> >In this case it would be a good idea to add a host DT property which
> >describes the zone to avoid accessing it. Something like:
> >
> >	secure-area/secure-section = <start length>;
> >
> >From the core perspective, we should parse this property early enough
> >and return -EIO when trying to access this area.

FWIW, I'm not sure making it part of the core is a good idea, at least
not until we have a different platform with a same needs. The
controller driver can parse it and return -EACCESS (or -EIO) when this
section is accessed.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
