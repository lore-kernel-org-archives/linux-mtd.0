Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DxP2h-0006aS-Ee
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2005 09:00:37 -0400
Message-ID: <42E634D0.6090300@inf.u-szeged.hu>
Date: Tue, 26 Jul 2005 15:04:16 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <dbl42b$hcn$1@sea.gmane.org>
	<1121867130.12903.15.camel@localhost.localdomain>
In-Reply-To: <1121867130.12903.15.camel@localhost.localdomain>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
	Martin Egholm Nielsen <martin@egholm-nielsen.dk>
Subject: Re: JFFS2 garbage collector blocking for minutes after mount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>The garbage collection thread is also responsible for building up the
>node tree for every inode after mounting, so that we know for sure which
>nodes are valid and which are obsolete. On NAND flash we can't actually
>mark nodes as obsolete.
>  
>
Martin, you may should try our Centralizes Summary (CS) patch. It stores
every relevant memory representation at umount time, so at mount (if the
previous unmount was a clean one) you need only to read it without any
scanning and rebuilding.

It is downloadable from our web site
(http://www.inf.u-szeged.hu/jffs2/mount.php). I recommend the variant
which stores reference information on the first erase block.

Bye,
Ferenc
