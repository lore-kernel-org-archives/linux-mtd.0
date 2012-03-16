Received: from antispam01.maxim-ic.com ([205.153.101.182])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S8Xmn-0000X4-39
 for linux-mtd@lists.infradead.org; Fri, 16 Mar 2012 14:05:41 +0000
From: Brian Foster <brian.foster@maxim-ic.com>
To: <timothy.stotts@transport.alstom.com>
Subject: how to support 4096+224 page size with plat_nand ?
Date: Fri, 16 Mar 2012 15:05:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-ID: <201203161505.03858.brian.foster@maxim-ic.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Timothy,

 We have also used 4K + 224 NAND (not sure if the
 same part or not) with =E2=80=98plat_nand=E2=80=99 (and also with
 our own driver which uses our chip's ECC engine),
 in a v2.6.36-based Linux kernel.  (The kernel's
 version _may_ be important, since I _think_ some
 later kernels directly support 224 (and 218 and
 maybe 256) OOB sizes;  and/or correctly detecting
 the eraseblock size.)

 We didn't bother using the full 224-byts of OOB,
 but instaed are treating the device as having
 only 128-bytes of OOB.  Works fine, albeit we
 did have to add the part to the nand_flash_ids[]
 table since the eraseblock size wasn't correctly
 detected.

cheers!
	-blf-

=2D-=20
Brian Foster
Principal MTS, Software        |  La Ciotat, France
Maxim Integrated Products      |  Web:  http://www.maxim-ic.com/
