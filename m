Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QoIxG-0007jp-LP
	for linux-mtd@lists.infradead.org; Tue, 02 Aug 2011 17:40:35 +0000
Received: by wwf22 with SMTP id 22so3114wwf.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 02 Aug 2011 10:40:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAGq3pz4LHRkCqaJfqoMYe-=mn+s5CVZipab7bd8F3z+ou3xxVA@mail.gmail.com>
References: <CAGq3pz4LHRkCqaJfqoMYe-=mn+s5CVZipab7bd8F3z+ou3xxVA@mail.gmail.com>
Date: Tue, 2 Aug 2011 10:40:29 -0700
Message-ID: <CAN8TOE9mWEmS5YJqNrS9OrG=t+emeLcXNpKR1BiZ6VDJW7_c=A@mail.gmail.com>
Subject: Re: MTD-related kobject badness during linux-next boot
From: Brian Norris <computersforpeace@gmail.com>
To: Daniel Drake <dsd@laptop.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	Jamie Iles <jamie@jamieiles.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I CC'd Dmitry and Jamie who did recent work on this area of MTD,
regarding a subsystem-wide simplification of the routines for
partitioning and registering devices. I don't personally develop with
the cafe_nand driver, but I can try to help.

On Thu, Jul 14, 2011 at 10:37 AM, Daniel Drake <dsd@laptop.org> wrote:
> Booting linux-next 20110707 on OLPC XO-1 I get:
> [ =A0 =A01.172947] kobject (cd8d40dc): tried to init an initialized
> object, something is seriously wrong.
> [ =A0 =A01.184111] Pid: 1, comm: swapper Not tainted 3.0.0-rc6-next-20110=
707+ #100
> [ =A0 =A01.198384] Call Trace:
> [ =A0 =A01.207741] =A0[<c05301a0>] ? kobject_init+0x24/0x6b
> [ =A0 =A01.212420] =A0[<c0578c49>] ? device_initialize+0x18/0x56
> [ =A0 =A01.227060] =A0[<c057960a>] ? device_register+0x8/0x10
> [ =A0 =A01.241052] =A0[<c059104a>] ? add_mtd_device+0x17a/0x1f1
> [ =A0 =A01.244949] =A0[<c0591128>] ? mtd_device_parse_register+0x67/0x7c
> [ =A0 =A01.259536] =A0[<c06c6522>] ? cafe_nand_probe+0x5c9/0x686
...
> Any ideas?

Yeah, I think it has to do with Dmitry Eremin-Solenikov's recent
changes in l2-mtd-2.6.git. Looks like the driver is trying calling
add_mtd_device() on the master MTD twice. The problem commit is (for
now):
commit 0f7451bea72c64d3f0a47850328d52f0315e2ea6
"mtd: cafe_nand.c: use mtd_device_parse_register"

Have you tried linux 3.0, which does not have the patch series that
messes with mtd partition parsing and registering?

It looks like previously, cafe_nand would always add the master
device, then it would parse and register its partitions, if found.

Since Dmitry's change, it looks like cafe_nand will add the master
device, then parse and register its partitions, if found. However, if
partitions are NOT found, then mtd_device_parse_register() falls back
to adding the master device, which was already added. In
drivers/mtd/mtdcore.c, see:

     int mtd_device_parse_register(struct mtd_info *mtd, const char **types=
,
     ...
     if (err > 0) {
     ...
     } else if (err =3D=3D 0) {
             err =3D add_mtd_device(mtd);
     ...


So it looks like perhaps we can solve the problem by just killing the
"register the whole device first" and allow mtd_device_parse_register
to do it if there are no partitions. Any cafe_nand developers know if
this is a problem? i.e., is there a reason we need both the whole
device AND the partitions sent to add_mtd_device()? I'll send a full
patch with sign-off and description if there are no objections.

Brian

---
 drivers/mtd/nand/cafe_nand.c |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
index fb1425e..72d3f23 100644
--- a/drivers/mtd/nand/cafe_nand.c
+++ b/drivers/mtd/nand/cafe_nand.c
@@ -798,9 +798,6 @@ static int __devinit cafe_nand_probe(struct pci_dev *pd=
ev,

        pci_set_drvdata(pdev, mtd);

-       /* We register the whole device first, separate from the partitions=
 */
-       mtd_device_register(mtd, NULL, 0);
-
        mtd->name =3D "cafe_nand";
        mtd_device_parse_register(mtd, part_probes, 0, NULL, 0);

--=20
1.7.0.4
