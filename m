Return-Path: <SRS0=SBmy=KG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 260E3C433ED
	for <linux-mtd@archiver.kernel.org>; Tue, 11 May 2021 16:53:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3D5561378
	for <linux-mtd@archiver.kernel.org>; Tue, 11 May 2021 16:53:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3D5561378
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yPgT3z0jKVuRglovat7T28H088Ydu0QuYp1PXAwV30g=; b=LuKGJJ8HqKNHJ8hMcrra+1X+x
	xsZoJWriyIcPF7bmWR87h6OPyJGYF+E2KdILsf1aI7JxVSxf4mvYEPHQp3XR0A8mqErZ1uLHHkFPr
	AF80XZQzK2XX00KNvVSY+JGidT5MVwEqOfcew710BAss2MRNha3R3NDf9jfAnuzpri7lg1J76i3lG
	m36psrm2ht7AX02odVgzWtrXEr6qJnx+UkyFd5XIltD80LcIoHbzKJNYmKH1ZzkTUBMVJnuNyjJyQ
	rF+3gPnr6JA48frHrKnrPAfg4NWR1FT8FUvI3MSlx+6GLDjfJuWtm/urZzZkerfkXLIwM4I5aDRhH
	4M4Bu04CQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgVd0-000pPF-Tv; Tue, 11 May 2021 16:53:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgVTD-000nDT-F6
 for linux-mtd@desiato.infradead.org; Tue, 11 May 2021 16:42:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=i6NFs8vxyUIQzFSySZENCCu3Y7sWd2d1iJJ/CdcroVU=; b=LfhL+pB0n8P/Z1alrkWFRFUT98
 T+nJsT2r2BzWE1lO9I+ZBbOqjIkXiRfMp3xLnIvJaE6AjF+Pn7Gn23NMOR1U2ZBS3CzK+aIonitZ2
 6qES4f0BsSxARh4dPEWiTyJ5R9MMdhpdzmFvHqEozHDKWQ/0pjdDADqjTr/40eFrKvQFWngyml9YG
 vRvVfsQM9VcBySGTcwOOt7wIYn0ssq0o2Gu9CsUHaUoKTk9rpINrmLaHyuI0ksKx280MC+jP0FLkW
 uZ2D5Vj6O3anI9ylduTW/iiuIxsAg7ssnLZR2zgRfA+bPTLZW02uFzz45oX8ZTqR+3ILjb3zlQSg6
 RhEqDScw==;
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgVTA-009mCE-Kz
 for linux-mtd@lists.infradead.org; Tue, 11 May 2021 16:42:54 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9F4B367373; Tue, 11 May 2021 18:42:49 +0200 (CEST)
Date: Tue, 11 May 2021 18:42:48 +0200
From: Christoph Hellwig <hch@lst.de>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Christoph Hellwig <hch@lst.de>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Jan Kara <jack@suse.cz>,
 Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v4] mtd: super: don't rely on mtdblock device minor
Message-ID: <20210511164248.GA18867@lst.de>
References: <20210510121837.14274d4f@xps13> <YG9qzC/SaD7SNWVm@makrotopia.org>
 <YHRj5MUb5MGdPQqw@makrotopia.org> <YJmx3Ru/5oyq6Y1a@makrotopia.org>
 <20210511054955.GA6542@lst.de> <YJo42y+lP9peFlkd@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJo42y+lP9peFlkd@makrotopia.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_094252_847417_BF54F3E7 
X-CRM114-Status: GOOD (  15.90  )
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

On Tue, May 11, 2021 at 08:57:15AM +0100, Daniel Golle wrote:
> > Why are you changing the legacy lookup method that is clearly deprecated
> > in favor of the mdt* syntax?
> 
> Because it breaks if part_bits != 1 and despite being legacy, it should
> not break (it would open the wrong MTD device).

Or we should just drop it if it doesn't even work.

> I do check the major number above to be MTD_BLOCK_MAJOR, and in that
> case I assume that my expectations towards private structure will hold
> true. If not, please enlighten me.

No, you can't.  There's always the chance some other driver grabs
the major.  Take a look at what e.g. ubd does to grab the IDE major.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
