Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EKtB9-0000Ip-9j
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 03:50:36 -0400
Date: Thu, 29 Sep 2005 09:50:15 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: zhao forrest <zhao_fusheng@hotmail.com>
Message-ID: <20050929075015.GB16687@wohnheim.fh-wedel.de>
References: <20050928081635.GA16484@wohnheim.fh-wedel.de>
	<BAY17-F17BAE916A33A743D7E8592E88C0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BAY17-F17BAE916A33A743D7E8592E88C0@phx.gbl>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH]1:1 mapping(revision 2)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 29 September 2005 11:04:14 +0800, zhao forrest wrote:
> 
> Since we have gone through the review, the patch is in good quality.
> On the other hand, I even saw the check-in of new feature today. Then why
> only I should wait for this one month delay??
> So if there's no solid reason, I'll check in the patch today.

Reason remains unchanged.  We have merged quite a bit of stuff, most
notably the ebs patch from Ferenc.  Ebs appears to have caused some
trouble for some people, so we have semi-known unfixed bugs in cvs.

This is a good time to settle down and wait for a while, before
introducing new bugs.  Once the existing stuff is fixed or it appears
as if all bug reports were bogus (could also be), we can start merging
new feature (which always have new bugs as well).

Not sure what you considered to be the new feature today.  Kyunmin's
onenand stuff is confined to drivers/mtd and doesn't have any
influence on jffs2 for existing users.  If it did, I'd still not merge
your stuff but write an angry mail to him instead. ;)

Stay patient, please.

Jörn

-- 
ticks = jiffies;
while (ticks == jiffies);
ticks = jiffies;
-- /usr/src/linux/init/main.c
