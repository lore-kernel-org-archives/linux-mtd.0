Received: from mms1.broadcom.com ([216.31.210.17])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KDEzB-0001EL-64
	for linux-mtd@lists.infradead.org; Mon, 30 Jun 2008 08:43:45 +0000
Received: from mail-irva-8.broadcom.com (mail-irva-8 [10.11.18.52]) by
	mail-irva-10.broadcom.com (Postfix) with ESMTP id 476FE2B0 for
	<linux-mtd@lists.infradead.org>; Mon, 30 Jun 2008 01:37:22 -0700 (PDT)
Received: from NT-SJCA-0752.brcm.ad.broadcom.com (nt-sjca-0752
	[10.16.192.222]) by mail-sj1-12.sj.broadcom.com (Postfix) with ESMTP id
	CC85D20501 for <linux-mtd@lists.infradead.org>; Mon, 30 Jun 2008
	01:37:16 -0700 (PDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: NOR MTD map driver up and running  but name coming as NULL
Date: Mon, 30 Jun 2008 01:37:15 -0700
Message-ID: <E06E3B7BBC07864CADE892DAF1EB0FBD090EA663@NT-SJCA-0752.brcm.ad.broadcom.com>
In-Reply-To: <E06E3B7BBC07864CADE892DAF1EB0FBD08FC36D5@NT-SJCA-0752.brcm.ad.broadcom.com>
References: <20080625131723.GA24006@mersenne.largestprime.net>
	<1214401352.6573.24.camel@sauron>
	<E06E3B7BBC07864CADE892DAF1EB0FBD08FC36D5@NT-SJCA-0752.brcm.ad.broadcom.com>
From: "Divyanshu Verma" <dverma@broadcom.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I am able to bring up NOR flash succsfully. The reason for the error was
2.6.14.2 not supporting  query version 1.4.
Anyway it is working fine and I can see the partitions on # cat
/proc/mtd.

Now for testing that device is it required that I need to put some fime
system on it, say jffs?
Also  on  doing cat /proc/mtd, I can see the partition names appearing
as "<NULL>" and not the ones that I declared in my map driver inside
instance of struct mtd_partitions

Following are my declarations and I aspire to see names as "BOOT" and
"Linux-Image".

Any help will be highly appreciated.

static struct mtd_partition BCM5892_nand_partition [] =3D {
{
        .name           =3D "BOOT",
        .offset         =3D 0,
        .size           =3D 0x0001000,
        .mask_flags     =3DMTD_WRITEABLE,
},

{
        .name           =3D "Linux-Image",
        .size           =3D MTDPART_SIZ_FULL,
        .offset         =3D MTDPART_OFS_NXTBLK,
},
};

Thanks and regards,
Divyanshu


-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org
[mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of Divyanshu
Verma
Sent: Thursday, June 26, 2008 2:55 PM
To: linux-mtd@lists.infradead.org
Subject: Getting Error in NOR MTD map driver

Hi,
 I am developing NOR MTD map driver for  SPANSION NOR. I am getting the
following error and hence not able to  detect the device.
Kindly help  me out.

 Unknown Amd/Fujitsu Extended Query version 1.4.
gen_probe: No supported Vendor Command Set found=20


Regards,
Divyanshu



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
