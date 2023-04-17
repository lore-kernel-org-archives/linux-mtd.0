Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A95C77B7A
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Apr 2023 17:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yQTapgxRKnFGyXDfEPzk25orLm67OtsftNwj6hVUCys=; b=Vo6n7tb1wi30Lq
	We5x/gRDGBJGY7cjhrruwuPXjIYklBtAxIgIfmhFBvSqFH5wM1hF2jooUHycDcJaSzUcLwruEK2tp
	4n4lz2U63QB4bwPmZndNQNSX6o6e1e/C5NgBhEk7wvxkLJuOZjFbRHwO+qEoC4b/lyma0JavDHULx
	h+YktvbI+fsedmXhqR8O8H0Umvn4AQtevfcC36gz5JQQk08A/B0SC1kxcwDV4xVJgCIAAz4pA+lAK
	3PKpDqa3PC/6LTl8ZJ7GR/DU9CsDfHseXiEKCCpGT+U6bdXkDn7hOafRjYzAuEy2DItjSvYwajdSs
	eaUnZEqNvh9a5UP0eBew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poSml-00HBsd-1z;
	Mon, 17 Apr 2023 17:37:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poSmi-00HBsC-2U
	for linux-mtd@lists.infradead.org;
	Mon, 17 Apr 2023 17:37:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 47E566103E;
	Mon, 17 Apr 2023 17:36:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FCBFC433EF;
	Mon, 17 Apr 2023 17:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1681753018;
	bh=Xp2HnRH3xAE2CbDrq1C4eD6tnnEYlkdNoCN7S/+r+xc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ughUkU0MrZPSRwztX3ydIdveuq86YDXcStVNtmlPB8yYuMfwLi9fjwre6y1qR5K1y
	 k9xax3NskLl+AB2O1ZvydRRrjaPa3M71I2hh5RwDVER0sBy5QPsZyEG6JjUGQ5jV6u
	 JZ8Y7Y+2dJFG+Fs1DfZscIEorBOYJfFPpd836jws=
Date: Mon, 17 Apr 2023 19:36:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: stable@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	chengzhihao1 <chengzhihao1@huawei.com>,
	Nicolas Schichan <nschichan@freebox.fr>,
	George Kennedy <george.kennedy@oracle.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	yi zhang <yi.zhang@huawei.com>
Subject: Re: Request to pick "ubi: Fix failure attaching when vid_hdr offset
 equals to (sub)page size"
Message-ID: <2023041740-steering-palatable-5451@gregkh>
References: <ZDrmsnX5BHxtBNwf@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZDrmsnX5BHxtBNwf@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_103700_877618_86A2B0A0 
X-CRM114-Status: GOOD (  12.49  )
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

On Sat, Apr 15, 2023 at 07:02:26PM +0100, Daniel Golle wrote:
> Hi,
> 
> please pick
> 
>  1e020e1b96afd ("ubi: Fix failure attaching when vid_hdr offset equals to (sub)page size")
> 
> from linux-next to stable trees.
> The commit fixes a problem with another recent commit
> 
>  1b42b1a36fc94 ("ubi: ensure that VID header offset ... size")
> 
> which has already made it to stable trees and thereby broke attaching
> UBI and hence renders devices unbootable.
> 
> As a temporary fix I have applied this patch downstream in OpenWrt.

Now queued  up, thanks.

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
