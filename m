Received: from anchor-post-35.mail.demon.net ([194.217.242.85])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AvdMt-00034w-NU
	for linux-mtd@lists.infradead.org; Tue, 24 Feb 2004 14:17:03 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Simon Haynes <simon@baydel.com>
To: David Woodhouse <dwmw2@infradead.org>
Date: Tue, 24 Feb 2004 13:40:05 +0000
References: <4034E8ED.5757.55A2D9@localhost>
	<1077624009.7826.266.camel@hades.cambridge.redhat.com>
	<6927194562DA@baydel.com>
In-Reply-To: <6927194562DA@baydel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <69481CB84E71@baydel.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Corruption.
Reply-To: simon@baydel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 24 Feb 2004 1:04 pm, Simon Haynes wrote:
> On Tuesday 24 Feb 2004 12:54 pm, Simon Haynes wrote:
> > On Tuesday 24 Feb 2004 12:00 pm, David Woodhouse wrote:
> > > On Tue, 2004-02-24 at 09:48 +0000, simon@baydel.com wrote:
> > > > Comitted the sin of posting a reply with the reply text first, sorry.
> > >
> > > And this time you committed the sin of including _far_ more of the
> > > previous mail(s) than was necessary. But I'm not feeling cruel today so
> > > I'll not continue to ignore you :)
> > >
> > > > I have only managed to get this to fail if the jffs2 filesystem is
> > > > mounted as root. I do not seem to be able to get it to close and
> > > > unmount
> >
> > Thanks for the reply I am really struggling with this. I appreciate that
> > this stuff keeps you really busy and I will try to make it as easy for
> > you as I can.
>
> Ah,  I see the ro stuff is a kernel change. I will give it a go.
>

I don't understand. I changed the kernel to use the read only device. I 
expected this to work rw without caching but it does not. I have already 
tried mounting root ro via the caching mtd block and although my system does 
not fully start I can't see how I would get corruption ? 

I have looked at the mtdblock_ro code and it seems you allow writing if flag 
certain bits are set you allow writing. Do I need to set these somewhere ?

Cheers Simon.
