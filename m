Received: from mail-pz0-f41.google.com ([209.85.210.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R2irc-0005xX-AD
	for linux-mtd@lists.infradead.org; Sun, 11 Sep 2011 12:10:20 +0000
Received: by pzk4 with SMTP id 4so6571473pzk.28
	for <linux-mtd@lists.infradead.org>;
	Sun, 11 Sep 2011 05:10:18 -0700 (PDT)
Subject: Re: [PATCH 03/12] mtd: support reading OOB without ECC
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Sun, 11 Sep 2011 15:12:44 +0300
In-Reply-To: <1315741622.18731.22.camel@sauron>
References: <1314755147-17756-1-git-send-email-computersforpeace@gmail.com>
	<1314755147-17756-4-git-send-email-computersforpeace@gmail.com>
	<1315741622.18731.22.camel@sauron>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1315743169.18731.37.camel@sauron>
Mime-Version: 1.0
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
	Kevin Cernekee <cernekee@gmail.com>, b35362@freescale.com,
	Jim Quinlan <jim2101024@gmail.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2011-09-11 at 14:46 +0300, Artem Bityutskiy wrote:
> On Tue, 2011-08-30 at 18:45 -0700, Brian Norris wrote:
> > -static int mtd_do_readoob(struct mtd_info *mtd, uint64_t start,
> > -	uint32_t length, void __user *ptr, uint32_t __user *retp)
> > +static int mtd_do_readoob(struct file *file, struct mtd_info *mtd,
> > +	uint64_t start, uint32_t length, void __user *ptr,
> > +	uint32_t __user *retp)
> >  {
> > +	struct mtd_file_info *mfi = file->private_data;
> >  	struct mtd_oob_ops ops;
> >  	int ret = 0;
> 
> Why do you pass struct file pointer to this function instead of just
> passing the MTD_MODE constant directly? What if the caller does not have
> any 'struct file' at all (e.g., at some point someone would want to make
> an JFFS2 or YAFFS2 optimization and use this function). Do I miss
> something?
> 
> If there is not strong reason for passing 'file', could we pass 'int
> mode' instead?

Although after looking a bit closer, I think it is fine, sorry. Pushed
to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
