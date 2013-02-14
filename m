Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U5sQJ-0006nP-5V
 for linux-mtd@lists.infradead.org; Thu, 14 Feb 2013 06:36:00 +0000
Message-ID: <1360823765.12703.153.camel@sauron.fi.intel.com>
Subject: Re: SELinux + ubifs: possible circular locking dependency
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Thu, 14 Feb 2013 08:36:05 +0200
In-Reply-To: <511BA51E.9000606@pengutronix.de>
References: <51123C80.2050400@pengutronix.de> <5115076E.3070703@pengutronix.de>
 <1360759673.12703.147.camel@sauron.fi.intel.com>
 <511BA51E.9000606@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-security-module@vger.kernel.org, linux-mtd@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-02-13 at 15:37 +0100, Marc Kleine-Budde wrote:
> > +	lockdep_set_class(&isec->lock, inode->i_sb->s_type->i_mutex_key);
> 
> So I added an "&", so that the line looks like that:

Yeah, I did not compile it, and for the deadlock of course I have to add
own class for isec->lock in the fstype structure. I'll try to come up
with another patch. Thanks!

-- 
Best Regards,
Artem Bityutskiy
