Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XoJfd-0005dG-GM
 for linux-mtd@lists.infradead.org; Tue, 11 Nov 2014 22:12:18 +0000
Received: by mail-pa0-f42.google.com with SMTP id bj1so11465961pad.15
 for <linux-mtd@lists.infradead.org>; Tue, 11 Nov 2014 14:11:55 -0800 (PST)
Date: Tue, 11 Nov 2014 14:11:52 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: FAILED: patch "[PATCH] mtd: m25p80,spi-nor: Fix module aliases
 for m25p80" failed to apply to 3.17-stable tree
Message-ID: <20141111221152.GB24364@ld-irv-0074>
References: <14155940648@kroah.com> <20141110235349.GA24364@ld-irv-0074>
 <20141111051759.GC23920@kroah.com>
 <1415725705.3398.98.camel@decadent.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1415725705.3398.98.camel@decadent.org.uk>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ linux-mtd, Rafal

On Tue, Nov 11, 2014 at 05:08:25PM +0000, Ben Hutchings wrote:
> On Tue, 2014-11-11 at 14:17 +0900, Greg KH wrote:
> > On Mon, Nov 10, 2014 at 03:53:49PM -0800, Brian Norris wrote:
> > > On Mon, Nov 10, 2014 at 01:34:24PM +0900, Greg Kroah-Hartman wrote:
> > > > The patch below does not apply to the 3.17-stable tree.
> > > > If someone wants it applied there, or to any other stable or longterm
> > > > tree, then please email the backport, including the original git commit
> > > > id to <stable@vger.kernel.org>.
> > > 
> > > Did you follow the annotations in the commit message? The Canonical-run
> > > 3.16.x stable seemed to pick them up just fine. Or did I get the syntax
> > > wrong? (I still owe you an update to
> > > Documentation/stable-kernel-rules.txt, by the way.)
> > > 
> > > > ------------------ original commit in Linus's tree ------------------
> > > > 
> > > > From a5b7616c55e188fe3d6ef686bef402d4703ecb62 Mon Sep 17 00:00:00 2001
> > > ...
> > > > Fixes: 03e296f613af ("mtd: m25p80: use the SPI nor framework")
> > > > Cc: <stable@vger.kernel.org> # 3.16.x: 32f1b7c8352f: mtd: move support for struct flash_platform_data into m25p80
> > > > Cc: <stable@vger.kernel.org> # 3.16.x: 90e55b3812a1: mtd: m25p80: get rid of spi_get_device_id
> > > > Cc: <stable@vger.kernel.org> # 3.16.x: 70f3ce0510af: mtd: spi-nor: make spi_nor_scan() take a chip type name, not spi_device_id
> > > > Cc: <stable@vger.kernel.org> # 3.16.x
> > > 
> > > I am able to successfully checkout your linux-3.17.y and:
> > > 
> > > git cherry-pick 32f1b7c8352f
> > > git cherry-pick 90e55b3812a1
> > > git cherry-pick 70f3ce0510af
> > > git cherry-pick a5b7616c55e1
> > 
> > That all seems to be a ton of churn for a stable kernel patch,
> > especially something as "simple" as a module alias, don't you agree?
> > That's why I wouldn't apply all of those patches, sorry.

Then why did your original email state a different reason?

> Unfortunately there isn't a really tiny fix for this.  And I think
> losing all the module aliases is a pretty serious regression.

Definitely a serious regression, but I can understand Greg's reluctance
to pull in the other dependencies for -stable.

How about the following backport? I compile tested with
CONFIG_MTD_M25P80 as 'm' and 'y', and I made sure the module aliases
show up in modinfo.

From: Ben Hutchings <ben@decadent.org.uk>
Date: Tue, 30 Sep 2014 03:14:55 +0100
Subject: [PATCH] mtd: m25p80: Fix module aliases for m25p80

m25p80's device ID table is now spi_nor_ids, defined in spi-nor.  The
MODULE_DEVICE_TABLE() macro doesn't work with extern definitions, but
its use was also removed at the same time.  Now if m25p80 is built as
a module it doesn't get the necessary aliases to be loaded
automatically.

A clean solution to this will involve defining the list of device
IDs in spi-nor.h and removing struct spi_device_id from the spi-nor
API, but this is quite a large change.

As a quick fix suitable for stable, copy the device IDs back into
m25p80.

