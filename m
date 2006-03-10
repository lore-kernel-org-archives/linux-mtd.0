Received: from wproxy.gmail.com ([64.233.184.207])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FHjeo-0007Pr-GH
	for linux-mtd@lists.infradead.org; Fri, 10 Mar 2006 10:36:04 -0500
Received: by wproxy.gmail.com with SMTP id i21so741064wra
	for <linux-mtd@lists.infradead.org>;
	Fri, 10 Mar 2006 07:35:54 -0800 (PST)
Message-ID: <625fc13d0603100735o37c96bcfl78b213eab41b5e54@mail.gmail.com>
Date: Fri, 10 Mar 2006 09:35:54 -0600
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Nicolas Pitre" <nico@cam.org>
In-Reply-To: <Pine.LNX.4.64.0603101027230.3274@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <20060310135431.62022.qmail@web86903.mail.ukl.yahoo.com>
	<Pine.LNX.4.64.0603101027230.3274@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org, Adam Ward <adamward2005@yahoo.co.uk>
Subject: Re: Read only forced on jffs2 by mtd layer?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3/10/06, Nicolas Pitre <nico@cam.org> wrote:
> On Fri, 10 Mar 2006, Adam Ward wrote:
>
> > My jffs2 image will mount as ro.
> > If I do 'mount / -o remount,rw' it appears to be
> > happy, but I soon get told 'Read-only file system' if
> > I try anything too presumptuous!
> >
> > As running mount still declares it as read/write, I am
> > assuming the error is with the mtd block driver
> > refusing to co-operate.
> >
> > Is there anything you guys can suggest that I should
> > pay closer attention to?
>
> Did you unlock the flash partition with the flash_unlock tool?
> Some NOR flash parts initialize themselves with all sectors locked by
> default.

Also, does your JFFS2 filesystem have free space available?  If a
minimum amount of free eraseblocks are not present, JFFS2 will mark
itself as read-only no matter what you do.

josh
