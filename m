From: "Gupta, Pekon" <pekon@ti.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "David
 Woodhouse" <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH 1/4] mtd: Add sysfs attr to expose ECC stats
Date: Thu, 27 Mar 2014 11:56:48 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAB91D7@DBDE04.ent.ti.com>
References: <1395403064-28113-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1395403064-28113-2-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1395403064-28113-2-git-send-email-ezequiel.garcia@free-electrons.com>
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

Hi Ezequiel,

>From: Ezequiel Garcia
>
>This new sysfs device attribute allows to retrieve the ECC stats
>by poking a sysfs file, which is much simpler than using the ioctl.
>
>The output format is inspired in block device sysfs 'stat' file.
>The ecc_stats struct fields are shown as ordered in the structure,
>in a machine parseable format.
>
>Here's a typical output showing 3 ECC-corrected and 8 bad blocks:
>       3        0        8        0
>
>Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
>---
> drivers/mtd/mtdcore.c | 14 ++++++++++++++
> 1 file changed, 14 insertions(+)
>
>diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
>index d201fee..c5e9943 100644
>--- a/drivers/mtd/mtdcore.c
>+++ b/drivers/mtd/mtdcore.c
>@@ -298,6 +298,19 @@ static ssize_t mtd_ecc_step_size_show(struct device *=
dev,
> }
> static DEVICE_ATTR(ecc_step_size, S_IRUGO, mtd_ecc_step_size_show, NULL);
>
>+static ssize_t mtd_ecc_stats_show(struct device *dev,
>+		struct device_attribute *attr, char *buf)
>+{
>+	struct mtd_info *mtd =3D dev_get_drvdata(dev);
>+	struct mtd_ecc_stats *ecc_stats =3D &mtd->ecc_stats;
>+
>+	return snprintf(buf, PAGE_SIZE, "%8u %8u %8u %8u\n", ecc_stats->correcte=
d,
>+						ecc_stats->failed,
>+						ecc_stats->badblocks,
>+						ecc_stats->bbtblocks);
Though I would have liked to see each field of ecc_stats as a separate sysf=
s entry
But, I don't know what it impacts to keep it different from /sys/block/<dev=
ice>/stat
Do you know any user-space tools which utilize these, and can be re-used on
UBI-block kind of layer, if we keep this compatibility ?

Also, How about printing what these numbers mean ?
I hope this will still keep it machine readable.
snprintf(buf, PAGE_SIZE, "%16s %16s %16s %16s\n",
					"ecc_corrected",
 					"ecc_failed",
					"ecc_badblocks",
					"ecc_bbtblocks");
 return snprintf(buf, PAGE_SIZE, " %16u  %16u  %16u  %16u\n",
					ecc_stats->corrected,
 					ecc_stats->failed,
					ecc_stats->badblocks,
					ecc_stats->bbtblocks);

>+}


>+static DEVICE_ATTR(ecc_stats, S_IRUGO, mtd_ecc_stats_show, NULL);
>+
> static struct attribute *mtd_attrs[] =3D {
> 	&dev_attr_type.attr,
> 	&dev_attr_flags.attr,
>@@ -310,6 +323,7 @@ static struct attribute *mtd_attrs[] =3D {
> 	&dev_attr_name.attr,
> 	&dev_attr_ecc_strength.attr,
> 	&dev_attr_ecc_step_size.attr,
>+	&dev_attr_ecc_stats.attr,
> 	&dev_attr_bitflip_threshold.attr,
> 	NULL,
> };
>--
>1.9.0
>

Also please update "Documentation/ABI/testing/sysfs-class-mtd"
with details about 'ecc_stats'

with regards, pekon
