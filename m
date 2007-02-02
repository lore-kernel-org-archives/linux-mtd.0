Received: from sorrow.cyrius.com ([65.19.161.204])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HD2w4-0005mO-BR
	for linux-mtd@lists.infradead.org; Fri, 02 Feb 2007 13:14:57 -0500
Date: Fri, 2 Feb 2007 19:14:41 +0100
From: Martin Michlmayr <tbm@cyrius.com>
To: "Williams, Dan J" <dan.j.williams@intel.com>
Subject: Re: Oops parsing empty RedBoot partition with 2.6.20-rc7
Message-ID: <20070202181441.GA2034@deprecation.cyrius.com>
References: <20070202155607.GA31304@deprecation.cyrius.com>
	<0C7297FA1D2D244A9C7F6959C0BF1E520148F6A0@azsmsx413.amr.corp.intel.com>
	<20070202175755.GG24587@deprecation.cyrius.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20070202175755.GG24587@deprecation.cyrius.com>
Cc: linux-mtd@lists.infradead.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
	buytenh@wantstofly.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Martin Michlmayr <tbm@cyrius.com> [2007-02-02 18:57]:
> It was caused by:
> 
>     [MTD] redboot partition combined fis / config problem

And this fixes it for me:

[MTD] Don't oops when the RedBoot partition table is empty

This fixes a regression with the RedBoot parsing code introduced by
commit 0b47d654089c5ce3f2ea26a4485db9bcead1e515

Signed-off-by: Martin Michlmayr <tbm@cyrius.com>

--- a/drivers/mtd/redboot.c
+++ b/drivers/mtd/redboot.c
@@ -122,7 +122,7 @@ static int parse_redboot_partitions(struct mtd_info *master,
 				}
 			}
 			break;
-		} else {
+		} else if (buf[i].size != -1) {
 			/* re-calculate of real numslots */
 			numslots = buf[i].size / sizeof(struct fis_image_desc);
 		}

-- 
Martin Michlmayr
http://www.cyrius.com/
