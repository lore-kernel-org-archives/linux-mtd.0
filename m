Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1765Xi-0000QX-00
	for <linux-mtd@lists.infradead.org>; Fri, 10 May 2002 09:14:22 +0100
Date: Fri, 10 May 2002 10:14:19 +0200 (MEST)
From: Armin Schindler <acs@sysgo.de>
To: Robert Schwebel <robert@schwebel.de>
cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: mtdblock and devfs
In-Reply-To: <20020510100655.T15258@schwebel.de>
Message-ID: <Pine.LNX.4.21.0205101012540.28784-100000@dagobert.svc.sysgo.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

The block devices have thier own directory,
have a look into
/dev/mtdblock


Armin

On Fri, 10 May 2002, Robert Schwebel wrote:
> Hi, 
> 
> using devfs and mtd from CVS I see only the char device nodes in /dev/mtd,
> although I've enabled CONFIG_MTD_BLOCK=y: 
> 
> # ls -l /dev/mtd/
> crw-rw-rw-    1 0        0         90,   0 Jan  1  1970 0
> crw-rw-rw-    1 0        0         90,   1 Jan  1  1970 0ro
> crw-rw-rw-    1 0        0         90,   2 Jan  1  1970 1
> crw-rw-rw-    1 0        0         90,   3 Jan  1  1970 1ro
> crw-rw-rw-    1 0        0         90,   4 Jan  1  1970 2
> crw-rw-rw-    1 0        0         90,   5 Jan  1  1970 2ro
> 
> Any idea? 
> 
> Robert
> -- 
>  +--------------------------------------------------------+
>  | Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de |
>  | Pengutronix - Linux Solutions for Science and Industry |
>  |   Braunschweiger Str. 79,  31134 Hildesheim, Germany   |
>  |    Phone: +49-5121-28619-0 |  Fax: +49-5121-28619-4    |
>  +--------------------------------------------------------+
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

Armin Schindler <acs@sysgo.de>
Sysgo RTS GmbH
Am Pfaffenstein 14
D-55270 Klein-Winternheim / Germany
phone: +49 6136 9948-0
fax  : +49 6136 9948-10
http://www.sysgo.de
http://www.elinos.com
