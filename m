Received: from [212.105.56.244] (helo=dmz.lumentis.net)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CqvdG-0002fy-L4
	for linux-mtd@lists.infradead.org; Tue, 18 Jan 2005 10:51:03 -0500
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Date: Tue, 18 Jan 2005 16:50:46 +0100
Message-ID: <JPEALJAFNGDDLOPNDIEEAEDFDAAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.58.0501141401510.17331@phoenix.infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: RE: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 
> There was interesting offer to calculate checksum from the end of buffer 
> since it implies better L1 cache behaviour. Then there was another 
> argument against this idea - it was standed that some CPUs might be 
> capable to prefetch data forward and not capable to do it backward.

Sorry for being so quiet lately, work is a bit much currently.

Another idea is to calculate the checksum while reading/writing(much like
the networking code does). That would probably require support from the MTD layer
and that the checksum is stored at the end of the JFFS3 node.

 Jocke
