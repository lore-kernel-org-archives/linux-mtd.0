Received: from mail46.e.nsc.no ([193.213.115.46])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DlAK4-000186-LY
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2005 14:51:42 -0400
Received: from hjemme (062016183109.customer.alfanett.no [62.16.183.109])
	by mail46.nsc.no (8.12.11/8.12.11) with ESMTP id j5MIpVJL029440
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Jun 2005 20:51:32 +0200 (CEST)
From: Jan Vestby <vestby@alfanett.no>
To: linux-mtd@lists.infradead.org
Date: Wed, 22 Jun 2005 20:51:32 +0200
References: <BAY104-F36C99B1FBD33D805371E6784E80@phx.gbl>
In-Reply-To: <BAY104-F36C99B1FBD33D805371E6784E80@phx.gbl>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200506222051.32784.vestby@alfanett.no>
Subject: Re: boot to MTD-partitioned NAND from DOS w/loadlin?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 21 June 2005 17:11, David L wrote:
> Sorry about the no subject in my last post.  :(
>
> >Hi,
> >
> >
> >Is there a way to maintain this strategy if we use MTD?  I saw in the NAND

Yes. Have you considered using syslinux ?

> >API document that only jffs2 and YAFFS filesystems can be used with MTD.
> >Is there any way around this? (I don't care how efficient it is).  And

It is technically possible to use pretty much any file system, but for 
writable filesystems you will quickly get into trouble without the wear 
levelling  of jffs2/yaffs.
 
> > even if there is a workaround that would allow us to modify files in a
> > DOS filesystem from Linux, will MTD partitions be visible from DOS so
> > that we can boot in the first place?
> >
> >Thanks...
> >
> >                    David

regards 
jan vestby

> >
> >_________________________________________________________________
> >Express yourself instantly with MSN Messenger! Download today - it's FREE!
> >http://messenger.msn.click-url.com/go/onm00200471ave/direct/01/
> >
> >
> >______________________________________________________
> >Linux MTD discussion mailing list
> >http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
> _________________________________________________________________
> Express yourself instantly with MSN Messenger! Download today - it's FREE!
> http://messenger.msn.click-url.com/go/onm00200471ave/direct/01/
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
