Return-Path: <SRS0=BWs3=QP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0733BC282CB
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 09:23:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6E0D21919
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 09:23:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UXIqBmXd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6E0D21919
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jOm1UQGj+zY7taVnTwogs1zAky75Nu1W7N7Lp2NwpCE=; b=UXIqBmXdT6oRES
	9jERKGGbotvDHNSJGGR7+n484Faplc/1oWId60VrdqnFYgn+ZGvQzW4P9UBlLER4IqecpapeIFM0k
	+EV8T5DTFvN3LOpsSf56chktqdD6jfCMglQN2jXUl06gEIzlGLiDc20m0jtbhNBzV4h18vQtEQqWO
	NbxNU9+UDAhnG+QqVjNcJeMDp417b7aaFcvAjoHpKbMOwfmqf6kvDeuMPL6ffSRhdNuEAy4YFgQy6
	ZbHL03z3qKih5GF7BPRebLFwSPVkxn4qThs2qtY+6zdRySt5gJquRnkFf/N8aoKmLUzXuiveUDd61
	6SKeAEUo4pQAVukmnv3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gs2O1-0004eV-3D; Fri, 08 Feb 2019 09:23:53 +0000
Received: from smtprelay0039.hostedemail.com ([216.40.44.39]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gs2Nx-0004dz-IO
 for linux-mtd@lists.infradead.org; Fri, 08 Feb 2019 09:23:51 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 91D4418224D73;
 Fri,  8 Feb 2019 09:23:40 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: card36_7731ced553b11
X-Filterd-Recvd-Size: 2421
Received: from XPS-9350 (unknown [47.151.153.53])
 (Authenticated sender: joe@perches.com)
 by omf12.hostedemail.com (Postfix) with ESMTPA;
 Fri,  8 Feb 2019 09:23:38 +0000 (UTC)
Message-ID: <7e1121479b38e98949b44c9fba91dee3adf97b99.camel@perches.com>
Subject: Re: [PATCH 07/11] mtd: rawnand: denali: use bool type instead of
 int where appropriate
From: Joe Perches <joe@perches.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 08 Feb 2019 01:23:37 -0800
In-Reply-To: <1549613335-30319-8-git-send-email-yamada.masahiro@socionext.com>
References: <1549613335-30319-1-git-send-email-yamada.masahiro@socionext.com>
 <1549613335-30319-8-git-send-email-yamada.masahiro@socionext.com>
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_012349_665871_0048B653 
X-CRM114-Status: GOOD (  11.61  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 2019-02-08 at 17:08 +0900, Masahiro Yamada wrote:
> Use 'bool' type for some function arguments.
> 
>  - write (write or read?)
>  - raw (the raw access mode or not?)
> 
> It is true that denali_nand_info::dma_avail is also boolean, but
> I am keeping it as 'int' because 'scripts/checkpatch --strict' would
> report the following:
> 
> CHECK: Avoid using bool structure members because of possible alignment issues
>   - see: https://lkml.org/lkml/2017/11/21/384
> 
> I do not think it is a matter here, but I am sticking to the suggestion.

just fyi: that suggestion has been removed by:

commit 7967656ffbfa493f5546c0f18bf8a28f702c4baa
Author: Jason Gunthorpe <jgg@ziepe.ca>
Date:   Fri Jan 18 15:50:47 2019 -0700

    coding-style: Clarify the expectations around bool
    
    There has been some confusion since checkpatch started warning about bool
    use in structures, and people have been avoiding using it.
    
    Many people feel there is still a legitimate place for bool in structures,
    so provide some guidance on bool usage derived from the entire thread that
    spawned the checkpatch warning.
    
    Link: https://lkml.kernel.org/r/CA+55aFwVZk1OfB9T2v014PTAKFhtVan_Zj2dOjnCy3x




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
