Received: from [208.190.191.184] (helo=sekhmet.ad.newisys.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16TWXd-0000mA-00
	for <linux-mtd@lists.infradead.org>; Wed, 23 Jan 2002 23:10:53 +0000
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: MTD partitioning for AMD flash chips
Date: Wed, 23 Jan 2002 17:21:26 -0600
Message-ID: <D3A72C5007329A4F991C0DD87202259F0EAFBA@sekhmet.ad.newisys.com>
From: "Navin Boppuri" <navin.boppuri@newisys.com>
To: <linux-mtd@lists.infradead.org>
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

Hello all,

I am new the MTD mailing lists. I have two AM29LV641D( 4M X 16) flash
chips connected to a 32 bit bus.(sector size is 128k). I  would like to
partion this device so that I may mount a JFFS2 flash file system on one
of the partitions and use the rest of the device for raw data.  I do see
some examples to do this for some intel chips in drivers/mtd but I dont
see anything for the AMD chips. Is the interface similar for the AMD
chips?

Thank you.
Navin.
