Received: from herkules.vianova.fi ([194.100.28.129] helo=mail.vianova.fi)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G0iRZ-0004bI-18
	for linux-mtd@lists.infradead.org; Wed, 12 Jul 2006 13:24:19 -0400
Date: Wed, 12 Jul 2006 20:24:00 +0300
From: Ville Herva <vherva@vianova.fi>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Subject: Re: [PATCH] [MTD] block2mtd.c: Make kernel boot command line
	arguments work (try 3)
Message-ID: <20060712172359.GZ15078@vianova.fi>
References: <20060707122221.GW6240@vianova.fi>
	<20060711062342.GY6240@vianova.fi>
	<20060712095048.GB14333@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20060712095048.GB14333@wohnheim.fh-wedel.de>
Cc: linux-mtd@lists.infradead.org
Reply-To: vherva@vianova.fi
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 12, 2006 at 11:50:48AM +0200, you [Jörn Engel] wrote:
> On Tue, 11 July 2006 09:23:42 +0300, Ville Herva wrote:
> > 
> > #ifdef MODULE clutter 
> 
> Good enough for now.  If the klibc discussion ever settles, the early
> initialization code could get moved to userspace.

Good. 

One thing I only noticed now, is that while static compile + no boot time
argument test case works, it does unnecessarily printk 
  error: cannot open device ""
since the argument parsing is invoked even when no argument is supplied.
This is of course harmless, as nothing really happens, but 

-	ret = block2mtd_setup2(block2mtd_paramline);
+	if (strlen(block2mtd_paramline)) 
+		ret = block2mtd_setup2(block2mtd_paramline);

might be sensible in block2mtd_init(). (I'm trusting that .initdata and
block2mtd_paramline are zero-initialized.)


-- v -- 

v@iki.fi
