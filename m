Received: from p01c11o142.mxlogic.net ([208.65.144.65])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NxpYb-0000MC-49
	for linux-mtd@lists.infradead.org; Fri, 02 Apr 2010 22:41:41 +0000
From: H Hartley Sweeten <hartleys@visionengravers.com>
To: Randy Dunlap <randy.dunlap@oracle.com>, lkml <linux-kernel@vger.kernel.org>
Date: Fri, 2 Apr 2010 17:41:25 -0500
Subject: RE: BUG: physmap modprobe & rmmod
Message-ID: <0D753D10438DA54287A00B0270842697636A7E9D2C@AUSP01VMBX24.collaborationhost.net>
References: <20100402134058.c4682716.randy.dunlap@oracle.com>
	<20100402144727.2c80a6b2.randy.dunlap@oracle.com>
	<0D753D10438DA54287A00B0270842697636A7E9CF1@AUSP01VMBX24.collaborationhost.net>
In-Reply-To: <0D753D10438DA54287A00B0270842697636A7E9CF1@AUSP01VMBX24.collaborationhost.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday, April 02, 2010 3:16 PM, H Hartley Sweeten wrote:
> On Friday, April 02, 2010 2:47 PM, Randy Dunlap wrote:
>>> 2.6.34-rc2 kernel:
>>>=20
>>> Boot up on a common PC, then: modprobe physmap ; rmmod physmap
>>> and bang.
>
> [snip]
>
>> This is with close to an allmodconfig on x86_64, including:
>>=20
>> CONFIG_MTD_PHYSMAP=3Dm
>> CONFIG_MTD_PHYSMAP_COMPAT=3Dy
>> CONFIG_MTD_PHYSMAP_START=3D0x8000000
>> CONFIG_MTD_PHYSMAP_LEN=3D0
>> CONFIG_MTD_PHYSMAP_BANKWIDTH=3D2
>
> That's probably the cause of the BUG.
>
> If your not run-time calling physmap_configure(), your resource will
> be created as:
>
> static struct physmap_flash_data physmap_flash_data =3D {
>	.width		=3D CONFIG_MTD_PHYSMAP_BANKWIDTH,
> };
>
> static struct resource physmap_flash_resource =3D {
>	.start		=3D CONFIG_MTD_PHYSMAP_START,
>	.end		=3D CONFIG_MTD_PHYSMAP_START + CONFIG_MTD_PHYSMAP_LEN - 1,
>	.flags		=3D IORESOURCE_MEM,
> };
>
> In other words:
>
> static struct physmap_flash_data physmap_flash_data =3D {
>	.width		=3D 2,
> };
>
> static struct resource physmap_flash_resource =3D {
>	.start		=3D 0x8000000,
>	.end		=3D 0x8000000 + 0 - 1,
>	.flags		=3D IORESOURCE_MEM,
> };

I traced this down to kernel/resource.c.  When __request_resource
is finally called, because of the platform_device_register, it ends
up returning a conflict due to:

	resource_size_t start =3D new->start;
	resource_size_t end =3D new->end;
	struct resource *tmp, **p;

	if (end < start)
		return root;

This ends up causing an -EBUSY error code.  The patch below should
be correct to fix this.

I changed the commit message a bit.

---

mtd/maps/physmap: catch failure to register MTD_PHYSMAP_COMPAT device

If the default Kconfig values are used with MTD_PHYSMAP_COMPAT you end
up with a resource where end < start.  This causes __request_resource to
return a conflict which then returns an -EBUSY error code.  The current
physmap.c code just assumes that the platfom_device_register will always
succeed.

Catch this failure during the physmap_init and propogate the error.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

---

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index d9603f7..426461a 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -264,8 +264,11 @@ static int __init physmap_init(void)
=20
 	err =3D platform_driver_register(&physmap_flash_driver);
 #ifdef CONFIG_MTD_PHYSMAP_COMPAT
-	if (err =3D=3D 0)
-		platform_device_register(&physmap_flash);
+	if (err =3D=3D 0) {
+		err =3D platform_device_register(&physmap_flash);
+		if (err)
+			platform_driver_unregister(&physmap_flash_driver);
+	}
 #endif
=20
 	return err;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
