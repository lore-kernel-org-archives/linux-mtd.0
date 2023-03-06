Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CECD7C678D4
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Mar 2023 06:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XL+X3AJlI1q3OvnNvB25dpDLqNet7xUoS4f8+q26XYc=; b=RLnrpsBbUSMhYK
	62Q99sV5Dj8mDn7rbowAL4D81oqHeL+O0A0+Ds3CHHCPn74w2mgNEqbvn9LSW4TJ0ATtUsPPVNBwH
	EkcGnSlRaZkpEF5dpApSQMj8PMrJtvvKG2voq19usM9nDHSrsW9jOk6kQE+bQ6Fldsd6f3L/u1r22
	g5HuWT2J02f90nFv8oTom+YrtkKu+LpJpDNKN2Vg8NmA14C8Jqj6tSPWwA72OQrUNKkMvJjvWHI54
	4Mowq/1anadRSTO23tpYummnzSMUb3BgDWWclXmnUR725K3vMlXyXLP87Em7K/jCMFtKbQQ3Whn7S
	0lAChH60pIGT1qqbvzkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ4iE-00Bak8-NQ; Mon, 06 Mar 2023 06:52:46 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ4iC-00BajR-5r
	for linux-mtd@lists.infradead.org; Mon, 06 Mar 2023 06:52:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 76B80B80C98;
	Mon,  6 Mar 2023 06:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0DD0C433D2;
	Mon,  6 Mar 2023 06:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678085561;
	bh=LdHdVZ/G3H9Hdyoc5TYcW5Jamnb6dP/k5fyf44m4Tac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kyqnzKuC6SUfKp9BJZ3TqwcwLwxBVQNN3wNnRFvs3XVsraZGUn6awKMcujpoZDC7s
	 wQ7wB0lD1G8Gi8mZ3Jr2xwbRpk7glRT8IR+Ce6hgBhjSCAgReLMozmOAGULgzW/H4P
	 f6tzIYKQAmIfeB3FaqtzSgRlWyo7UkVMIQnpqw58=
Date: Mon, 6 Mar 2023 07:52:38 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michael Walle <michael@walle.cc>
Cc: linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v4] mtd: spi-nor: fix memory leak when using
 debugfs_lookup()
Message-ID: <ZAWNtv0g6vmADGnb@kroah.com>
References: <20230208160230.2179905-1-gregkh@linuxfoundation.org>
 <f60870dee13900252e0b13fb2f5f05b5@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f60870dee13900252e0b13fb2f5f05b5@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230305_225244_378656_9CAA7CE3 
X-CRM114-Status: GOOD (  18.61  )
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

On Wed, Feb 08, 2023 at 05:15:41PM +0100, Michael Walle wrote:
> Am 2023-02-08 17:02, schrieb Greg Kroah-Hartman:
> > When calling debugfs_lookup() the result must have dput() called on it,
> > otherwise the memory will leak over time.  To solve this, remove the
> > lookup and create the directory on the first device found, and then
> > remove it when the module is unloaded.
> > 
> > Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
> > Cc: Pratyush Yadav <pratyush@kernel.org>
> > Cc: Michael Walle <michael@walle.cc>
> > Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> > Cc: Richard Weinberger <richard@nod.at>
> > Cc: Vignesh Raghavendra <vigneshr@ti.com>
> > Cc: linux-mtd@lists.infradead.org
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> Reviewed-by: Michael Walle <michael@walle.cc>
> 
> one nit below I didn't notice earlier, no need to send a new
> patch version just for that.
> 
> ..
> 
> > +void spi_nor_debugfs_shutdown(void)
> > +{
> > +	if (rootdir)
> > +		debugfs_remove(rootdir);
> 
> debugfs_remove() already has a check for NULL.
> 

Ah, good catch, I merged this in when I applied it to my tree, thanks!

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
