Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7O9y-0002hC-Se
 for linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 12:18:11 +0000
Message-ID: <1405513065.5423.17.camel@sauron.fi.intel.com>
Subject: Re: ubifs error at boot "bad node type"
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Genoud <richard.genoud@gmail.com>
Date: Wed, 16 Jul 2014 15:17:45 +0300
In-Reply-To: <53BBC39F.7010307@gmail.com>
References: <53BBC39F.7010307@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-07-08 at 12:10 +0200, Richard Genoud wrote:
> [   87.054687] UBIFS error (pid 652): ubifs_read_node: bad node type
> (255 but expected 0)
> [   87.062500] UBIFS error (pid 652): ubifs_read_node: bad node at LEB
> 405:39728, LEB mapping status 1
> [   87.070312] Not a node, first 24 bytes:

I think it is a good idea do dump the flash and save it, just in case.

So the LEB is mapped.

But the TNC points to an an area with all 0xFFs.

Either TNC is incorrect or, the UBI did not map the LEB to the correct
PEB. "Fastmap" would be an easy target to blame for me, but if it is not
used, I'd say the former is more probably.

Enabling full UBI/UBIFS debugging and reproducing the failure could
help.

And please, do save the flash image (use nanddump).

-- 
Best Regards,
Artem Bityutskiy
