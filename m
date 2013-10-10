Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VUAtu-0004Lh-02
 for linux-mtd@lists.infradead.org; Thu, 10 Oct 2013 07:43:14 +0000
Message-ID: <1381390962.7875.57.camel@sauron.fi.intel.com>
Subject: Re: Grow UBI device?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Date: Thu, 10 Oct 2013 10:42:42 +0300
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA20350@DBDE04.ent.ti.com>
References: <20131008192846.A25E7380A65@gemini.denx.de>
 <alpine.DEB.2.00.1310091038110.28562@lnxricardw.se.axis.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA20350@DBDE04.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-10-09 at 11:28 +0000, Gupta, Pekon wrote:
> Yes, during mounting of UBIFS volumes, UBI checks for erase-header
> on first-page of every block. 
> - If it's able to find a valid erase-header, with correct image_seq field,
> then it attaches it to its pool.
> - Otherwise, if the valid erase-header was not found, then it assumes
>  then it ubi will try re-erasing it. And add it to its pool of free-blocks.

I think there is a separate list for blocks with garbage, and if UBI
finds too much of them, it attaches R/O. So if it would find too many
JFFS2 eraseblocks, it would not erase them. But erasing the JFFS2 blocks
from outside of UBI driver would help.

-- 
Best Regards,
Artem Bityutskiy
