Received: from maila.telia.com ([194.22.194.231])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fyR2-0006Tv-00
	for <linux-mtd@lists.infradead.org>; Wed, 27 Feb 2002 07:23:32 +0000
Message-ID: <00b301c1bf61$31048fc0$da9240d5@jocke>
From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
References: <02022614424803.15969@jocke.lumentis.se>  <0111121314140A.28381@jocke.lumentis.se> <02010409585400.10979@jocke.lumentis.se> <02012911331100.15969@jocke.lumentis.se>  <17624.1014738778@redhat.com>
Subject: Re: scan.c & ACCURATE 
Date: Wed, 27 Feb 2002 08:34:29 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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


>
> Joakim.Tjernlund@lumentis.se said:
> >  Patch 1 skips scanning of inodes and dirents which are obsoleted.
> > Improves scan speed.
>
> You're trusting ri.totlen before verifying ri.node_crc. Naughty.

Totlen has been checked by jffs2_scan_eraseblock() before calling
jffs2_scan_inode_node(), but that is not obvious. Move it to after the CRC
check
if you like.

         Jocke
