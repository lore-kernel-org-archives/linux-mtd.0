Received: from kit-firewall.christiedigital.com ([216.94.43.2])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IV6Gp-0002ix-Vp
	for linux-mtd@lists.infradead.org; Tue, 11 Sep 2007 09:59:19 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: JFFS2 read Inode related issue
Date: Tue, 11 Sep 2007 09:59:11 -0400
Message-ID: <AD98412A5373CC4AA643D9C021922A543A935E@cdskitexg01.cds.int>
From: "Mouawad, Tony" <Tony.Mouawad@christiedigital.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I'm using Linux 2.6.10 on Coldfire architecture and I seem to be
experiencing very intermittent problems reading inodes.  It seems that
the following case is being hit during a call to jffs2_do_read_inode():

case INO_STATE_READING:
case INO_STATE_PRESENT:
	/* Eep. This should never happen. It can
	happen if Linux calls read_inode() again
	before clear_inode() has finished though. */
	printk(KERN_WARNING "Eep. Trying to read_inode #%u when it's
already 		in state %d!\n", ino, f->inocache->state);
	/* Fail. That's probably better than allowing it to succeed */
	f->inocache =3D NULL;
	break;

I notice that the comment states "This should never happen" but
apparently it is happening to me.  Does anyone have ideas on how I
should go about mitigating this problem? =20

Cheers,
Tony =20
