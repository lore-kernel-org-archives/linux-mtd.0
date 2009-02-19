Received: from mx1.kathrein.de ([217.6.102.140])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1La24q-0003cR-HY
	for linux-mtd@lists.infradead.org; Thu, 19 Feb 2009 06:08:07 +0000
To: linux-mtd@lists.infradead.org
Subject: Bad Block Table support when using UBI
Message-ID: <OF2FCA2B38.DF3448AE-ONC1257562.00219024-C1257562.0021AECD@kathrein.de>
Date: Thu, 19 Feb 2009 07:07:53 +0100
From: "Torsten Fleischer" <torsten.fleischer@kathrein.de>
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I've tested UBI and UBIFS on the eval board MPC8313ERDB. This board=20
contains a 32 MiB NAND Flash (SLC small block).
The fsl=5Felbc=5Fnand driver that is used for the MPC8313's NAND flash=20
interface reserves 4 erase blocks at the end of the device
for the bad block table.

Do I need the bad block table support when using UBI?

Best regards
Torsten Fleischer



--=20
Registergericht / Register court: Amtsgericht Traunstein, HRA 460 / local c=
ourt Traunstein, certificate of registration no. 460=20
Gesch=E4ftsf=FChrender pers=F6nlich haftender Gesellschafter / Personally l=
iable managing partner: Prof. Dr. Dr. h.c. Anton Kathrein, Dipl.-Betriebswi=
rt (MBA-equivalent)=20
Erf=FCllungsort und Gerichtsstand / Place of performance and place of juris=
diction: Rosenheim=20

This e-mail is confidential and may contain privileged information. If you =
have received this communication in error, please notify us immediately by =
responding to this email and then delete it from your system. The sender th=
erefore does not accept liability for any errors or omissions in the conten=
ts of this message which arise as a result of e-mail transmission. We belie=
ve but do not warrant that this e-mail and any attachments are virus free. =
You must therefore take full responsibility for virus checking. =
