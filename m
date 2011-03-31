Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5BQU-0006Yt-8z
	for linux-mtd@lists.infradead.org; Thu, 31 Mar 2011 06:32:15 +0000
Received: by eyh6 with SMTP id 6so688311eyh.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 30 Mar 2011 23:32:12 -0700 (PDT)
Subject: Re: [PATCH 1/2] UBIFS: do not select KALLSYMS_ALL
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Randy Dunlap <randy.dunlap@oracle.com>
In-Reply-To: <20110330154130.e62e04e0.randy.dunlap@oracle.com>
References: <1301474416-8202-1-git-send-email-dedekind1@gmail.com>
	<1301474416-8202-2-git-send-email-dedekind1@gmail.com>
	<20110330154130.e62e04e0.randy.dunlap@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 31 Mar 2011 09:29:53 +0300
Message-ID: <1301552993.2828.3.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: MTD list <linux-mtd@lists.infradead.org>,
	lkml <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-03-30 at 15:41 -0700, Randy Dunlap wrote:
> > diff --git a/fs/ubifs/Kconfig b/fs/ubifs/Kconfig
> > index d744090..f8b0160 100644
> > --- a/fs/ubifs/Kconfig
> > +++ b/fs/ubifs/Kconfig
> > @@ -47,7 +47,7 @@ config UBIFS_FS_DEBUG
> >  	bool "Enable debugging support"
> >  	depends on UBIFS_FS
> >  	select DEBUG_FS
> > -	select KALLSYMS_ALL
> > +	select KALLSYMS
> >  	help
> >  	  This option enables UBIFS debugging support. It makes sure various
> >  	  assertions, self-checks, debugging messages and test modes are compiled
> > -- 
> 
> Acked-by: Randy Dunlap <randy.dunlap@oracle.com>

Pushed to UBI / UBIFS trees. These will show-up in linux-next a bit
later (around -rc2, if it will be usable enough), and then I'll send
this to Linus.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
