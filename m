Return-Path: <SRS0=6iW2=DF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D3BC2D0A8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2020 15:50:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8131A2075A
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2020 15:50:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DdzR+/Ot"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8131A2075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wUgDjPqODWt2SCL76n2fC0rZ7z588Xjzx6aav3TWXuk=; b=DdzR+/Otb+uYRk6QNivD9aar2
	OVJph843lt03wvV0bP1OpPTR46UCW+BNvnVQxxMgogN3NNkwyeqP+32Y3uCH09jOQRMuma9rkk7WG
	cwIlzhIcIr+wXvc0Tg86bcmKXtJA5e6fGIh/SiqbkJCcDudC8WUV6aCRJAo72c9OV4HAXxlvqrlvx
	FQVJLUmz/KITxdfQvs5iALyd8gN67ba5BuwczZTdgRV2qJU3o23v1koXmjIJj4Szi1RT0PltSlCr0
	88HHk8W7AWitIuNQGLAuzdSmWq26vzPXEd6RV9O7V2v2VXEHlooZ4k1Mg/L4312677ZLpkGZ4x5/j
	xG9Pj/4Hw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMvPo-00084K-QC; Mon, 28 Sep 2020 15:50:12 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMvPl-00083N-OE
 for linux-mtd@lists.infradead.org; Mon, 28 Sep 2020 15:50:10 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 19268FF809;
 Mon, 28 Sep 2020 15:50:06 +0000 (UTC)
Date: Mon, 28 Sep 2020 17:50:05 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v4 1/2] mtd: spinand: micron: Generalize the function
 and structure names
Message-ID: <20200928175005.48783b61@xps13>
In-Reply-To: <20200928174505.75fda272@collabora.com>
References: <20200913161533.10655-1-nthirumalesha7@gmail.com>
 <20200913161533.10655-2-nthirumalesha7@gmail.com>
 <20200915101321.1afa5033@xps13>
 <CALKVOUomKLZ5GEHmXb+VfEq8UiNUpCN-Vqkx3N+yykEnCrHkDA@mail.gmail.com>
 <20200928165528.54e5db6e@xps13>
 <20200928174505.75fda272@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_115009_894042_C4B11D2F 
X-CRM114-Status: GOOD (  18.85  )
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


Boris Brezillon <boris.brezillon@collabora.com> wrote on Mon, 28 Sep
2020 17:45:05 +0200:

> On Mon, 28 Sep 2020 16:55:28 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > > IMHO, grouped means, ecc bytes are at continuous address, where as
> > > interleaved means ecc bytes splitted into multiple addresses    
> > 
> > I don't like the name. Interleaved means that there are OOB bytes
> > stored in the data section, which is not the case here.  
> 
> Well, I would argue that the term interleaved alone doesn't say
> anything about the things that are interleaved. But I guess

I should have said that interleaved, in this subsystem, generally refers
to in-band vs. out-of-band data.

> split/grouped would be fine too if you want to avoid re-using
> interleaved here.

split/grouped is fine by me.

> 
> > The way OOB
> > bytes are organized do not seem relevant to me, I think i prefer the
> > "_4_/_8_" naming,even if it's not very explicit.  
> 
> The ECC strength doesn't say anything about the scheme used for ECC
> bytes placement, and you might end up with 2 different schemes
> providing the same strength, or the same scheme used for 2 different
> strengths.

So perhaps both should be present in the name?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
