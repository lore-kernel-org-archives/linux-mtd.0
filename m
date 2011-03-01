Received: from mail3.tridentmicro.com ([212.250.142.51])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PuI3D-0000oG-Hk
	for linux-mtd@lists.infradead.org; Tue, 01 Mar 2011 05:23:12 +0000
From: Sankara Narayanan Balasubramanian <sankara.narayanan@tridentmicro.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Tue, 1 Mar 2011 05:23:04 +0000
Subject: JFFS2_WBUF_VERIFY patch clarification
Message-ID: <C7C7E27CD4B28D47A856D6DA52BA5D9E8E2557FE@eu-exh-02.EU.TRID.COM>
Content-Language: en-US
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

Hi,

We are using JFFS2 as part of our linux kernel v2.6.18 in our product. We a=
re using JFFS2 file system on top of the MTD Driver for NAND Flash (SLC Nan=
d flash). We observe the problem during our long duration file write tests =
(endurance tests) that occasionally the data written through the fwrite fun=
ction call is not present in the flash.=20

We checked the latest kernel sources (2.6.37) and observed a similar proble=
m being resolved through the JFFS2_WBUF_VERIFY patch. We took only that pat=
ch (implementation into our wbuf.c file) and we observe that the problem is=
 resolved. We request you to provide the feedback for the following.

1.	Can this patch be taken as a stand-alone patch into our existing JFFS2 a=
s part of linux 2.6.18 release.
2.	What is the exact behavior of the patch? We observe that the patch ensur=
es that the jffs2_wbuf_recovery is called once more if the first attempt to=
 verify fails. How does it ensure that the data is written into the flash p=
roperly?=20
3.	Are there any chances / known instances that the patch may fail (if the =
second attempt to recovery also fail)?

Pls note that we cannot move to the latest version of kernel as this produc=
t is in maintenance phase.

With regards,
Sankara Narayanan B
