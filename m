Received: from mms2.broadcom.com ([216.31.210.18])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KA3cn-0002e1-TO
	for linux-mtd@lists.infradead.org; Sat, 21 Jun 2008 13:59:30 +0000
Received: from mail-irva-8.broadcom.com (mail-irva-8 [10.11.18.52]) by
	mail-irva-10.broadcom.com (Postfix) with ESMTP id 7CBDE2B0 for
	<linux-mtd@lists.infradead.org>; Sat, 21 Jun 2008 06:59:17 -0700 (PDT)
Received: from NT-SJCA-0752.brcm.ad.broadcom.com (nt-sjca-0752
	[10.16.192.222]) by mail-sj1-12.sj.broadcom.com (Postfix) with ESMTP id
	097D220501 for <linux-mtd@lists.infradead.org>; Sat, 21 Jun 2008
	06:59:16 -0700 (PDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: Problem on recognise the CFI flash chip
Date: Sat, 21 Jun 2008 06:59:14 -0700
Message-ID: <E06E3B7BBC07864CADE892DAF1EB0FBD08D9A134@NT-SJCA-0752.brcm.ad.broadcom.com>
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
I am trying to detect NOR Flash (MTS29WS512 by Micron) on our SOC.  It
supports CFI and hence I am trying to use  "do_map_probe()", to detect
it. But it is returning NULL  and then comes out without detecting it.
 My NOR location starts at 0x30000000 and not at 0x0000000, so I get the
message "CFI: Found no BCM5892_CS1_NAND device at location zero", during
following code execution.
=20
 if (!genprobe_new_chip(map, cp, &cfi)) {
  /* The probe didn't like it */
  printk(KERN_DEBUG "%s: Found no %s device at location zero\n",
cp->name, map->name);
return NULL;
=20
=20
I kindly request someone to answer this and provide right pointer so
that  I can proceed further. Kind of stuck from past three days:-(.
=20
=20
thanks and regards,
Divyanshu
