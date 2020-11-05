Return-Path: <SRS0=L3KX=EL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F19B2C4742C
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2020 14:45:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79E102087D
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2020 14:45:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZgQuCQa5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79E102087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s5kiuaZND9YK+us2hhR/9otU3XhGAFcQ1j66pHj7o1M=; b=ZgQuCQa5/wn1IeT8as/HCvf1g
	L+5UOa7TYMrlEATbWXF5UwXimVNkhdjwiVKflG5Xwa4SR3JzX5TFbo/JizbV7OUN0qsiwVSLC1FgY
	QsOYQlSvcFJ9cn2TYF8VKy4aVruIRxTSiONUBi4ALUmmYZtNZvjKTUIDwrgQnrY9Zp6rIqXE+2Q8T
	bhq1qE+WjoqENDH6VOWqdmJc++hVZ7fRZyydZrEiLk8XIGtl7Z0fEflk0KD1qLUpv5wu9ih0Hbq35
	pkTlz5EGCVDJIIKE3ykSvTEDkZoRJ4agzR14MUzS3dakg5UoSG4SDy7A/aiWFDkEDGekpvBZauqNb
	v+w6gQK1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kagV8-0007H2-KR; Thu, 05 Nov 2020 14:44:34 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kagV0-0007Cf-Ql
 for linux-mtd@lists.infradead.org; Thu, 05 Nov 2020 14:44:32 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B1C9A1F46471;
 Thu,  5 Nov 2020 14:44:24 +0000 (GMT)
Date: Thu, 5 Nov 2020 15:44:21 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thirumalesha N <nthirumalesha7@gmail.com>
Subject: Re: [PATCH v5] mtd: spinand: micron: add support for MT29F2G01AAAED
Message-ID: <20201105154421.686e0675@collabora.com>
In-Reply-To: <CALKVOUrf6J8Ke-fqv8SuTGMdWf+FDD8yK2RmZ2AtT9KUrJE_Xg@mail.gmail.com>
References: <20201103145901.29372-1-nthirumalesha7@gmail.com>
 <20201103160309.772f3538@collabora.com>
 <CALKVOUrf6J8Ke-fqv8SuTGMdWf+FDD8yK2RmZ2AtT9KUrJE_Xg@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_094427_096681_73717883 
X-CRM114-Status: GOOD (  18.75  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Chuanhong Guo <gch981213@gmail.com>,
 Shivamurthy Shastri <sshivamurthy@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 3 Nov 2020 23:18:54 +0800
Thirumalesha N <nthirumalesha7@gmail.com> wrote:

> Hi Boris,
> 
> On Tue, Nov 3, 2020 at 11:03 PM Boris Brezillon <
> boris.brezillon@collabora.com> wrote:  
> 
> > On Tue,  3 Nov 2020 22:59:01 +0800
> > Thirumalesha Narasimhappa <nthirumalesha7@gmail.com> wrote:
> >  
> > > The MT29F2G01AAAED is a single die, 2Gb Micron SPI NAND Flash with 4-bit
> > > ECC
> > >
> > > Signed-off-by: Thirumalesha Narasimhappa <nthirumalesha7@gmail.com>
> > > ---
> > >
> > > v5: As per the review comments, the changes were reverted to the v2,
> > > except the MT29F2G01AAAED device related (including the review comments)  
> >
> > I don't think that's what Miquel suggested, especially not for the
> > {write,update,write}_cache_variants helpers.
> >  
> 
> 
> I was a bit confused with the multiple levels of comments with the previous
> patch and I renamed *{write,update,write}_cache_var**iants* to *micron_4_**
> to avoid function redefinition.
> Please can you direct me with this patch, what needs to be modified/renamed
> ?

Keep the SPINAND_OP_VARIANTS() as they were in v4 and use the micron_4_
prefix for ECC related stuff.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
