Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79C4C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Apr 2022 09:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WWctgw+KyZZQKgb+dJjaIR7omAR/hdX7d1l7gvnNNjc=; b=Ycc0M0QPN4SL+W
	cnVDfIa1cyarkVbMQobm0IVbx7CG6AHXLV1hW58vjjiUkOYIIECk17brj2FWMkJwHrFp1+1Hdc4Co
	PUL72Qt0OShv0YCpcoCHrRqhQqQUf2jV6bRnRzEOf7aJMBZHsMfAYm2WG2OtI6nkijbrINcieBtvr
	d/UeWg0b34cOvEbi6PZJsdQwz5g4HxzuHvrUN5qHj1EYo7+7SFeY6T6tg1lhRRamUSnkn8ixoMI5H
	eXFCzWWinyeoK5rOnXQc9j/ReEJghL/qf70gJIyrMoUcrgqbkj+Nn9MiwXJRQELpuV3xGh7kyxYYf
	L/kJwYYCzEfyudik6FBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nevSy-004mAO-Sd; Thu, 14 Apr 2022 09:08:40 +0000
Received: from smtp1.axis.com ([195.60.68.17])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nevOc-004kGj-Ja
 for linux-mtd@lists.infradead.org; Thu, 14 Apr 2022 09:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1649927050;
 x=1681463050; h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5reGpRw2ZgFSQZbtLRzu9ib8DlUy/I3RASjMk4c7wAc=;
 b=FWZubmzBRTD1n1nqYmpd5ADG8eXr+X/I7TVdXZCd3DFjhN0gzvVg26xA
 iqa2XZybq01uiqSBbATSWKkViyFeMaiLQ5HMkCMwa1j3KQb56r4+GQxRm
 OZ8Nnl/IaeRry6Er9Xjehb72M2vKJUDPz2HAFaUDM1SYnvHMCFSuMJTAV
 dY1XWeQX2Y09GNYO9eTNFdu4iXki9SQ7IRaB2Q3t2eaVFf6o/VZg9QSzf
 kG2ACcXl692eRKncSeN4fYUd/yINJTSSq+IO2U2dbQqXPyJqM2f0Hl892
 QcDU+AxCPPEagVxV8FK1pl56FYBTi0jjGWEds9MJpfyzP3v5kwomHGxKb g==;
Date: Thu, 14 Apr 2022 11:04:02 +0200
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: kernel test robot <lkp@intel.com>
CC: "vigneshr@ti.com" <vigneshr@ti.com>, "richard@nod.at" <richard@nod.at>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "joern@lazybastard.org" <joern@lazybastard.org>, "kbuild-all@lists.01.org"
 <kbuild-all@lists.01.org>, kernel <kernel@axis.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "frowand.list@gmail.com" <frowand.list@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/4] mtd: phram: Allow cached mappings
Message-ID: <20220414090402.GA11067@axis.com>
References: <20220412135302.1682890-5-vincent.whitchurch@axis.com>
 <202204131446.omJ5mC54-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202204131446.omJ5mC54-lkp@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_020411_001543_4A9D10D8 
X-CRM114-Status: GOOD (  11.04  )
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

On Wed, Apr 13, 2022 at 08:45:59AM +0200, kernel test robot wrote:
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/io.h:13,
>                     from drivers/mtd/devices/phram.c:21:
>    drivers/mtd/devices/phram.c: In function 'register_device':
> >> arch/sh/include/asm/io.h:274:33: error: expected expression before 'do'
>      274 | #define iounmap(addr)           do { } while (0)
>          |                                 ^~
>    drivers/mtd/devices/phram.c:150:44: note: in expansion of macro 'iounmap'
>      150 |         cached ? memunmap(new->mtd.priv) : iounmap(new->mtd.priv);
>          |                                            ^~~~~~~
>    drivers/mtd/devices/phram.c: In function 'phram_remove':
> >> arch/sh/include/asm/io.h:274:33: error: expected expression before 'do'
>      274 | #define iounmap(addr)           do { } while (0)
>          |                                 ^~
>    drivers/mtd/devices/phram.c:372:53: note: in expansion of macro 'iounmap'
>      372 |         phram->cached ? memunmap(phram->mtd.priv) : iounmap(phram->mtd.priv);
>          |                                                     ^~~~~~~
> 
> 
> vim +/do +274 arch/sh/include/asm/io.h
> 
> d57d64080ddc0f Paul Mundt        2010-01-19  272  
> 13f1fc870dd747 Christoph Hellwig 2020-07-14  273  #else /* CONFIG_MMU */
> 13f1fc870dd747 Christoph Hellwig 2020-07-14 @274  #define iounmap(addr)		do { } while (0)
> 13f1fc870dd747 Christoph Hellwig 2020-07-14  275  #define ioremap(offset, size)	((void __iomem *)(unsigned long)(offset))
> 13f1fc870dd747 Christoph Hellwig 2020-07-14  276  #endif /* CONFIG_MMU */
> d627a2ebd1a303 Paul Mundt        2010-01-28  277  

Thank you for the report.  This patch could certainly be changed to work
around this, but ISTM that the right fix is in the SH header file, since
the problem could hit in other cases too.  I've posted a fix here now:

 https://lore.kernel.org/lkml/20220414081257.1487499-1-vincent.whitchurch@axis.com/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
