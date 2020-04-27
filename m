Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62615C4CECC
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 19:15:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30D7D20775
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 19:15:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rfb6choJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30D7D20775
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=avj7zbSRWDhTyZ6Le1eE5283VVY+Bpf5lUq+lUJl/ow=; b=Rfb6choJ9LfiQM
	jembVduGyQNWV1IZwrMGpHuiSG0ub0sF4jYqc3R/AG0gb3hp4gyjxuaCfVhukAgmL7Hz5l3SHLU03
	ld/VhTrcH8xp14+hqwAvxzdWOhDgCkF4IwIFfWf6wos89KHlOLpFbCV4aESt15xhbkuWmgNA5Ukcn
	sbGQBW3NcMu6ru6Q62F25D5wmqQuZCpv+R0/mojrf+Lo24AHSG4nuULvxKe31IEAfWEm0uSHDoSV6
	DliJRvZz77976CmctLyKsVWLKbWEoGcwQx8obcE1cgq7g8SuE9PUBihsbOFEC6KG3cFkF35dbHj/O
	APx1u9x8+D4k0pVBJLVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT9Do-0006z7-S3; Mon, 27 Apr 2020 19:15:16 +0000
Received: from smtprelay0191.hostedemail.com ([216.40.44.191]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT9Df-0005FL-H3
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 19:15:14 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id 8DCD1181D302B;
 Mon, 27 Apr 2020 19:15:05 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: hope22_839d3c6f86007
X-Filterd-Recvd-Size: 2356
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf04.hostedemail.com (Postfix) with ESMTPA;
 Mon, 27 Apr 2020 19:15:04 +0000 (UTC)
Message-ID: <c324eed2e6c76fd0157969c69e463e7e7b9ba144.camel@perches.com>
Subject: Re: [PATCH 2/3] mtd: lpddr: Replace printk with pr_notice
From: Joe Perches <joe@perches.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, 
 linux-kernel@vger.kernel.org
Date: Mon, 27 Apr 2020 12:15:02 -0700
In-Reply-To: <67c4b34d-019d-e4c9-ebd2-3a8477470048@embeddedor.com>
References: <cover.1588013366.git.gustavo@embeddedor.com>
 <c9684a22b661fdeff9efcd5b18be01653911fc89.1588013366.git.gustavo@embeddedor.com>
 <d036dbad02241fdeb0a6400896f73ff11e98e53b.camel@perches.com>
 <67c4b34d-019d-e4c9-ebd2-3a8477470048@embeddedor.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_121507_659290_25B2BFDB 
X-CRM114-Status: UNSURE (   9.91  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2020-04-27 at 14:10 -0500, Gustavo A. R. Silva wrote:
> 
> On 4/27/20 14:01, Joe Perches wrote:
> > On Mon, 2020-04-27 at 14:03 -0500, Gustavo A. R. Silva wrote:
> > > pr_notice is preferred over printk.
> > 
> > So is coalescing formats
> > 
> > ? diff --git a/include/linux/mtd/pfow.h b/include/linux/mtd/pfow.h
> > []
> > > @@ -127,31 +127,31 @@ static inline void print_drs_error(unsigned dsr)
> > >  	int prog_status = (dsr & DSR_RPS) >> 8;
> > >  
> > >  	if (!(dsr & DSR_AVAILABLE))
> > > -		printk(KERN_NOTICE"DSR.15: (0) Device not Available\n");
> > > +		pr_notice("DSR.15: (0) Device not Available\n");
> > >  	if ((prog_status & 0x03) == 0x03)
> > > -		printk(KERN_NOTICE"DSR.9,8: (11) Attempt to program invalid "
> > > +		pr_notice("DSR.9,8: (11) Attempt to program invalid "
> > >  						"half with 41h command\n");
> > 
> > 		pr_notice("DSR.9,8: (11) Attempt to program invalid half with 41h command\n");
> > 
> 
> I didn't want to mess with the rest of format, because some maintainers
> don't like that. If Miquel is OK with that, I can fix that up, too.

He should.  Coalescing is part of coding-style.

"never break user-visible strings such as printk messages"

cheers, Joe


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
