Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KztIJ-0005gq-SB
	for linux-mtd@lists.infradead.org; Tue, 11 Nov 2008 13:28:36 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KztIB-0002Na-NY
	for linux-mtd@lists.infradead.org; Tue, 11 Nov 2008 13:28:28 +0000
Received: from 194.95.133.35 ([194.95.133.35])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 11 Nov 2008 13:28:27 +0000
Received: from andre.puschmann by 194.95.133.35 with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 11 Nov 2008 13:28:27 +0000
To: linux-mtd@lists.infradead.org
From: Andre Puschmann <andre.puschmann@imms.de>
Subject: Re: flash read performance
Date: Tue, 11 Nov 2008 14:28:18 +0100
Message-ID: <gfc19i$tpr$1@ger.gmane.org>
References: <ge6old$oo3$1@ger.gmane.org>	<20081029114256.GA2239@yoda.jdub.homelinux.org>	<gea0sh$j97$1@ger.gmane.org>
	<49097176.5010506@thomson.net>	<gec051$efd$1@ger.gmane.org>	<49098716.1010404@thomson.net>
	<490F096D.5060208@imms.de>	<20081104114229.GA1673@shareable.org>
	<49105CAB.3000706@imms.de>	<Pine.LNX.4.64.0811061815190.3864@t2.domain.actdsltmp>	<gf12sb$oo3$1@ger.gmane.org>
	<Pine.LNX.4.64.0811072052200.3864@t2.domain.actdsltmp>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.64.0811072052200.3864@t2.domain.actdsltmp>
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Trant,


Trent Piepho schrieb:
>> map.virt = ioremap(..);
>> map.cached = ioremap_cached(..);
>> map.inval_cache = inval_cache_fct();
> 
> It depends on what mapping driver you're using.  It looks like only the
> pxa2xx driver uses map.cached.  The physmap or of_physmap drivers that I'm
> using don't use it.

The flashmap-drive I am using is custom one made for the gumstix-board. 
However, it is almost identically to pxa2xx-driver from newer kernels.

> I've switched from GPCM to UPM, which lets me use different timings for
> read and write as well as use burst mode.
> 
> In non-cached and guarded mode, I now get 13.61 vs 12.30 MB/s.  That's just
> from slightly better timings because I could make them different for read
> vs write.  The big difference is cached and non-guarded reads, which went
> to 44.79 MB/s from 14.24 MB/s.  That boost is from using burst mode.

Whop, this is great news. Btw. do you drive your flash in asynchronous 
or in synchronous mode? Do you have an extra flash configuration 
register that you need to modify in order to use the burst mode?
My intel NOR flash has an extra read configuration register (RCR). 
However, for some reason I am not able to read/modify/read this register 
successfully.

  > It might be the case that the ethernet module resets the PHY when it 
loads
> and/or when the ethernet device is opened.  That was a problem I was
> having.  The PHY would almost be done when the dhcp client would run and
> open eth0, which would start the phy all over again.

Thanks for that hint. I'll downgrade this as a later task to do.

Regards,
Andre
