Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KxKIv-00059J-6Q
	for linux-mtd@lists.infradead.org; Tue, 04 Nov 2008 11:42:46 +0000
Date: Tue, 4 Nov 2008 11:42:29 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Andre Puschmann <andre.puschmann@imms.de>
Subject: Re: flash read performance
Message-ID: <20081104114229.GA1673@shareable.org>
References: <ge6old$oo3$1@ger.gmane.org>
	<20081029114256.GA2239@yoda.jdub.homelinux.org>
	<gea0sh$j97$1@ger.gmane.org> <49097176.5010506@thomson.net>
	<gec051$efd$1@ger.gmane.org> <49098716.1010404@thomson.net>
	<490F096D.5060208@imms.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <490F096D.5060208@imms.de>
Cc: Arnaud Mouiche <arnaud.mouiche@thomson.net>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andre Puschmann wrote:
> Hi,
> 
> I spent some more time on this issue and investigated some mtd-maps
> drivers.
> The kernel I am using is a 2.6.21 that comes out of the gumstix 
> svn-repo. Unfortunately, it uses a legacy driver which only does a
> ioremap() but no ioremap_nocache(). Patching the driver with this
> additional call boosts up transfers up to around 5.5MB/s, which
> is a fairly improvement.
> I will send a patch to the gumstix list. Users of newer kernel might
> not need this, as they use a newer driver (pxa2xx-flash.c) anyway.

I don't know much about this area, but will _writing_ to the flash
work reliably if ioremap_cached() is used?

-- Jamie
