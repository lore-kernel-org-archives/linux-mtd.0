Received: from web9602.mail.yahoo.com ([216.136.129.181])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19FF8o-0006dx-Nk
	for <linux-mtd@lists.infradead.org>; Mon, 12 May 2003 16:23:02 +0100
Message-ID: <20030512152319.11494.qmail@web9602.mail.yahoo.com>
Date: Mon, 12 May 2003 08:23:19 -0700 (PDT)
From: Mike Kelly <mgkelly59@yahoo.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1052750673.23450.10.camel@passion.cambridge.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Re: Is it normal to have a defunct jffs2_gcd_mtd1 process?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--- David Woodhouse <dwmw2@infradead.org> wrote:
> On Mon, 2003-05-12 at 15:40, Mike Kelly wrote:
> > When I do a 'ps' command I get the following
> (partial
> > list):
> > 
> > PID  TTY  TIME     CMD
> >  8    ?   00:00:00 jffs2_gcd_mtd1 (defunct)
> > 12    ?   00:00:00 jffs2_gcd_mtd1
> > 
> > Is it normal to have a defunct jffs2 garbage
> > collection process?  Or should I be concerned?
> 
> It's fine -- when you remount the old one gets
> killed and a new one gets
> restarted. Although this looks like you're starting
> off with a
> read/write file system and then remounting it
> read/write -- which is a
> little unnecessary :)
> 
> The fact that it remains defunct is probably an init
> bug.
> 
> -- 
> dwmw2
> 
I wasn't aware that I was mounting it twice.  I have
"root=/dev/mtdblock1 rw" in the default string for the
command line options (I am using MontaVista's TCT gui
program for configuring and building the kernel). 
Where else might I be mounting it?

Thanks,
Mike

__________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo.
http://search.yahoo.com
