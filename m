Received: from isilmar.linta.de ([213.133.102.198] helo=linta.de)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O2SrI-0006zF-7B
	for linux-mtd@lists.infradead.org; Thu, 15 Apr 2010 17:28:09 +0000
Date: Thu, 15 Apr 2010 19:27:50 +0200
From: Dominik Brodowski <linux@dominikbrodowski.net>
To: Alexander Kurz <linux@blala.de>
Subject: Re: [PATCH 2/2] drivers/mtd/maps/pcmciamtd.c: coding style cleanups
Message-ID: <20100415172750.GB27756@comet.dominikbrodowski.net>
References: <alpine.DEB.1.10.1004121949570.7438@blala.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="jI8keyz6grp/JLjh"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.1.10.1004121949570.7438@blala.de>
Cc: Karsten Keil <keil@b1-systems.de>, Magnus Damm <damm@opensource.se>,
	linux-pcmcia@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Alexander,

On Mon, Apr 12, 2010 at 07:51:12PM +0400, Alexander Kurz wrote:
> @@ -691,7 +701,8 @@ static void pcmciamtd_detach(struct pcmcia_device *link)
>  	if(dev->mtd_info) {
>  		del_mtd_device(dev->mtd_info);
>  		map_destroy(dev->mtd_info);
> -		info("mtd%d: Removed", dev->mtd_info->index);
> +		dev_info(&dev->p_dev->dev, "mtd%d: Removed\n",
> +			 dev->mtd_info->index);
>  	}

Could you switch the ordering between map_destroy() and dev_info(), please,
to avoid an use-after-free? See the attached message by Julia Lawall, who
noted this issue first.

Best,
	Dominik

--jI8keyz6grp/JLjh
Content-Type: message/rfc822
Content-Disposition: inline

Return-Path: <linux-kernel-owner@vger.kernel.org>
Delivered-To: dominikbrodowski+net-linux@dominikbrodowski.net
Received: (qmail 29300 invoked by uid 1000); 2 Apr 2010 12:48:13 -0000
Delivered-To: linta+de-brodo-linux-lkml@linta.de
Received: (qmail 29267 invoked from network); 2 Apr 2010 12:47:59 -0000
Received: from vger.kernel.org (209.132.180.67)
  by isilmar.linta.de with SMTP; 2 Apr 2010 12:47:59 -0000
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id S1757649Ab0DBMrq (ORCPT <rfc822;brodo-linux-lkml@linta.de>);
	Fri, 2 Apr 2010 08:47:46 -0400
Received: from mgw2.diku.dk ([130.225.96.92]:59366 "EHLO mgw2.diku.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752811Ab0DBMrl (ORCPT <rfc822;linux-kernel@vger.kernel.org>);
	Fri, 2 Apr 2010 08:47:41 -0400
Received: from localhost (localhost [127.0.0.1])
	by mgw2.diku.dk (Postfix) with ESMTP id 3DDD219BC1E;
	Fri,  2 Apr 2010 14:47:40 +0200 (CEST)
Received: from mgw2.diku.dk ([127.0.0.1])
 by localhost (mgw2.diku.dk [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
 id 23825-12; Fri,  2 Apr 2010 14:47:39 +0200 (CEST)
Received: from nhugin.diku.dk (nhugin.diku.dk [130.225.96.140])
	by mgw2.diku.dk (Postfix) with ESMTP id 031C119BC0F;
	Fri,  2 Apr 2010 14:47:39 +0200 (CEST)
Received: from ask.diku.dk (ask.diku.dk [130.225.96.225])
	by nhugin.diku.dk (Postfix) with ESMTP
	id 378C96DFBF1; Fri,  2 Apr 2010 14:41:24 +0200 (CEST)
Received: by ask.diku.dk (Postfix, from userid 3767)
	id DE841200B0; Fri,  2 Apr 2010 14:47:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ask.diku.dk (Postfix) with ESMTP id D5723200AC;
	Fri,  2 Apr 2010 14:47:38 +0200 (CEST)
Date: Fri, 2 Apr 2010 14:47:38 +0200 (CEST)
From: Julia Lawall <julia@diku.dk>
To: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH 2/3] drivers/mtd/maps: Eliminate use after free
Message-ID: <Pine.LNX.4.64.1004021447160.17695@ask.diku.dk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Virus-Scanned: amavisd-new at diku.dk
Sender: linux-kernel-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Moved the debugging message before the call to map_destroy, which frees its
argument.  The message is also slightly changed to reflect its new
position.

A simplified version of the semantic patch that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression E,E2;
@@

del_mtd_device(E)
...
(
  E = E2
|
* E
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/mtd/maps/pcmciamtd.c        |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/pcmciamtd.c b/drivers/mtd/maps/pcmciamtd.c
index 87b2b8f..3e339de 100644
--- a/drivers/mtd/maps/pcmciamtd.c
+++ b/drivers/mtd/maps/pcmciamtd.c
@@ -689,8 +689,8 @@ static void pcmciamtd_detach(struct pcmcia_device *link)
 
 	if(dev->mtd_info) {
 		del_mtd_device(dev->mtd_info);
+		info("mtd%d: Removing", dev->mtd_info->index);
 		map_destroy(dev->mtd_info);
-		info("mtd%d: Removed", dev->mtd_info->index);
 	}
 
 	pcmciamtd_release(link);
--
To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at  http://www.tux.org/lkml/

--jI8keyz6grp/JLjh--
