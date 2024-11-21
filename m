Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5744E64000
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Nov 2024 18:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qrxa1PTnbKwTpFbucSw6F1y1XtJvuR8Z97DY+DMJH4U=; b=UZ963tXUk66VGU
	RnBVXaxtxR/zHu1m2X8HthW2LcJKIcZqSz6dIJV36teLI+JtwVvl1ns9n72+uenXyyt0yalHIEePJ
	AZk/mA/PICqIUhFXaebUk8HJjhubll87WeF5mLegYxHiRbSyx5RzmNfmJ3FAKaWuVv46uhRlYN3xY
	/+xL7tSFYrehoOdilYlnetUG1fwNFLC2eXBX5VryefSenP+CTG+HOUJl0TU4j9eU0VXUqR5e45kf2
	yqubbnaSLPtk992ObKXPAg0Jf/Y6p+kFlrvQmp3+A3M/qTB2qb9YZd47YWLnlAXf/Xppp2axu5SEm
	GMrXcciDzO6e7T80AmDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEBi5-00000000dRX-16an;
	Thu, 21 Nov 2024 18:15:21 +0000
Received: from lisa.dawes.za.net ([178.63.77.189])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEBi2-00000000dQw-1qV7
	for linux-mtd@lists.infradead.org;
	Thu, 21 Nov 2024 18:15:20 +0000
Received: by lisa.dawes.za.net (Postfix, from userid 1000)
	id 0B4A3140243; Thu, 21 Nov 2024 20:15:13 +0200 (SAST)
Date: Thu, 21 Nov 2024 20:15:13 +0200
From: Rogan Dawes <lists@dawes.za.net>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Parsing extracted i.MX NAND flash
Message-ID: <20241121181513.GA19519@lisa.dawes.za.net>
References: <20241118173939.GA11581@lisa.dawes.za.net>
 <20241120155135.GA27335@lisa.dawes.za.net>
 <1ce8654c-27b8-5f07-f3ca-d8d17c779f73@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1ce8654c-27b8-5f07-f3ca-d8d17c779f73@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_101518_623897_8D718D8C 
X-CRM114-Status: GOOD (  22.03  )
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

On Thu, Nov 21, 2024 at 12:42:16PM +0800, Zhihao Cheng wrote:
> ? 2024/11/20 23:51, Rogan Dawes ??:
> > On Mon, Nov 18, 2024 at 07:39:39PM +0200, Rogan Dawes wrote:
> >> Hi folks,
> >>
> >> I have an i.MX6 target I am trying to get a shell on. It is using High
> >> Assurance Boot and various other configurations to prevent this. My
> >> current approach is to remove the flash, extract the filesystems, modify
> >> one that is not subject to HAB, then put it all back, in order to enable
> >> a shell.
> >>
> >> I have removed the flash, and extracted its contents using an Xgecu
> >> flash reader. Now I need to parse the FCB and extract the actual data
> >> from the dump. I have found imx-nand-tools, but this doesn't work due to
> >> bitrot (the bchlib dependency has moved on while imx-nand-tools has not
> >> been updated).
> > 
> > I was able to get imx-nand-tools working by pinning the version of the
> > bchlib dependency to v0.14.0, and have been able to obtain a "clean"
> > flash image. Still trying to mount the various UBI filesystems, as I get
> > the following errors:
> > 
> > [360972.710050] ubi0: default fastmap pool size: 8
> > [360972.710055] ubi0: default fastmap WL pool size: 4
> > [360972.710056] ubi0: attaching mtd5
> > [360972.710099] ubi0 error: validate_ec_hdr [ubi]: bad VID header offset 2048, expected 512
> 
> Hi Rogan,
> How did you use ubiattach? ubiattach -O 512?  Try 'ubiattach -O2048'.

Hi,

I simply ran it without any specific offset options:

sudo ubiattach -m 5

which produced the panic in my previous mail..

If I try with -O 2048, this is what I get:

$ sudo ubiattach -O 2048 -m 5
[sudo] password for rogan:
ubiattach: error!: cannot attach mtd5
           error 22 (Invalid argument)

[614006.620517] ubi0: default fastmap pool size: 8
[614006.620520] ubi0: default fastmap WL pool size: 4
[614006.620521] ubi0: attaching mtd5
[614006.620749] ubi0: scanning is finished
[614006.620787] ubi0 error: vtbl_check [ubi]: bad CRC at record 11: 0xc8e5abb1, not 0xf116c36b
[614006.620816] Volume table record 11 dump:
[614006.620818] 	reserved_pebs   0
[614006.620819] 	alignment       0
[614006.620820] 	data_pad        0
[614006.620821] 	vol_type        0
[614006.620834] 	upd_marker      0
[614006.620835] 	name_len        0
[614006.620836] 	name            NULL
[614006.620838] ubi0 error: vtbl_check [ubi]: bad CRC at record 11: 0xc8e5abb1, not 0xf116c36b
[614006.620848] Volume table record 11 dump:
[614006.620849] 	reserved_pebs   0
[614006.620850] 	alignment       0
[614006.620851] 	data_pad        0
[614006.620852] 	vol_type        0
[614006.620852] 	upd_marker      0
[614006.620853] 	name_len        0
[614006.620854] 	name            NULL
[614006.620855] ubi0 error: process_lvol [ubi]: both volume tables are corrupted
[614006.620872] ubi0 error: ubi_attach_mtd_dev [ubi]: failed to attach mtd5, error -22

Regards,

Rogan


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
