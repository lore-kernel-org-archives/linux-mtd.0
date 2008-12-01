Received: from mail.benning.ua ([217.5.235.50] helo=mailer.benning.de)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L73Kn-0005Xr-5j
	for linux-mtd@lists.infradead.org; Mon, 01 Dec 2008 07:36:45 +0000
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: Problems with JFFS2 FS during parallel write operations
Date: Mon, 1 Dec 2008 08:36:41 +0100
Message-ID: <0F0EC10F42A3384392AE60EF2A660B40427D98@tbbsrv56>
In-Reply-To: <0F0EC10F42A3384392AE60EF2A660B40427D93@tbbsrv56>
From: "Ostendorf, Rainer" <Rainer.Ostendorf@BENNING.de>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi list,

i'm still working on the problem described in my previous post:

[...]
> During normal operation the system runs perfectly stable, but when i=20
> start two processes running parallel, writing huge amounts of data=20
> to the flash device, i get error=20
> messages from the JFFS2 filesystem:
>=20
> ...
> argh. node added in wrong place
> argh. node added in wrong place
> ...
>=20
> This message repeats for about 15-20 times while copying parallel 2=20
> files of about 6MByte to the flash via Ethernet (SCP).=20
[...]

As i can only reproduce the corruption of the JFFS2 FS during parallel =
access of at leat two processes writing to the flash, i assume that the =
cause for the corruption is some kind of race-condition. Have there been =
any known problems/bugs with race conditions, that could lead to an =
error like this? Would it probably help to upgrade to a newer kernel =
version? Any hint and help would be greatly appreciated.

best regards,
Rainer


Benning Elektrotechnik und Elektronik GmbH & Co. KG Bocholt
Handelsregister Coesfeld HRA-Nr. 4661
Pers=F6nlich haftende Gesellschaft: Benning GmbH
Handelsregister Coesfeld HRB-Nr. 7772
Gesch=E4ftsf=FChrer: Th. Benning
