Received: from mta-blr2.sasken.com ([164.164.56.19])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KnTV5-0005mr-6V
	for linux-mtd@lists.infradead.org; Wed, 08 Oct 2008 07:30:28 +0000
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Subject: RE: MTD Erase Size usage in JFFS2
Date: Wed, 8 Oct 2008 13:00:01 +0530
Message-ID: <4F3EFCBE1C926F48A576A096FE1D0E176A0FE3@EXGZ02.sasken.com>
References: <6C370B347C3FE8438C9692873287D2E1100B4BF956@SJEXCHCCR01.corp.ad.broadcom.com>
From: Ravi Vasarla <ravi.vasarla@sasken.com>
To: "Ramgopal Kota" <rkota@broadcom.com>,
	<linux-mtd@lists.infradead.org>
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I think would have to create different images where as have to specify
correct erase block size to give the better results.

Regards,
Ravi=20

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org
[mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of Ramgopal
Kota
Sent: Wednesday, October 08, 2008 12:33 PM
To: linux-mtd@lists.infradead.org
Subject: MTD Erase Size usage in JFFS2

Hi,

our board is having a 8MB flash and we are using JFFS2 as a image
storage.
Due to lead times we decided to use 4 vendors flash chips of same size,
they all work fine.
Each flash chip has different sector sizes.

 As part of  manufacturing  process, we took a working image on  one
flash and burn it in all  different vendor flashes,  due to sector size
mishap  they are not working as intended.

I want to know if I can specify something similar to "-e" option in
mkfs.jffs2 where I can specify the block size.

Thanks and Regards,
Ramgopal Kota


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
SASKEN BUSINESS DISCLAIMER
-------------------------
This message may contain confidential, proprietary or legally privileged in=
formation. In=20
case you are not the original intended Recipient of the message, you must n=
ot, directly or=20
indirectly, use, Disclose, distribute, print, or copy any part of this mess=
age and you are=20
requested to delete it and inform the sender. Any views expressed in this m=
essage are=20
those of the individual sender unless otherwise stated. Nothing contained i=
n this message=20
shall be construed as an offer or acceptance of any offer by Sasken Communi=
cation=20
Technologies Limited ("Sasken") unless sent with that express intent and wi=
th due=20
authority of Sasken. Sasken has taken enough precautions to prevent the spr=
ead of=20
viruses. However the company accepts no liability for any damage caused by =
any virus=20
transmitted by this email
