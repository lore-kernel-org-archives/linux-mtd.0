Received: from p02c12o147.mxlogic.net ([208.65.145.80])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PkOPp-0001Vu-C9
	for linux-mtd@lists.infradead.org; Tue, 01 Feb 2011 22:09:38 +0000
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: Kernel panic using add_mtd_partitions
Date: Tue, 1 Feb 2011 16:13:15 -0600
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1F2A4421@EXV1.corp.adtran.com>
From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

123456789012345678901234567890123456789012345678901234567890123456789012
I have gotten past the issue of not being able to see the NAND chip and
am working that issue (a symptom of an unrelated issue).

Now I'm attempting to use add_mtd_partitions() to specify the
partitions.
In the original kernel I was using (2.6.29) this worked without any
issue.  In 2.6.36.1, the kernel panics.  The code I'm attempting to use
to configure the partitions is as follows:

__maybe_unused static struct    mtd_partition   nand_partition_info[] =
=3D
{
        { .name =3D  "Kernel partition",
          .offset =3D 0,
          .size =3D   4 * 1024 * 1024,
        },
        { .name =3D  "Root partition",
          .offset =3D MTDPART_OFS_APPEND,
          .size =3D   MTDPART_SIZ_FULL,
        },
};



        add_mtd_partitions(&board_mtd, nand_partition_info,
ARRAY_SIZE(nand_partition_info));

Any help would be great!

Thanks,
Andy
