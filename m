Received: from relay.2ka.mipt.ru ([194.85.82.65] helo=2ka.mipt.ru)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HqtAk-000473-LU
	for linux-mtd@lists.infradead.org; Wed, 23 May 2007 11:54:48 -0400
Date: Wed, 23 May 2007 19:53:41 +0400
From: Evgeniy Polyakov <johnpol@2ka.mipt.ru>
To: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
Subject: Re: Review status (Re: [PATCH] LogFS take three)
Message-ID: <20070523155339.GA17753@2ka.mipt.ru>
References: <20070515151919.GA32510@lazybastard.org>
	<20070515152149.GB32059@lazybastard.org>
	<20070517160308.GA26643@2ka.mipt.ru>
	<20070517171017.GB15676@lazybastard.org>
	<20070520173049.GA20907@2ka.mipt.ru>
	<20070523125840.GC24738@lazybastard.org>
	<20070523150732.GA2456@2ka.mipt.ru>
	<20070523151402.GA25532@lazybastard.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20070523151402.GA25532@lazybastard.org>
Cc: akpm@osdl.org, Albert Cahalan <acahalan@gmail.com>,
	Greg KH <greg@kroah.com>, linux-kernel@vger.kernel.org,
	Ingo Oeser <ioe-lkml@rameria.de>, Pekka Enberg <penberg@cs.helsinki.fi>,
	linux-mtd@lists.infradead.org, Jan Engelhardt <jengelh@linux01.gwdg.de>,
	linux-fsdevel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 23, 2007 at 05:14:04PM +0200, Jörn Engel (joern@lazybastard.org) wrote:
> > > I'm just a German.  Forgive me if I drink lesser beverages.
> > 
> > You should definitely change that.
> 
> Change being German?  Not a bad idea, actually.

You cook up really tasty shnaps, in small quantities it is good for
health in infinite volumes.

> > Btw, what about this piece:
> > 
> > int logfs_erase_segment(struct super_block *sb, u32 index)
> > {
> > 	struct logfs_super *super = LOGFS_SUPER(sb);
> > 
> > 	super->s_gec++;
> > 
> > 	return mtderase(sb, index << super->s_segshift, super->s_segsize);
> > }
> > 
> > index << super->s_segshift might overflow, mtderase expects loff_t
> > there, since index can be arbitrary segment number, is it possible, that
> > overflow really occurs?
> 
> Indeed it is.  You just earned your second beer^Wvodka.

Actually this code looks less encrypted than ext2 for, which definitely
a good sign from reviewer's point of view.

> Jörn

-- 
	Evgeniy Polyakov
