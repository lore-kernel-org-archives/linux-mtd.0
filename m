Received: from mo-p07-ob.rzone.de ([81.169.146.188])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HjwLl-0008DJ-VQ
	for linux-mtd@lists.infradead.org; Fri, 04 May 2007 07:54:26 -0400
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org
Subject: Re: RO jffs2 implementation for bootloader
Date: Fri, 4 May 2007 13:53:42 +0200
References: <loom.20070503T102421-36@post.gmane.org>
	<1178186163.7539.62.camel@sauron> <463B02F5.6060503@parrot.com>
In-Reply-To: <463B02F5.6060503@parrot.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200705041353.43372.sr@denx.de>
Cc: Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Matthieu,

On Friday 04 May 2007 11:55, Matthieu CASTET wrote:
> > On Thu, 2007-05-03 at 08:40 +0000, Matthieu CASTET wrote:
> >> I need to mount a jffs2 partition in a bootloader. I tried u-boot that
> >> support jffs2, but it is very slow (2 minutes for mounting a 64MB
> >> partition). Do you know if there are other (fast) implemenation of jffs2
> >> suitable for a bootloader ?
> >
> > Not sure about any existing "fast" implementation, but mounting a JFFS2
> > partition is about scanning whole partition. You may optimize some
> > thing, but you have to scan anyway.
>
> Well u-boot implementation is very slow. For 64MB partition : 2 minutes
> for u-boot

This really is slow. 64MB isn't that big and shouldn't take that long to 
mount.

> and 11 s for linux (3s with summary). 

So it can be done better.

Did you think about improving the performance in U-Boot? If so, please let's 
move this discussion to the u-boot-users mailing list.

Thanks.

BTW: What cpu at what speed are you using?

Best regards,
Stefan
