Received: from dsl-64-130-201-237.telocity.com ([64.130.201.237] helo=Dual166.localdomain)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16MXjb-0003iP-00
	for <linux-mtd@lists.infradead.org>; Fri, 04 Jan 2002 17:02:23 +0000
Reply-To: <acurtis@onz.com>
From: "Allen Curtis" <acurtis@onz.com>
To: "Patrick Allaire" <pallaire@gameloft.com>,
        "David Woodhouse" <dwmw2@infradead.org>
Cc: =?iso-8859-1?Q?Bj=F6rn_Eriksson?= <mdeans@algonet.se>,
        <linux-mtd@lists.infradead.org>
Subject: RE: From 2.4.9 to CVS ??? 
Date: Fri, 4 Jan 2002 09:04:48 -0800
Message-ID: <NCBBIINEHIPFGJPLBEIFGEDBDDAA.acurtis@onz.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
In-reply-to: <9A1957CB9FC45A4FA6F35961093ABB8406456EDF@srvmail-mtl.montreal.ubisoft.org>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Try putting a couple kprint() statements in init/main.c where it is trying
to load init. That is how I found the problem. (Did you check the loader?)
The problem I had was that the executable was found but a suitable loader
was not.....

> -----Original Message-----
> From: linux-mtd-admin@lists.infradead.org
> [mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of Patrick Allaire
> Sent: Friday, January 04, 2002 9:01 AM
> To: David Woodhouse; Patrick Allaire
> Cc: Björn Eriksson; linux-mtd@lists.infradead.org
> Subject: RE: From 2.4.9 to CVS ???
>
>
> I really dont understand ... I have a sh link in /bin ... but it is not
> found by the kernel ... and my cramfs didnt changed a bit !!!
>
> in /bin, I have a link : sh -> busybox
>
> Patrick Allaire
> mailto:pallaire@gameloft.com
> If you can see it, but it's not there, it's virtual.
> If you can't see it, but it is there, it's hidden.
> It you can't see it and it isn't there, it's gone.
>
>
>
> > -----Original Message-----
> > From: David Woodhouse [mailto:dwmw2@infradead.org]
> > Sent: January 4, 2002 11:54 AM
> > To: Patrick Allaire
> > Cc: Björn Eriksson; linux-mtd@lists.infradead.org
> > Subject: Re: From 2.4.9 to CVS ???
> >
> >
> >
> > pallaire@gameloft.com said:
> > >  No I dont have 'bad cramfs magic' !!! I tought it could be the case
> > > ... but I looked at the mkcramfs.c from the 2.4.9 and 2.4.17 version
> > > and there is no difference So the generated code should be
> > the same.
> >
> > P'raps we started paying attention to execute bits on
> > libraries between
> > 2.4.9 and 2.4.17? I thought we did that a long time ago though.
> >
> > Put a statically linked shell in the cramfs and boot with
> > that as init.
> > Then try running /sbin/init and see what errors you get.
> >
> >
> > --
> > dwmw2
> >
> >
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
