Received: from mx0.itk-engineering.de ([212.121.145.30])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eAJ02-0004dG-Ea
 for linux-mtd@lists.infradead.org; Thu, 02 Nov 2017 17:09:52 +0000
From: Martin Hollingsworth <Martin.Hollingsworth@itk-engineering.de>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: ubiupdatevol read input from stdin or similar
Date: Thu, 2 Nov 2017 17:09:29 +0000
Message-ID: <f46ce07819e74170a974bb7b0b5cddf1@itk-engineering.de>
Content-Language: de-DE
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

Hello MTD Tools community,
I am searching for help on the usage of ubiupdatevol.=20
I am using ubiupdatevol version 1.5.2 and would like to pass input data fro=
m stdin or similar sources.
I hope to achieve something like the following line, where dd can be replac=
ed by various other tools:

dd if=3D/dev/urandom | ubiupdatevol /dev/ubi10_1

However the above example always fails with the following error:

ubiupdatevol: error!: specify UBI device name and image file name as first =
2 parameters (use -h for help)

However the commit ab8c6fb93ce9db0f09401c4b819b0b277dc00340 gives me the im=
pression, that it could be done.
http://git.infradead.org/mtd-utils.git/commit/ab8c6fb93ce9db0f09401c4b819b0=
b277dc00340

However I cannot figure out how to make this work. If anyone has a code exa=
mple I would be very grateful for your support!

Thanks and regards,
Martin Hollingsworth
