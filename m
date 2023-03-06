Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E092C6FD19
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Mar 2023 09:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gS5Q+D3VgluFEa2swV3pYnMuYxAfqECgNnmVR2iV/ig=; b=gpUyj7/pH8pQCz
	eAGYcf4Mg3K1ypkBb2O3yx4fQnqBBr/dhKVqSAPvcB6T4P/MBxliOX58EoYyS2LbxdpNuTQsMtXaj
	fhrojEA8o6kDs5OJz/G/IcUY4Gm7+OGqz8VWaYeS7+Wnd17NjSQ2jqbdobcdV27QxqbTF/wSSQH7g
	ahvA7UEbF8mYbJTQe62s2iPryc/4HDN6apZ25SzTrq3lPcFB7XkfdAWofyuHiNmuLsYm0/dYnRsHb
	ZWkdTYTWOmWUnxEi1SRGG74ZB909hdd8TEe4F+sYqGxQQJLPFIMMhdYVr7ehvTf6qCV2xL/S3usZc
	kMZ6GQcloOqeUDevsTlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ6ui-00C2G2-CI; Mon, 06 Mar 2023 09:13:48 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ6uY-00C2DZ-VA
	for linux-mtd@lists.infradead.org; Mon, 06 Mar 2023 09:13:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8F660B80D22;
	Mon,  6 Mar 2023 09:13:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBAEBC433EF;
	Mon,  6 Mar 2023 09:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678094016;
	bh=md9GsAhD/crhfHfoprueAwoMTeTZuqf04A2dnFJvqLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yrD6jI7ykXwFH2wPsY67rDDDuT69YC4D+f57rPAVI+3wzR/v9iypOEtEp2mEj/rUO
	 f+Ai2JZsrJF4Q80HeImEEDzP8wiszasG2cuN6iVifeZn5wFFJZSBtdx3vh0XN0Er4k
	 s28lSlzJ+aeOcTBF2xe8bhKGONFJVwHIN/BpM0Q0=
Date: Mon, 6 Mar 2023 10:13:33 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Michael Walle <michael@walle.cc>, linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v4] mtd: spi-nor: fix memory leak when using
 debugfs_lookup()
Message-ID: <ZAWuvRHVVV3hTm0e@kroah.com>
References: <20230208160230.2179905-1-gregkh@linuxfoundation.org>
 <f60870dee13900252e0b13fb2f5f05b5@walle.cc>
 <ZAWNtv0g6vmADGnb@kroah.com>
 <20230306093336.523832b0@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230306093336.523832b0@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_011339_218573_CA53C50A 
X-CRM114-Status: GOOD (  25.21  )
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

On Mon, Mar 06, 2023 at 09:33:36AM +0100, Miquel Raynal wrote:
> Hi Greg,
> 
> gregkh@linuxfoundation.org wrote on Mon, 6 Mar 2023 07:52:38 +0100:
> 
> > On Wed, Feb 08, 2023 at 05:15:41PM +0100, Michael Walle wrote:
> > > Am 2023-02-08 17:02, schrieb Greg Kroah-Hartman:  
> > > > When calling debugfs_lookup() the result must have dput() called on it,
> > > > otherwise the memory will leak over time.  To solve this, remove the
> > > > lookup and create the directory on the first device found, and then
> > > > remove it when the module is unloaded.
> > > > 
> > > > Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
> > > > Cc: Pratyush Yadav <pratyush@kernel.org>
> > > > Cc: Michael Walle <michael@walle.cc>
> > > > Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> > > > Cc: Richard Weinberger <richard@nod.at>
> > > > Cc: Vignesh Raghavendra <vigneshr@ti.com>
> > > > Cc: linux-mtd@lists.infradead.org
> > > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>  
> > > 
> > > Reviewed-by: Michael Walle <michael@walle.cc>
> > > 
> > > one nit below I didn't notice earlier, no need to send a new
> > > patch version just for that.
> > > 
> > > ..
> > >   
> > > > +void spi_nor_debugfs_shutdown(void)
> > > > +{
> > > > +	if (rootdir)
> > > > +		debugfs_remove(rootdir);  
> > > 
> > > debugfs_remove() already has a check for NULL.
> > >   
> > 
> > Ah, good catch, I merged this in when I applied it to my tree, thanks!
> 
> Any reasons why you did apply this patch to your tree? It is a spi-nor
> fix, I would have expected it to go through mtd.

It's been sitting around for a month, I assumed it was lost, so I picked
it up.  I can revert it if you don't want me to take it for 6.3-final
through my driver core tree.

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
