Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B3B7C282D7
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 19:41:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2057820882
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 19:41:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bnBctdcK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="GCZROYdB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2057820882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9m+tHAMX7TQrLh0dGqBulowrpYR84kKVIYpg2omRrW8=; b=bnBctdcKqnmDxA
	CrY4mpZz3nRRa/M9wOPlyF61HUfgPR6UTVbFyvGhm3wI1rHJaTFxHw3NtWfsoDtS5LACDDVr9N3xV
	ln9ubBiKoFW6JTpUeQgf0kony6J2wYUZ84+Z4hQdu6HuEya2Xk4Nil6cux7uBTTi+6WwnsR1Tvyiv
	fQhhQjWMY8oqlTmWZVyCmVYz2YmVO8whRIsWckheoRmod19CB+1MBpkF4uwqjtXasenH5oPLBstMh
	UhtUGpYz023/OLbRZtM9JEzp9FMHZCMzDgHx5JXyfkCI3b6cGo867TYfScDg/9KgFe3WbPAbYsAgk
	SVYYptXviB0Ab0f9YdJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1govjS-0004S1-No; Wed, 30 Jan 2019 19:41:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1govjK-0004J5-JG
 for linux-mtd@lists.infradead.org; Wed, 30 Jan 2019 19:41:07 +0000
Received: from localhost (5356596B.cm-6-7b.dynamic.ziggo.nl [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8BFCD21473;
 Wed, 30 Jan 2019 19:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548877262;
 bh=fF9/4EGUIy+N2ANoKElFW6gKSOdMRwW+wEjrtwpy2h8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GCZROYdBYUgcGe/xisVPs0TbO76M4Ecr24WZfMBWq7Vr+AKmaTDKm+bgBUeNZK/0x
 u9zdx8tkTqGVz4QtgJp1kKDxHHobnJhjTqFsrDt7wgCW+XBJHRtyVlhgxQWcFwNKC2
 smUY74T1efkc2KEb2g2HTjWKIYoz7kpYkXKGXKE0=
Date: Wed, 30 Jan 2019 20:40:59 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH v2 0/2] eeprom: at25: SPI transfer improvements
Message-ID: <20190130194059.GC21181@kroah.com>
References: <20190118140525.29189-1-geert+renesas@glider.be>
 <20190118230740.44239fcf@bbrezillon>
 <CAMuHMdVfVHUQnjwvFikqQJ8HBD+0A7DSCTcdDN4e7V4c=4Usug@mail.gmail.com>
 <20190130145054.GA990@kroah.com>
 <20190130160839.55f99e63@bbrezillon>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190130160839.55f99e63@bbrezillon>
User-Agent: Mutt/1.11.2 (2019-01-07)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_114103_195569_3BC97719 
X-CRM114-Status: GOOD (  21.32  )
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Nguyen An Hoan <na-hoan@jinso.co.jp>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 linux-spi <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Jan 30, 2019 at 04:08:39PM +0100, Boris Brezillon wrote:
> Hi Greg,
> 
> On Wed, 30 Jan 2019 15:50:54 +0100
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> 
> > On Tue, Jan 29, 2019 at 08:02:37PM +0100, Geert Uytterhoeven wrote:
> > > Hi Boris,
> > > 
> > > On Fri, Jan 18, 2019 at 11:07 PM Boris Brezillon <bbrezillon@kernel.org> wrote:  
> > > > Did you consider converting this driver to spimem? Looks like the
> > > > protocol used to communicate with the memory resembles the one used on
> > > > SPI NANDs/NORs and fits pretty well in the spi_mem_op representation.
> > > >
> > > > By doing this conversion you'd allow people to connect an AT25 EEPROM
> > > > to an advanced SPI controller that does not support regular SPI
> > > > transfers and you wouldn't have to forge SPI messages manually.
> > > >
> > > > Here is a patch (only compile tested) doing that. The diffstat is not in
> > > > favor of this conversion, but I find the resulting code cleaner and more
> > > > future proof.  
> > > 
> > > Thanks, seems to work fine, with the 512-byte 25LC040 I have!
> > > 
> > > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > 
> > > I did notice that the first two-byte transfer (command+offset) of each
> > > message is now split in two one-byte transfers, though.  
> > 
> > Ok, I'll drop this patch series and wait for the updated version to be
> > sent out :)
> 
> I'd like to further simplify the patch by using the recently introduced
> devm_spi_mem_dirmap_create() function (queued to Mark's spi/for-5.1
> branch), which means I'll have to wait v5.1-rc1 before sending a new
> version. I'll let you decide if it's worth applying Geert's patches in
> the meantime.

If you all want Geert's patches merged now, someone has to resend them
please :)

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
