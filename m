Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YsLvn-00047r-2Z
 for linux-mtd@lists.infradead.org; Wed, 13 May 2015 01:57:55 +0000
From: =?iso-2022-jp?B?QmVhbiBIdW8gGyRCcDlJTElMGyhCIChiZWFuaHVvKQ==?=
 <beanhuo@micron.com>
To: "michael.niarchos@gmail.com" <michael.niarchos@gmail.com>
Subject: RE: Cannot mount ubifs partition
Date: Wed, 13 May 2015 01:57:27 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B631013AF1DC@NTXXIAMBX02.xacn.micron.com>
References: <mailman.43705.1431478462.22890.linux-mtd@lists.infradead.org>
In-Reply-To: <mailman.43705.1431478462.22890.linux-mtd@lists.infradead.org>
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>I am using a Zynq7000 with NAND 512MB and
>I am trying to deploy Linux on NAND memory.
>I use a custom built kernel with minimal features=20
>(UBI and UBIFS support are enabled and mtd-utils installed).=20
>I can ubiformat an mtd partition, I can ubiattach and ubidetach it but whe=
never
>I try to mount the partition I get this error.

           >mount: mounting /dev/ubi0:ubi-rootfs on /mnt/ubifs failed:
>No such device

>(ubi-rootfs is the name of the partition, I am sure about it)

>I am sorry if I am asking about a problem that has been reported before, b=
ut I am new to this list

>Thanks in advance,
>Michael

Hi, Michael=20

Do you have create a ubi volume ubi-rootfs on this mtd device ?

ubimkvol /dev/ubi0 -N ubi-rootfs -m
