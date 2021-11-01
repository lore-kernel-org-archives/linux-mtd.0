Return-Path: <SRS0=1Z3h=PU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E79C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Nov 2021 07:47:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5564060E8C
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Nov 2021 07:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5564060E8C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jJboRWrOOY8NBqmjq/s8v1uXu31fcUh4+4hrhJROBHY=; b=m6hPay7MRpmEjQ
	4DScar+1QWusntg9qlY5ZrbrTfWpchJIX+MqIDEiph8QlZ8faEEs/gFYlDexlbqLf7zMaqe5JeXfa
	hUy4fWI5aCx8f9KY9clmrP+3Sum0Bjq5db6ooE1Me+7yIGdJ6uZ6Sb6au93mwZ6hAsOem6B1VAMo8
	RnmV7tUrYZHLbyQnzepmCz041tiWbUcWhdm5KuuC0Z41ag47EiPI8ebQbKeO8/pw8g0MYbOGjpB6B
	NTKItvBWCSDS86OLfYP7Hqt9a8ZYSkxa1sNF0K9zOXdKBfw0cJtOHDE9PjqgRh8fO+P8KyWjV4Qzg
	pT4DiCpkDMRi8xNVQlBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhS25-00FaE1-CJ; Mon, 01 Nov 2021 07:47:05 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhS21-00FaDW-Jt
 for linux-mtd@lists.infradead.org; Mon, 01 Nov 2021 07:47:03 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1AEFA1F4369A;
 Mon,  1 Nov 2021 07:47:00 +0000 (GMT)
Date: Mon, 1 Nov 2021 08:46:52 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] mtd: core: protect access to mtd devices while
 in suspend
Message-ID: <20211101084652.0fe6272f@collabora.com>
In-Reply-To: <20211026055551.3053598-1-sean@geanix.com>
References: <20211026055551.3053598-1-sean@geanix.com>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_004701_825265_2C84FB11 
X-CRM114-Status: GOOD (  23.67  )
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

On Tue, 26 Oct 2021 07:55:47 +0200
Sean Nyekjaer <sean@geanix.com> wrote:

> Follow-up on discussion in:
> https://lkml.org/lkml/2021/10/4/41
> https://lkml.org/lkml/2021/10/11/435
> 
> Changes since v3:
>  - edited commit msg and author for mtdconcat patch
> 
> Changes since v2:
>  - added signoff's to patch from Boris
>  - removed accidential line break
>  - kept tests consistent: master->master.suspended == 0 -> !master->master.suspended
>  - added comments to mtdconcat patch
>  - moved mtdconcat before ('mtd: core: protect access to MTD devices while in suspend')
> 
> Changes since v1:
>  - removed __mtd_suspend/__mtd_resume functions as they are not used by
>    mtdconcat anymore.
>  - only master mtd_info is used for mtd_{start,end}_access(). Warn if we
>    got mtd's.
>  - added Boris patch for using uninitialized _suspend/_resume hooks when
>    bbt scanning
>  - mtdconcat uses device _suspend/_resume hooks
>  - I don't really like the macro proposal from Boris
>    mtd_no_suspend_void_call()/mtd_no_suspend_ret_call() I think they
>    make the code complex to read and the macro's doesn't fit every
>    where anyway...
> 
> Changes since from rfc v1/v2:
>  - added access protection for all device access hooks in mtd_info.
>  - added Suggested-by to [1/3] patch.
>  - removed refereces to commit ef347c0cfd61 ("mtd: rawnand: gpmi: Implement exec_op")
>    from commit msg as commit 013e6292aaf5 ("mtd: rawnand: Simplify the locking") is 
>    to be blamed.
>  - tested on a kernel with LOCKDEP enabled.
> 
> Boris Brezillon (2):
>   mtd: rawnand: nand_bbt: hide suspend/resume hooks while scanning bbt
>   mtd: mtdconcat: don't use mtd_{suspend,resume}()
> 
> Sean Nyekjaer (2):
>   mtd: core: protect access to MTD devices while in suspend
>   mtd: rawnand: remove suspended check

Looks good overall (after fixing the minor things I pointed out, of
course), but I'd recommend applying this series to mtd-next just after
-rc1 is out so you get a chance to detect regressions before it's
merged in Linus' tree. I fear this unconditional blocking on suspended
device will lead to unexpected deadlocks (see my comment on panic
writes)...

> 
>  drivers/mtd/mtdconcat.c          |  15 +++-
>  drivers/mtd/mtdcore.c            | 124 +++++++++++++++++++++++++++----
>  drivers/mtd/nand/raw/nand_base.c |  52 ++++---------
>  drivers/mtd/nand/raw/nand_bbt.c  |  28 ++++++-
>  include/linux/mtd/mtd.h          |  81 ++++++++++++++++----
>  include/linux/mtd/rawnand.h      |   5 +-
>  6 files changed, 230 insertions(+), 75 deletions(-)
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
