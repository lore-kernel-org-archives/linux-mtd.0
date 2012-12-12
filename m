Received: from broadway.de.festo.net ([141.130.250.36])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TirN5-0005gt-LS
 for linux-mtd@lists.infradead.org; Wed, 12 Dec 2012 18:49:32 +0000
From: "Schneider, Roman" <schneider@at.festo.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: mxc_nand: compress ID info for send_read_id_v3
Date: Wed, 12 Dec 2012 18:49:28 +0000
Message-ID: <1B09BCCCBD9E66429F0DCB039A36863133164FB1@SDET3287.de.festo.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

      =20
       ---
      =20
       NFC v3 (e.g. mx53) does also require to compress the id in case of 1=
6Bit busw.
      =20
        drivers/mtd/nand/mxc_nand.c |   11 +++++++++++
        1 files changed, 11 insertions(+), 0 deletions(-)
      =20
       diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand=
.c
       index 72e31d8..7758897 100644
       --- a/drivers/mtd/nand/mxc_nand.c
       +++ b/drivers/mtd/nand/mxc_nand.c
       @@ -535,12 +535,23 @@ static void send_page_v1(struct mtd_info *mtd,=
 unsigned int ops)
       =20
        static void send_read_id_v3(struct mxc_nand_host *host)
        {
       +	struct nand_chip *this =3D &host->nand;
       +
        	/* Read ID into main buffer */
        	writel(NFC_ID, NFC_V3_LAUNCH);
       =20
        	wait_op_done(host, true);
       =20
        	memcpy32_fromio(host->data_buf, host->main_area0, 16);
       +
       +	if (this->options & NAND_BUSWIDTH_16) {
       +		/* compress the ID info */
       +		host->data_buf[1] =3D host->data_buf[2];
       +		host->data_buf[2] =3D host->data_buf[4];
       +		host->data_buf[3] =3D host->data_buf[6];
       +		host->data_buf[4] =3D host->data_buf[8];
       +		host->data_buf[5] =3D host->data_buf[10];
       +	}
        }
       =20
        /* Request the NANDFC to perform a read of the NAND device ID. */
       --=20
       1.7.2.5
      =20


Development Control Systems
Festo Gesellschaft m.b.H.
Linzer Strasse 227
Austria - 1140 Wien

Firmenbuch Wien
FN 38435y
UID: ATU14650108

Tel: +43(1)91075-372
Fax: +43(1)91075-282
www.festo.at

Der Inhalt dieses E-Mails ist ausschliesslich fuer den bezeichneten Adressa=
ten bestimmt. Jede Form der Kenntnisnahme,
Veroeffentlichung, Vervielfaeltigung oder Weitergabe des Inhalts dieses E-M=
ails durch unberechtigte Dritte ist unzulaessig. Wir
bitten Sie, sich mit dem Absender des E-Mails in Verbindung zu setzen, fall=
s Sie nicht der Adressat dieses E-Mails sind und das
Material von Ihrem Computer zu loeschen.=20

This e-mail and any attachments are confidential and intended solely for th=
e addressee. The perusal, publication, copying or
dissemination of the contents of this e-mail by unauthorised third parties =
is prohibited. If you are not the intended recipient of this
e-mail, please delete it and immediately notify the sender.
