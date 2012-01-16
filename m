Received: from lnx500.hrz.tu-darmstadt.de ([130.83.156.225])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rmk2K-00011G-2c
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2012 10:43:37 +0000
From: Tim Sander <tim01@iss.tu-darmstadt.de>
To: linux-mtd@lists.infradead.org, dedekind1@gmail.com
Subject: Re: ubiformat & linux 3.0.14-rt
Date: Mon, 16 Jan 2012 11:43:22 +0100
References: <201201131006.33998.tim01@iss.tu-darmstadt.de>
 <1326468894.19039.45.camel@sauron.fi.intel.com>
In-Reply-To: <1326468894.19039.45.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201201161143.23934.tim01@iss.tu-darmstadt.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem

Thanks for your reply.
Am Freitag, 13. Januar 2012 schrieb Artem Bityutskiy:
> On Fri, 2012-01-13 at 10:06 +0100, Tim Sander wrote:
> > This happens with or without of ubifs master for 3.0 applied from
> > git://git.infradead.org/~dedekind/ubifs-v3.0.git
> > 
> > So is there some condition which causes UBI(FS) to take more time in an
> > interrupt routine if the filesystem has been updated? If yes wouldn't it
> > be possible to move this work into:
> > ubifs_bgt0_0
> 
> Please the very latest patches:
Mh, i'd like to. But this is with the realtime patches and i have only got 3.0 
up and running. To my knowledge this error is only visible with the preempt rt
patch applied. So there are way to many merge conflicts for me to test :-( 
sorry. I probably could give it a spin with 3.2-rt but i havent got this one 
booting.

> http://git.infradead.org/ubifs-2.6.git
> 
> Namely, these should fix the issue:
> 
> http://git.infradead.org/ubifs-2.6.git/commit/1f5d78dc4823a85f112aaa2d0f176
> 24f8c2a6c52
> http://git.infradead.org/ubifs-2.6.git/commit/d34315da9146253351146140ea4b
> 277193ee5e5f
Do you think it is worthwhile checking the ubifs 3.0 backport with the above 
two cherry-picked?

Best regards
Tim
