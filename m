Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FloAd-0007Zz-Me
	for linux-mtd@lists.infradead.org; Thu, 01 Jun 2006 10:29:21 -0400
Date: Thu, 1 Jun 2006 16:29:07 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Johannes Niess <linux@johannes-niess.de>
Subject: Re: mtd2block should not expand sparse loopback files
Message-ID: <20060601142907.GA15216@wohnheim.fh-wedel.de>
References: <200605272120.19348.linux@johannes-niess.de>
	<625fc13d0605290629h4aabd512q5f53e06a5399fcf7@mail.gmail.com>
	<20060530110354.GA24129@wohnheim.fh-wedel.de>
	<200605302135.57963.linux@johannes-niess.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200605302135.57963.linux@johannes-niess.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 30 May 2006 21:35:51 +0200, Johannes Niess wrote:
> >
> > For now.  I have a patch pending that removes the cleanmarker
> > generation from jffs2.  Still needs some polishing, though.
>
> That is great news. If your patch is still applicable to a released vanilla 
> kernel  (or not requiring too many other patches) I'd volunteer as beta 
> tester. I see potential of wide spread use in "compact" linux distributions. 
> It makes it very easy to use a full scale distribution in reduced space.

"Still needs some polishing" can be read as "I have something
half-arsed that noone should ever see before I rewrite it properly".
Might still take a while.  You shouldn't hold your breath until it
happens.

> I'm quite sure that you have seen the difference of mtd wanting 1's all over 
> the place and a sparse file returning implicit 0's when reading in the holes. 
> I've no idea whether this is relevant.

Known problem.  If I had a time machine, one of the immediate uses
would be to LART whichever genius decided to device "1" as erased and
"0" as written.  The reverse would have had quite some advantages.
Changing it today would break pretty much everything, so without a
time machine, the situation remains as is.

> Following up on Josh's hint to e2compr I had the feeling that 
> "e2compr.infradead.org" would be an address to describe the current 
> status :-)  But that stuff has patches to kernel 2.6.10 . I don't consider it 
> being "alive" enough to be usefull.

Yup.

Jörn

-- 
A victorious army first wins and then seeks battle.
-- Sun Tzu
