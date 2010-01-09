Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NTl7M-0004lU-10
	for linux-mtd@lists.infradead.org; Sat, 09 Jan 2010 23:53:20 +0000
Received: by fxm22 with SMTP id 22so22934363fxm.2
	for <linux-mtd@lists.infradead.org>;
	Sat, 09 Jan 2010 15:53:15 -0800 (PST)
Subject: Re: ubiattach fails with "bad image sequence number"
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jeff Angielski <jeff@theptrgroup.com>
In-Reply-To: <1263081089.7315.119.camel@localhost.localdomain>
References: <4B2FF7CF.7040401@theptrgroup.com>
	<1263081089.7315.119.camel@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 10 Jan 2010 01:53:11 +0200
Message-Id: <1263081191.7315.121.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-01-10 at 01:51 +0200, Artem Bityutskiy wrote:
> Hi,
> 
> On Mon, 2009-12-21 at 17:33 -0500, Jeff Angielski wrote:
> > If I ubiformat my NAND partition with an UBIFS image I keep on getting 
> > "bad image sequence number" when I try to do the ubiattach.  If I just 
> > do a plain ubiformat with no image then everything works fine when I 
> > ubiattach.
> > 
> > I was wondering if somebody ran into something similar.  The steps are 
> > so trivial it seems like something fundamentally wrong with either the 
> > mkfs.ubifs or the ubiformat.
> > 
> > I did not see anything related to this on the UBFI FAQ or documentation.
> 
> I believe this is an ubiformat bug. Thanks for reporting and sorry for
> inconvenience.
> 
> I attach and inline 2 patches which should fix this. I cannot have a
> possibility to test them now, so they are untested. They are against the
> latest mtd-utils.git (commit a4e502d99129da8ebba6d40b373a4422a175e9af).

Could you please try them and report if they fix your problem or not?

P.S. when we fix this, we'll have to tag a new mtd-utils version, since
this is a very bad bug.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
