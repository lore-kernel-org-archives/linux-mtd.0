Return-Path: <SRS0=SuWK=44=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF26C10F27
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 07:57:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDAF720873
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 07:57:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mEmnr4JA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDAF720873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iNiUGxspXVXbE/e+wBlTcTsb1QPzXGaGRCf5X5rRoDA=; b=mEmnr4JAITvxtc
	ZEZgCYOfjhMTkAFLWIPECrVJH/DS6iAMXmv4uTL2/X8C37xHwhLRGAxydin7IKY+dJd56eqYWRbmt
	sENwL/uGvV7r6N1yLB3jq+un5AeZ5ueD3pg6L77k33xjaAicGJmFunLqy4/Zmw5Km7DD5r/bDYIXZ
	t/wb85fq9q3iPr5q8LMApruS0zzfsXSsLqjx1qfPn+pRLLNb7vQ3y+1TKCpP7NPW5QXCknFr9iAN1
	WbpJPZxnyN9EB4C6AczVD7Ly5uTR8kc0z/mxhDtg4bxD3wVtn3qEuZLRhlhplHOSMhCTQl//eBFpT
	gmRrPBxJhyu4VcwNUMzg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBwEg-0004LP-FW; Wed, 11 Mar 2020 07:57:02 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBwET-00047O-FE
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2020 07:56:52 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 94DC628B02D;
 Wed, 11 Mar 2020 07:56:45 +0000 (GMT)
Date: Wed, 11 Mar 2020 08:56:42 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 3/4] mtd: rawnand: Add support manufacturer specific
 suspend/resume operation
Message-ID: <20200311085642.36d91673@collabora.com>
In-Reply-To: <20200311084304.580bec79@xps13>
References: <1583220084-10890-1-git-send-email-masonccyang@mxic.com.tw>
 <1583220084-10890-4-git-send-email-masonccyang@mxic.com.tw>
 <20200310203310.5fe74c57@collabora.com>
 <OF5C883176.AD73134D-ON48258528.000F5185-48258528.001F3544@mxic.com.tw>
 <20200311084304.580bec79@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_005649_675378_EABE6727 
X-CRM114-Status: GOOD (  21.09  )
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
Cc: vigneshr@ti.com, bbrezillon@kernel.org, juliensu@mxic.com.tw,
 richard@nod.at, s.hauer@pengutronix.de, yuehaibing@huawei.com,
 linux-kernel@vger.kernel.org, frieder.schrempf@kontron.de, rfontana@redhat.com,
 linux-mtd@lists.infradead.org, stefan@agner.ch, tglx@linutronix.de,
 masonccyang@mxic.com.tw, allison@lohutok.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 11 Mar 2020 08:43:04 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Mason,
> 
> masonccyang@mxic.com.tw wrote on Wed, 11 Mar 2020 13:40:52 +0800:
> 
> > Hi Boris,
> >   
> > > > diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> > > > index bc2fa3c..c0055ed 100644
> > > > --- a/include/linux/mtd/rawnand.h
> > > > +++ b/include/linux/mtd/rawnand.h
> > > > @@ -1064,6 +1064,8 @@ struct nand_legacy {
> > > >   * @lock:      lock protecting the suspended field. Also used to
> > > >   *         serialize accesses to the NAND device.
> > > >   * @suspended:      set to 1 when the device is suspended, 0 when     
> > it's not.  
> > > > + * @_suspend:      [REPLACEABLE] specific NAND device suspend     
> > operation  
> > > > + * @_resume:      [REPLACEABLE] specific NAND device resume operation
> > > >   * @bbt:      [INTERN] bad block table pointer
> > > >   * @bbt_td:      [REPLACEABLE] bad block table descriptor for flash
> > > >   *         lookup.
> > > > @@ -1119,6 +1121,8 @@ struct nand_chip {
> > > > 
> > > >     struct mutex lock;
> > > >     unsigned int suspended : 1;
> > > > +   int (*_suspend)(struct nand_chip *chip);
> > > > +   void (*_resume)(struct nand_chip *chip);    
> > > 
> > > I thought we agreed on not prefixing new hooks with _ ?    
> > 
> > For [PATCH v2] series, you mentioned to drop the _ prefix 
> > of _lock/_unlock only and we finally patched to lock_area/unlock_area.
> >   
> 
> I missed this _, this is not something we want to add.
> 
> Also, when applying your patches I had several issues because they
> where not base on the last -rc1.
> 
> Finally, I think I forgot a line when patching manually so it produces
> a warning now.
> 
> I am dropping patch 3 and 4, I keep patch 1 and 2 which seem fine.
> 
> Please send a rebased and edited v4 for these, don't forget to drop the
> kbuildtest robot tag and please also follow these slightly edited
> commit logs:
> 
> 2/4
> 
>     mtd: rawnand: Add support for manufacturer specific suspend/resume operation
>     
>     Patch nand_suspend() & nand_resume() to let manufacturers overwrite
>     suspend/resume operations.
> 
> 3/4
> 
>     mtd: rawnand: macronix: Add support for deep power down mode
>     
>     Macronix AD series support deep power down mode for a minimum
>     power consumption state.
>     
>     Overlaod nand_suspend() & nand_resume() in Macronix specific code to
>     support deep power down mode.

And don't forget to propagate the ->suspend() error code to the upper
layer.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
