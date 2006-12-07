Received: from e36.co.us.ibm.com ([32.97.110.154])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GsML0-0005Sd-77
	for linux-mtd@lists.infradead.org; Thu, 07 Dec 2006 16:43:19 +0000
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e36.co.us.ibm.com (8.13.8/8.12.11) with ESMTP id kB7GgFOF016550
	for <linux-mtd@lists.infradead.org>; Thu, 7 Dec 2006 11:42:15 -0500
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with ESMTP id
	kB7GgFXj509860
	for <linux-mtd@lists.infradead.org>; Thu, 7 Dec 2006 09:42:15 -0700
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	kB7GgEPu017856
	for <linux-mtd@lists.infradead.org>; Thu, 7 Dec 2006 09:42:15 -0700
Subject: Re: linux-2.6.19-g620034c8 build #163 failed
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Toralf =?ISO-8859-1?Q?F=F6rster?= <toralf.foerster@gmx.de>
In-Reply-To: <200612071732.14114.toralf.foerster@gmx.de>
References: <200612071141.35086.toralf.foerster@gmx.de>
	<1165503148.24220.10.camel@zod.rchland.ibm.com>
	<200612071732.14114.toralf.foerster@gmx.de>
Content-Type: text/plain; charset=utf-8
Date: Thu, 07 Dec 2006 10:42:26 -0600
Message-Id: <1165509746.24220.19.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2006-12-07 at 17:32 +0100, Toralf Förster wrote:
> Am Donnerstag, 7. Dezember 2006 15:52 schrieb Josh Boyer:
> 
> > You have genprobe as a module (as well as core MTD), but AMDSTD compiled
> > in.  That seems very odd.  Try setting CONFIG_MTD_CFI_AMDSTD=m
> > 
> Hi,
> 
> because I used "make oldconfig" I'd assume that teh resulting config file is valid.
> Problems like this are often related to Kconfig oddities, isn't it ?

Typically, yeah.  I'm surprised oldconfig generated that as a result.
If I get a chance, I'll try and recreate that.  Don't wait on me
though :)

josh
