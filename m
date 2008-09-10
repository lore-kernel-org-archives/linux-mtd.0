Received: from [207.158.3.3] (helo=ccomm-ex1.ccomm.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KdTTB-0001t3-6V
	for linux-mtd@lists.infradead.org; Wed, 10 Sep 2008 17:27:09 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: Erase Block size
Date: Wed, 10 Sep 2008 10:14:48 -0700
Message-ID: <EE63F03D9E04774997AEBCD21FC77F25317838@ccomm-ex1.ccomm.com>
From: "Sugathan, Rupesh" <rs@carriercomm.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,

I have a scenario where I need to deploy the same jffs2 image on two
flash memory parts, one with a 128KB sector size and the other with
256KB sector size.

I read from http://www.linux-mtd.infradead.org/doc/jffs2.html that
building the jffs2 image with smaller 'erase block size' should be
harmless even in the flash with 256KB sector size, although there might
be some warning messages at mount time. However, the warning messages
are not desired since this is a production image.=20

Can anyone tell me if there is any utility that can be used to alter the
erase block size on-the-fly? Or I would greatly appreciate if anyone has
some other solution to this problem.

Thanks
--
Rupesh
