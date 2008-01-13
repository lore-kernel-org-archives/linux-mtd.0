Received: from gateway.imaginecommunications.com ([212.199.94.2]
	helo=venus.imagineil.tv)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JE5mq-0000De-VW
	for linux-mtd@lists.infradead.org; Sun, 13 Jan 2008 16:34:26 +0000
From: Jacob Avraham <jacob@imaginecommunications.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Sun, 13 Jan 2008 18:31:20 +0200
Subject: Redboot FIS entry upgrade from Linux
Message-ID: <FF584854D6FFE547AB2F7515A798AC3A4E3A9955@venus.imagineil.tv>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
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

Hi,

Say I have a zImage or ramdisk image as a file listed in FIS,
which I use to  "fis load" from Redboot.
Now I want to upgrade an image from Linux, so in addition to
writing into the specific mtd partition I need to update the FIS
directory entry checksum value.

Are there any utils to facilitate that?
Or maybe such where not developed because it's not a good idea?

Thanks,

Jacob
