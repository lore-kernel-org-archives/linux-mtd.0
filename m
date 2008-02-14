Received: from fk-out-0910.google.com ([209.85.128.185])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JPdg6-0008C7-6i
	for linux-mtd@lists.infradead.org; Thu, 14 Feb 2008 12:59:10 +0000
Received: by fk-out-0910.google.com with SMTP id 18so748913fkq.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 14 Feb 2008 04:59:01 -0800 (PST)
To: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH] mtd: Fix physmap_of to not exit upon unsuccessful
	partition scan
References: <1202832181-1783-1-git-send-email-sr@denx.de>
	<200802122015.08811.sr@denx.de> <47B1F30E.4000509@freescale.com>
	<200802122037.27864.sr@denx.de>
From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 14 Feb 2008 13:49:04 +0100
In-Reply-To: <200802122037.27864.sr@denx.de> (Stefan Roese's message of "Tue\,
	12 Feb 2008 20\:37\:27 +0100")
Message-ID: <87wsp7r9dr.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: Peter Korsgaard <jacmet@gmail.com>
Cc: Scott Wood <scottwood@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Stefan" == Stefan Roese <sr@denx.de> writes:

 Stefan> On Tuesday 12 February 2008, Scott Wood wrote:
 >> >> Under what conditions are you actually seeing this fail?
 >> >
 >> > When CONFIG_MTD_REDBOOT_PARTS is not defined for example it returns with
 >> > -22 (EINVAL).
 >> 
 >> Ah, I see -- it seems the cmdline partition code behaves differently
 >> than the redboot code.
 >> 
 >> Your patch changes it to treat zero as success, however -- which breaks
 >> some other cases.  The test should be "err <= 0", which is what
 >> parse_mtd_partiitions() itself uses in its loop.

 Stefan> OK, I'll fixup another version of this patch tomorrow.

I would prefer to fix up cmdlinepart.c instead, as missing cmdline
data isn't really an error.

>From 7cc1d55f9704a9df1053aefd21fd5db98ac4c983 Mon Sep 17 00:00:00 2001
From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 14 Feb 2008 13:46:13 +0100
Subject: [PATCH] cmdlinepart: Missing partition info is not an error

Return 0 partitions instead of -EINVAL on no mtdpart= argument on kernel
cmdline or missing partition info for device.
---
 drivers/mtd/cmdlinepart.c |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index b44292a..08b82c9 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -308,9 +308,6 @@ static int parse_cmdline_partitions(struct mtd_info *master,
 	struct cmdline_mtd_partition *part;
 	char *mtd_id = master->name;
 
-	if(!cmdline)
-		return -EINVAL;
-
 	/* parse command line */
 	if (!cmdline_parsed)
 		mtdpart_setup_real(cmdline);
@@ -341,7 +338,7 @@ static int parse_cmdline_partitions(struct mtd_info *master,
 			return part->num_parts;
 		}
 	}
-	return -EINVAL;
+	return 0;
 }
 
 
-- 
debian.1.5.3.7.1-dirty


-- 
Bye, Peter Korsgaard
