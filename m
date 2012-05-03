Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SPqZH-0001f4-Nv
 for linux-mtd@lists.infradead.org; Thu, 03 May 2012 07:35:16 +0000
Date: Thu, 3 May 2012 09:35:14 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Grant Edwards <grant.b.edwards@gmail.com>
Subject: Re: Question about mkfs.jffs2 "-s" option
In-Reply-To: <jnrm65$im4$1@dough.gmane.org>
Message-ID: <Pine.LNX.4.64.1205030930540.8107@lnxricardw.se.axis.com>
References: <jnrm65$im4$1@dough.gmane.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 2 May 2012, Grant Edwards wrote:

> The NAND flash I'm using has to be written in 4K blocks -- isn't that
> the "page size"?

The smallest writable unit in a NAND flash is called a 'page', but AFAIK=20
this is not what the -s option in mkfs.jffs2 is for. Instead, it is=20
related for the kernel memory managament page size, which is 4k for most=20
architectures. I think the jffs2 driver determines the smallest writable=20
unit runtime; it is not a parameter during the file system creation.=20
However the erase block size must be specified to mkfs.jffs2 as it affects=
=20
the structure of the file system image.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
