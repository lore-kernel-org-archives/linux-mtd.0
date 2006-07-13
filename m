Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G11Q7-0004YW-FB
	for linux-mtd@lists.infradead.org; Thu, 13 Jul 2006 09:40:07 -0400
Date: Thu, 13 Jul 2006 15:39:59 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Ville Herva <vherva@vianova.fi>
Subject: Re: [PATCH] [MTD] block2mtd.c: Make kernel boot command line
	arguments work (try 3)
Message-ID: <20060713133959.GA24056@wohnheim.fh-wedel.de>
References: <20060707122221.GW6240@vianova.fi>
	<20060711062342.GY6240@vianova.fi>
	<20060712095048.GB14333@wohnheim.fh-wedel.de>
	<20060712172359.GZ15078@vianova.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20060712172359.GZ15078@vianova.fi>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 12 July 2006 20:24:00 +0300, Ville Herva wrote:
> 
> One thing I only noticed now, is that while static compile + no boot time
> argument test case works, it does unnecessarily printk 
>   error: cannot open device ""
> since the argument parsing is invoked even when no argument is supplied.
> This is of course harmless, as nothing really happens, but 
> 
> -	ret = block2mtd_setup2(block2mtd_paramline);
> +	if (strlen(block2mtd_paramline)) 
> +		ret = block2mtd_setup2(block2mtd_paramline);
> 
> might be sensible in block2mtd_init(). (I'm trusting that .initdata and
> block2mtd_paramline are zero-initialized.)

Looks sane.  Can you send a proper patch for this?

Acked-by: Joern Engel <joern@wohnheim.fh-wedel.de>

Jörn

-- 
People will accept your ideas much more readily if you tell them
that Benjamin Franklin said it first.
-- unknown
