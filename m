Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FaySY-0003Mq-85
	for linux-mtd@lists.infradead.org; Tue, 02 May 2006 13:15:00 -0400
Date: Tue, 2 May 2006 19:14:32 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Steve Finney <saf76@earthlink.net>
Message-ID: <20060502171432.GE23849@wohnheim.fh-wedel.de>
References: <18996390.1146588887040.JavaMail.root@elwamui-ovcar.atl.sa.earthlink.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <18996390.1146588887040.JavaMail.root@elwamui-ovcar.atl.sa.earthlink.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/3] MTD Utils. Allow hex argument in nandwrite
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2 May 2006 12:54:46 -0400, Steve Finney wrote:
> 
> +                       mtdoffset = strtol (optarg, NULL, 0);

How about doing something similar to block2mtd?
http://git.infradead.org/?p=users/joern/mtd-2.6.git;a=blob;h=f54e4bf9b968f153400312a74689f7028650b5d4;hb=954c24227318c166ec1925e1229db442e1f56f51;f=drivers/mtd/devices/block2mtd.c#l354

Jörn

-- 
Why do musicians compose symphonies and poets write poems?
They do it because life wouldn't have any meaning for them if they didn't.
That's why I draw cartoons.  It's my life.
-- Charles Shultz
