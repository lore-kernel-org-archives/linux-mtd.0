Received: from anchor-post-35.mail.demon.net ([194.217.242.85])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18GbE9-0002EL-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Nov 2002 08:37:53 +0000
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: SmartMedia Card need to create fs before mounting it ?
Date: Tue, 26 Nov 2002 09:08:08 -0000
Message-ID: <541025071C7AC24C84E9F82296BB9B950807BF@OPTEX1.optex.local>
From: "John Hall" <john.hall@optionexist.co.uk>
To: <linux-mtd@lists.infradead.org>
Cc: <manningc2@actrix.gen.nz>,
	"shadow" <saturn@structure.biochem.nchu.edu.tw>
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

On 26 November 2002 07:36 Charles Manning <manningc2@actrix.gen.nz>
wrote:

> > When I mount a partition on the SmartMedia card, if I must need to
> > put a jffs2's image on it before mounting it ? Or existed a tool
> > that can directly make jffs2 on the nand flash ?
>=20
> I believe you will need to run mkfs.jffs2 to format the nand first.
>=20
> You will find this in mtd/util in the mtd cvs.

Or just erase the NAND flash to create an empty JFFS2 partition:

	eraseall /dev/mtdx

eraseall is also in mtd/util.

cheers,
John
