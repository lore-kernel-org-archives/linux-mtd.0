Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 190ku6-00065B-BR
	for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2003 17:15:58 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HCQ0038L55RB4@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Wed, 02 Apr 2003 18:15:28 +0200 (MEST)
Date: Wed, 02 Apr 2003 19:15:56 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <20030402095500.2672a730.EManning@PRISMIQ.com>
To: Earl Manning <EManning@PRISMIQ.com>, linux-mtd@lists.infradead.org
Message-id: <200304021915.56265.tglx@linutronix.de>
MIME-version: 1.0
References: <20030402095500.2672a730.EManning@PRISMIQ.com>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Subject: Re: issue with eraseall
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 02 April 2003 17:55, Earl Manning wrote:
> In my implementation I just changed the value written by eraseall to be 8.
> The offending pieces of code are:
>
> 	util/eraseall.c:84
> 	fs/jffs2/wbuf.c:671-675
I don't see a piece of offending code there

util/eraseall.c: 106 ...
		// format for JFFS2
		if (!jffs2) 
			continue;
				
		// write cleanmarker	
--->		if (isNAND) {
			struct mtd_oob_buf oob;
			oob.ptr = (unsigned char *) &cleanmarker;
			oob.start = erase.start;
--->			oob.start += meminfo.oobsize == 16 ? 8 : 6;
--->			oob.length = meminfo.oobsize == 16 ? 8 : 2;
			if (ioctl (fd, MEMWRITEOOB, &oob) != 0) {
				fprintf(stderr, "\n%s: %s: MTD writeoob failure: %s\n", exe_name, 
mtd_device, strerror(errno));
				continue;
			}
		} else {
This is for NOR !
		}


-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
