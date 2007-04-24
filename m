Received: from mail128.messagelabs.com ([216.82.250.131])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HgKXu-0003Bj-M1
	for linux-mtd@lists.infradead.org; Tue, 24 Apr 2007 08:55:04 -0400
Received: from il06exr01.mot.com (il06exr01.mot.com [129.188.137.131])
	by motgate8.mot.com (8.12.11/Motorola) with ESMTP id l3OCsxcO009693
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 Apr 2007 05:54:59 -0700 (MST)
Received: from il06vts03.mot.com (il06vts03.mot.com [129.188.137.143])
	by il06exr01.mot.com (8.13.5/Vontu) with SMTP id l3OCsxCb023805
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 Apr 2007 07:54:59 -0500 (CDT)
Received: from zuk35exm60.ds.mot.com (zuk35exm60.ea.mot.com [10.178.1.39])
	by il06exr01.mot.com (8.13.5/8.13.0) with ESMTP id l3OCswGB023793
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 Apr 2007 07:54:59 -0500 (CDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: MTD partitions and sysfs
Date: Tue, 24 Apr 2007 13:54:53 +0100
Message-ID: <67194FEE6056B947B4EF756C9E497A2E017D7003@zuk35exm60.ds.mot.com>
From: "Demke Torsten-atd012" <torsten.demke@motorola.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I have a PPC system that running 2.6.14+ with several MTD partitions
0..11
I was struggeling to boot from a partition root=3D/dev/mtdblock10 =
because
the name_to_dev_t function in do_mounts.c could not find mtdblock10 in
sysfs.
After some debuging I found, that in sysfs the device is called
"sys/block/mtdblock:"
(where ":" is the next ASCII character after "9"). That means I have to
use
root=3D/dev/mtdblock: within the bootloader...

Any hints or comments?

Regards,
Torsten
