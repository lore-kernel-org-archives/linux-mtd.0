Return-Path: <SRS0=+z0R=Y7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C8ACC5DF60
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2019 09:15:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D31F2187F
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2019 09:15:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lFelwceU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nnqItDtE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D31F2187F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BnsnIKl+0FDxt9T7enMtsoZgLG1XS6xeltGa6mcYaPY=; b=lFelwceUkEthNK
	8r6UKFjx16M5V8epUKs9rlZ+ruWrvr6BltMkny+oNhBy72BqD/ixS3REYviquAPLmIuRPis0EbO8X
	AByEEVmZG1d0gBcZZMIoQpHd2I1zdfmwFBSUEQzoxm7RSm3NJld7gF7UVn4bQvRzyYN+0+CXFA7Q/
	UBX4mT3rh0N0IN0ZwsS3InDDa4/+o7JdmIGubEy1nEb4OK6jutQ2TZP0D2EYs+BG3O7yb6rE8BB7t
	YU3Sw77Qz9JaCqCjmkGnz4kRJrBB7+JnvdP0zICVXJ703p7NcgdmZU4fu2tV7z921l6Fs3MLBJdB5
	dZ3c2eEhB4aLnLZx0bVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSdsy-0001p0-2T; Thu, 07 Nov 2019 09:15:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSdsv-0001oX-61
 for linux-mtd@lists.infradead.org; Thu, 07 Nov 2019 09:15:22 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4A0342187F;
 Thu,  7 Nov 2019 09:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573118120;
 bh=LVUkd/2G54+1KXm08ED6qubBP8aaj3nvMWjP08nx11E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nnqItDtECDcwqXALukQ7aBRBStegYVy9/g4f5HqaJPWGk7yOV0lxo6bAmGk+J2+3r
 ShrOrP1jivuxxN/SIGsOcMJmxbIkpy+2KpqKH8wRhw/D8TLzIl2ZwIflRv/y2oGpbQ
 ot3NcBhh/02RsDSOqw/bwzQxetjG66gCBaVVFthI=
Date: Thu, 7 Nov 2019 10:15:18 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: no need to check return value of debugfs_create
 functions
Message-ID: <20191107091518.GA1328892@kroah.com>
References: <20191107085111.GA1274176@kroah.com>
 <20191107100923.7c94820e@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191107100923.7c94820e@xps13>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191107_011521_255111_67518DFB 
X-CRM114-Status: GOOD (  19.05  )
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
 Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Nov 07, 2019 at 10:09:44AM +0100, Miquel Raynal wrote:
> Hi Greg,
> 
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote on Thu, 7 Nov
> 2019 09:51:11 +0100:
> 
> > When calling debugfs functions, there is no need to ever check the
> > return value.  The function can work or not, but the code logic should
> > never do something different based on this.
> 
> I didn't know about this. Is this something new or has it been the rule
> since the beginning? In the  case, don't we need a Fixes tag here?

It's been the way always, but as of a few kernel releases ago, debugfs
is even more "fault-tolerant" of stuff like this.

And there's no need for a "Fixes:" as this is just work to clean up the
debugfs api and usage (I have a lot more work to do after these types of
changes.)

> 
> > Cc: David Woodhouse <dwmw2@infradead.org>
> > Cc: Brian Norris <computersforpeace@gmail.com>
> > Cc: Marek Vasut <marek.vasut@gmail.com>
> > Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> > Cc: Richard Weinberger <richard@nod.at>
> > Cc: Vignesh Raghavendra <vigneshr@ti.com>
> > Cc: Artem Bityutskiy <dedekind1@gmail.com>
> > Cc: linux-mtd@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> [...]
> 
> > +
> > +	d->dfs_emulate_io_failures = debugfs_create_file("tst_emulate_io_failures",
> > +							 S_IWUSR, d->dfs_dir,
> > +							 (void *)ubi_num,
> > +							 &dfs_fops);
> > +
> > +	d->dfs_emulate_power_cut = debugfs_create_file("tst_emulate_power_cut",
> > +						       S_IWUSR, d->dfs_dir,
> > +						       (void *)ubi_num,
> > +						       &dfs_fops);
> 
> Nitpick: I think we miss an empty line here. I can fix it when applying.

Ah, oops, sorry about that.

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
