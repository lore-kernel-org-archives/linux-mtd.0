Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 198Elu-0002Ej-8Z
	for <linux-mtd@lists.infradead.org>; Wed, 23 Apr 2003 08:34:26 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20030421115544.GB9550@wohnheim.fh-wedel.de>
References: <DEA23DB61B62D4118B5900508B323B8401055535@OPENMAIL>
	 <20030421115544.GB9550@wohnheim.fh-wedel.de>
Message-Id: <1051083269.13999.23.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Wed, 23 Apr 2003 08:34:29 +0100
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8bit
cc: Jeremy Bowen <Jeremy.Bowen@opennw.com>
cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: Unable to write to some JFS partitions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-04-21 at 12:55, Jörn Engel wrote:
> David, do you have a longer list than grub and ecos? Just curious.

Grub doesn't. eCos isn't a bootloader but of course RedBoot is -- it
supports JFFS2 with the eCos code but hasn't yet had the cosmetics done
-- just the actual commands to mount/load/save etc. using the existing
JFFS2 support.

Other than that, the Compaq bootldr used on the iPAQ, and I think Blob
also got JFFS2 support recently too.

-- 
dwmw2
