Received: from anchor-post-30.mail.demon.net ([194.217.242.88])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 170evm-0007nN-00
	for <linux-mtd@lists.infradead.org>; Thu, 25 Apr 2002 09:48:46 +0100
Received: from optex.demon.co.uk ([158.152.119.220] helo=optex1.optex.local)
	by anchor-post-30.mail.demon.net with esmtp (Exim 3.35 #1)
	id 170evl-000Jp3-0U
	for linux-mtd@lists.infradead.org; Thu, 25 Apr 2002 09:48:46 +0100
content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: JFFS2 on both Nand and StrataFlash
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Apr 2002 09:50:27 +0100
Message-ID: <541025071C7AC24C84E9F82296BB9B95080549@OPTEX1.optex.local>
From: "John Hall" <John.Hall@optionexist.co.uk>
To: "Linux MTD list (E-mail)" <linux-mtd@lists.infradead.org>
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

On 18 April 2002 16:24, John Hall wrote:

> I have a board that has Intel StrataFlash as well as a=20
> Smartmedia card slot. I have JFFS2 happily up and running on=20
> the Smartmedia card, but would also like to put JFFS2 on a=20
> section of the StrataFlash.
>=20
> If JFFS2 is configured for Nand flash (CONFIG_JFFS2_FS_NAND),=20
> will it run on the StrataFlash or is it currently one or the other?

I've looked at the code, and it looks like it might work on non-NAND
flash. Is this the case?

Regards,
John Hall=20