Fixes: 03e296f613af ("mtd: m25p80: use the SPI nor framework")
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
[Brian: backport without the dependencies]
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/devices/m25p80.c | 50 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index ed7e0a1bed3c..5935f0a3ac6f 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -245,6 +245,56 @@ static int m25p_remove(struct spi_device *spi)
 }
 
 
+/*
+ * XXX This needs to be kept in sync with spi_nor_ids.  We can't share
+ * it with spi-nor, because if this is built as a module then modpost
+ * won't be able to read it and add appropriate aliases.
+ */
+static const struct spi_device_id m25p_ids[] = {
+	{"at25fs010"},	{"at25fs040"},	{"at25df041a"},	{"at25df321a"},
+	{"at25df641"},	{"at26f004"},	{"at26df081a"},	{"at26df161a"},
+	{"at26df321"},	{"at45db081d"},
+	{"en25f32"},	{"en25p32"},	{"en25q32b"},	{"en25p64"},
+	{"en25q64"},	{"en25qh128"},	{"en25qh256"},
+	{"f25l32pa"},
+	{"mr25h256"},	{"mr25h10"},
+	{"gd25q32"},	{"gd25q64"},
+	{"160s33b"},	{"320s33b"},	{"640s33b"},
+	{"mx25l2005a"},	{"mx25l4005a"},	{"mx25l8005"},	{"mx25l1606e"},
+	{"mx25l3205d"},	{"mx25l3255e"},	{"mx25l6405d"},	{"mx25l12805d"},
+	{"mx25l12855e"},{"mx25l25635e"},{"mx25l25655e"},{"mx66l51235l"},
+	{"mx66l1g55g"},
+	{"n25q064"},	{"n25q128a11"},	{"n25q128a13"},	{"n25q256a"},
+	{"n25q512a"},	{"n25q512ax3"},	{"n25q00"},
+	{"pm25lv512"},	{"pm25lv010"},	{"pm25lq032"},
+	{"s25sl032p"},	{"s25sl064p"},	{"s25fl256s0"},	{"s25fl256s1"},
+	{"s25fl512s"},	{"s70fl01gs"},	{"s25sl12800"},	{"s25sl12801"},
+	{"s25fl129p0"},	{"s25fl129p1"},	{"s25sl004a"},	{"s25sl008a"},
+	{"s25sl016a"},	{"s25sl032a"},	{"s25sl064a"},	{"s25fl008k"},
+	{"s25fl016k"},	{"s25fl064k"},
+	{"sst25vf040b"},{"sst25vf080b"},{"sst25vf016b"},{"sst25vf032b"},
+	{"sst25vf064c"},{"sst25wf512"},	{"sst25wf010"},	{"sst25wf020"},
+	{"sst25wf040"},
+	{"m25p05"},	{"m25p10"},	{"m25p20"},	{"m25p40"},
+	{"m25p80"},	{"m25p16"},	{"m25p32"},	{"m25p64"},
+	{"m25p128"},	{"n25q032"},
+	{"m25p05-nonjedec"},	{"m25p10-nonjedec"},	{"m25p20-nonjedec"},
+	{"m25p40-nonjedec"},	{"m25p80-nonjedec"},	{"m25p16-nonjedec"},
+	{"m25p32-nonjedec"},	{"m25p64-nonjedec"},	{"m25p128-nonjedec"},
+	{"m45pe10"},	{"m45pe80"},	{"m45pe16"},
+	{"m25pe20"},	{"m25pe80"},	{"m25pe16"},
+	{"m25px16"},	{"m25px32"},	{"m25px32-s0"},	{"m25px32-s1"},
+	{"m25px64"},
+	{"w25x10"},	{"w25x20"},	{"w25x40"},	{"w25x80"},
+	{"w25x16"},	{"w25x32"},	{"w25q32"},	{"w25q32dw"},
+	{"w25x64"},	{"w25q64"},	{"w25q128"},	{"w25q80"},
+	{"w25q80bl"},	{"w25q128"},	{"w25q256"},	{"cat25c11"},
+	{"cat25c03"},	{"cat25c09"},	{"cat25c17"},	{"cat25128"},
+	{ },
+};
+MODULE_DEVICE_TABLE(spi, m25p_ids);
+
+
 static struct spi_driver m25p80_driver = {
 	.driver = {
 		.name	= "m25p80",
