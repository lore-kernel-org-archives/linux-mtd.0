Received: from mailbackup.lpgfinance.com ([46.18.228.1] helo=antispam.lpg.priv)
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TGnj2-0005mZ-90
 for linux-mtd@lists.infradead.org; Wed, 26 Sep 2012 09:16:13 +0000
Received: from CARAMBAR.lpg.priv (unknown [10.1.1.27])
 by antispam.lpg.priv (mail.lpgfinance.com) with ESMTP id BE4787240C1
 for <linux-mtd@lists.infradead.org>; Wed, 26 Sep 2012 11:16:01 +0200 (CEST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: ubinize.cfg for NAND with multi ubi devices and multi volume inside
Date: Wed, 26 Sep 2012 11:16:00 +0200
Message-ID: <D604D5FB4D200642AA2FAAE94E39258601AFFFCE@CARAMBAR.lpg.priv>
From: "MONDON Daniel" <Daniel.MONDON@lpgsystems.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I don't find how to generate my .cfg for the ubinize command.
Perhaps impossible ?

I'v got 1GB NAND with 4 UBI devices.
I want to ubinize some volumes in some UBI devices.

For example : (i've got ubi1_0 to ubi1_3 and ubi4_0 to ubi4_4)
Ubi1_0 (80MiB)
Ubi1_3 (300MiB)
Ubi4_0 (30MiB)
Ubi4_4 (30MiB)

What have i to write in the .cfg file.

With the result, i will use ubiupdatevol to write fs images.

I've got ubinize V1.4.9.

Thanks
Daniel.

  =20
=20
