Received: from o074.orange.fastwebserver.de ([85.114.130.74]
	helo=bogenhausen.olympweb.de)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lfvfl-0000WZ-Oh
	for linux-mtd@lists.infradead.org; Sat, 07 Mar 2009 12:30:36 +0000
Message-ID: <20090307133031.448mc2vls04wsgc4@webmail.phrozen.org>
Date: Sat, 07 Mar 2009 13:30:31 +0100
From: john@phrozen.org
To: linux-mtd@lists.infradead.org
Subject: infineon danube/twinpass mtd support
MIME-Version: 1.0
Content-Type: text/plain;
	charset=ISO-8859-1;
	DelSp="Yes";
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

we rewrote the infineon danube/twinpass support a while back and =20
bumped the original vendor code to 2.6. we are currently looking into =20
some left over details, before sending the patches upstream.

1 open issue is the mtd map. the danube has a EBU (External Bus Unit) =20
which connects pci and mtd to the mips core. for PCI to work, the EBU =20
needs to endiness swap in-/ex-gress DMA data. however, due to a design =20
issue(?!) the EBU only swaps MTD one way. hence we needed to add some =20
complex mappings.

there is 1 really ugly hack, we needed to add to make it work. the =20
patch can be found here ->
https://dev.openwrt.org/browser/trunk/target/linux/ifxmips/patches-2.6.28/16=
0-cfi-swap.patch

and the map driver here -->
https://dev.openwrt.org/browser/trunk/target/linux/ifxmips/files/drivers/mtd=
/maps/ifxmips.c

i would appreciate to get some input, whether this is the correct =20
solution. i think the mtd subsystem is missing a generic way to handle =20
this kind of situation. but correct me if i am worng please.

thanks,
John


--=20
John Crispin
hacking, coding, etc
blogic on irc

    _______                     ________        __
   |       |.-----.-----.-----.|  |  |  |.----.|  |_
   |   -   ||  _  |  -__|     ||  |  |  ||   _||   _|
   |_______||   __|_____|__|__||________||__|  |____|
            |__| W I R E L E S S   F R E E D O M
   KAMIKAZE (bleeding edge) -----------------------
    * 10 oz Vodka       Shake well with ice and strain
    * 10 oz Triple sec  mixture into 10 shot glasses.
    * 10 oz lime juice  Salute!
   ---------------------------------------------------
