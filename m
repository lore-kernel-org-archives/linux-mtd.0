Received: from exprod6og105.obsmtp.com ([64.18.1.189])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lf1Jo-00046v-6Q
	for linux-mtd@lists.infradead.org; Thu, 05 Mar 2009 00:20:11 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH] mtd: add setup/teardown callbacks to plat_nand
Date: Wed, 4 Mar 2009 19:19:24 -0500
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909013B6E03@mi8nycmail19.Mi8.com>
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE19090120C0C9@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE19090120C059@mi8nycmail19.Mi8.com><8bd0f97a0902091428u5e629485ke7762cbffe8b97dc@mail.gmail.com>
	<BD79186B4FD85F4B8E60E381CAEE19090120C0C9@mi8nycmail19.Mi8.com>
From: "hartleys" <hartleys@visionengravers.com>
To: <linux-mtd@lists.infradead.org>
Cc: Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Any other comments on this patch?  If it looks ok how do I get it
applied?

Regards,
Hartley=20

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org
[mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of hartleys
Sent: Monday, February 09, 2009 3:55 PM
To: Mike Frysinger
Cc: linux-mtd@lists.infradead.org
Subject: RE: [PATCH] mtd: add setup/teardown callbacks to plat_nand

On Monday, February 09, 2009 3:28 PM, Mike Frysinger wrote:
> On Mon, Feb 9, 2009 at 16:37, hartleys wrote:
>> Add optional setup and teardown callbacks to the plat_nand driver.
>>
>> Some platforms may require additional setup, such as configuring
>> the memory controller, before the nand device can be accessed.=20
>> This patch provides an optional callback to handle this setup as
>> well as a callback to teardown the setup.
>
> on our platforms, we've been putting the setup into the board init
> code.  but it would certainly be much saner to have explicit steps
> for it in the plat_nand code as you suggest.
>
> i think having the naming convention follow existing practices
> would be better.  then we dont have to keep our index of synonyms
> around. i.e. change "setup" to "probe" and "teardown" to "remove"
> -mike

I've seen both naming conventions used in various drivers.  I'm not sure
which is the best option.

The "setup", or "probe", callback doesn't/shouldn't to any actual
probing for the nand device, that's handled by the driver.  It's only
purpose should be to correctly configure the hardware to allow the probe
to work.

But, here is the patch again with the changes as suggested.

I also noticed that a header was missing in linux/mtd/nand.h due to the
callbacks.  I wasn't sure what various platforms might need so I just
coded this to pass the struct platform_device.  I guess they could both
just be a void parameter.  Any suggestions...

Thanks,
Hartley

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

---

diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index 75f9f48..600fbe9 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -70,6 +70,13 @@ static int __init plat_nand_probe(struct
platform_device *pdev)
=20
 	platform_set_drvdata(pdev, data);
=20
+	/* Handle any platform specific setup */
+	if (pdata->ctrl.probe) {
+		res =3D pdata->ctrl.probe(pdev);
+		if (res)
+			goto out;
+	}
+
 	/* Scan to find existance of the device */
 	if (nand_scan(&data->mtd, 1)) {
 		res =3D -ENXIO;
@@ -99,6 +106,8 @@ static int __init plat_nand_probe(struct
platform_device *pdev)
=20
 	nand_release(&data->mtd);
 out:
+	if (pdata->ctrl.remove)
+		pdata->ctrl.remove(pdev);
 	platform_set_drvdata(pdev, NULL);
 	iounmap(data->io_base);
 	kfree(data);
@@ -111,15 +120,15 @@ out:
 static int __devexit plat_nand_remove(struct platform_device *pdev)
 {
 	struct plat_nand_data *data =3D platform_get_drvdata(pdev);
-#ifdef CONFIG_MTD_PARTITIONS
 	struct platform_nand_data *pdata =3D pdev->dev.platform_data;
-#endif
=20
 	nand_release(&data->mtd);
 #ifdef CONFIG_MTD_PARTITIONS
 	if (data->parts && data->parts !=3D pdata->chip.partitions)
 		kfree(data->parts);
 #endif
+	if (pdata->ctrl.remove)
+		pdata->ctrl.remove(pdev);
 	iounmap(data->io_base);
 	kfree(data);
=20
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index db5b63d..8534924 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -18,6 +18,7 @@
 #ifndef __LINUX_MTD_NAND_H
 #define __LINUX_MTD_NAND_H
=20
+#include <linux/platform_device.h>
 #include <linux/wait.h>
 #include <linux/spinlock.h>
 #include <linux/mtd/mtd.h>
@@ -579,6 +580,8 @@ struct platform_nand_chip {
=20
 /**
  * struct platform_nand_ctrl - controller level device structure
+ * @probe:		platform specific function to probe/setup
hardware
+ * @remove:		platform specific function to remove/teardown
hardware
  * @hwcontrol:		platform specific hardware control structure
  * @dev_ready:		platform specific function to read ready/busy
pin
  * @select_chip:	platform specific chip select function
@@ -589,6 +592,8 @@ struct platform_nand_chip {
  * All fields are optional and depend on the hardware driver
requirements
  */
 struct platform_nand_ctrl {
+	int		(*probe)(struct platform_device *pdev);
+	void		(*remove)(struct platform_device *pdev);
 	void		(*hwcontrol)(struct mtd_info *mtd, int cmd);
 	int		(*dev_ready)(struct mtd_info *mtd);
 	void		(*select_chip)(struct mtd_info *mtd, int chip);=20

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
