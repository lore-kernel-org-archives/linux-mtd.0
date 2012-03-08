Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5cAD-00076j-DF
 for linux-mtd@lists.infradead.org; Thu, 08 Mar 2012 12:09:46 +0000
Message-ID: <1331208736.7257.39.camel@sauron.fi.intel.com>
Subject: Re: Error whe mounting ubifs volume
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Patrick <kpa_info@yahoo.fr>
Date: Thu, 08 Mar 2012 14:12:16 +0200
In-Reply-To: <1329843430.47249.YahooMailNeo@web29019.mail.ird.yahoo.com>
References: <1329843430.47249.YahooMailNeo@web29019.mail.ird.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2012-02-21 at 16:57 +0000, Patrick wrote:
> On the kernel log I have the following error:
> 
>  UBIFS error (pid 397): ubifs_read_node: bad node type (0 but expected 6)
>  UBIFS error (pid 397): ubifs_read_node: bad node at LEB 0:0, LEB mapping status 1

Looks like you did not flash your image properly.

Does it work if you just mount an empty volume, then unmount, then mount
again?

-- 
Best Regards,
Artem Bityutskiy
