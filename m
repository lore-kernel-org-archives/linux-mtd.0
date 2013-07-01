Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UtZOJ-0002oW-Vq
 for linux-mtd@lists.infradead.org; Mon, 01 Jul 2013 08:23:20 +0000
Message-ID: <1372667224.22014.46.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: nand: nand_bbt: scan for next free bbt block if
 writing bbt fails
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jeff Westfahl <jeff.westfahl@ni.com>
Date: Mon, 01 Jul 2013 11:27:04 +0300
In-Reply-To: <OF97DE13B9.4C0523A2-ON86257B6C.00717E04-86257B6C.0071F1E7@ni.com>
References: <OF97DE13B9.4C0523A2-ON86257B6C.00717E04-86257B6C.0071F1E7@ni.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-05-15 at 15:44 -0500, Jeff Westfahl wrote:
> If erasing or writing the BBT fails, we should mark the current BBT block
> as bad and use the BBT descriptor to scan for the next available unused
> block in the BBT. We should only return a failure if there isn't any space
> left.
> 
> Signed-off-by: Jeff Westfahl <jeff.westfahl@ni.com>

Would you please re-send your patch so that it would not be
line-wrapped?

-- 
Best Regards,
Artem Bityutskiy
