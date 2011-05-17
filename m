Subject: Re: [PATCH v5 1/8] MTD: Add integrator-flash feature to physmap
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>, Marc Zyngier
	<marc.zyngier@arm.com>
In-Reply-To: <20110517074348.GA26669@n2100.arm.linux.org.uk>
References: <1305557977-16871-1-git-send-email-marc.zyngier@arm.com>
	<1305557977-16871-2-git-send-email-marc.zyngier@arm.com>
	<1305610643.2630.15.camel@localhost>
	<1305611178.2630.21.camel@localhost>
	<20110517074348.GA26669@n2100.arm.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 17 May 2011 11:13:09 +0300
Message-ID: <1305619989.2630.31.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-05-17 at 08:43 +0100, Russell King - ARM Linux wrote:
> On Tue, May 17, 2011 at 08:46:18AM +0300, Artem Bityutskiy wrote:
> > On Tue, 2011-05-17 at 08:37 +0300, Artem Bityutskiy wrote:
> > > Sorry if this sounds like an attack, it is not. I just think that we
> > > carry crap for too long and should start forcing people to clean it up
> > > by not accepting changes :-)
> > 
> > Sorry, I forgot to note that I do not insist that you have to re-work
> > MTD partitions support - you already do a very good thing by killing a
> > redundant driver, and delaying this would be counter-productive. But I
> > anyway wanted to express my thoughts.
> 
> So, what's happening with this patch set?  I'd like to have an ack from
> the MTD people for the set.

David should answer, but from my POW the patches are OK. The "#ifdef
CONFIG_MTD_AFS_PARTS" is ugly. I think it can be just killed, it just
needs an additional patch to silence the kernel (completely untested,
Marc, could you please check it?):


>From 8dd2f442c7acd5d45e2f35471846c68b26619eb2 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Tue, 17 May 2011 11:13:17 +0300
Subject: [PATCH] mtd: be silent when mtd partition parser cannot be found

Currently when we register partitions in 'parse_mtd_partitions()' we accept the
list of parsers we should try. And if one of the parsers was not found we print
a message. Well, first of all this whole idea is bad - look at how many
'part_probes' and 'part_probe_types' variables we have - nearly every driver
defines one. Instead, we should just go through all registered parsers all the
time. But this needs to be worked on separately.

This patch makes life of MTD partitions' users a bit simpler and allows them to
safely request parsers which have not been registered -
'parse_mtd_partitions()' will not print a "not available" message in this
case.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/mtdpart.c |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 0a47601..cd631e7 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -722,11 +722,8 @@ int parse_mtd_partitions(struct mtd_info *master, const char **types,
 		parser = get_partition_parser(*types);
 		if (!parser && !request_module("%s", *types))
 				parser = get_partition_parser(*types);
-		if (!parser) {
-			printk(KERN_NOTICE "%s partition parsing not available\n",
-			       *types);
+		if (!parser)
 			continue;
-		}
 		ret = (*parser->parse_fn)(master, pparts, origin);
 		if (ret > 0) {
 			printk(KERN_NOTICE "%d %s partitions found on MTD device %s\n",
-- 
1.7.2.3

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
