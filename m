Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UtZTz-0002zD-5S
 for linux-mtd@lists.infradead.org; Mon, 01 Jul 2013 08:29:12 +0000
Message-ID: <1372667559.22014.48.camel@sauron.fi.intel.com>
Subject: Re: [RESEND v2 PATCH] mtd: nand: nand_bbt: scan for next free bbt
 block if writing bbt fails
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Mon, 01 Jul 2013 11:32:39 +0300
In-Reply-To: <1368714102-8399-1-git-send-email-jeff.westfahl@ni.com>
References: <1368714102-8399-1-git-send-email-jeff.westfahl@ni.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Jeff Westfahl <jeff.westfahl@ni.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2013-05-16 at 09:21 -0500, Jeff Westfahl wrote:
> If erasing or writing the BBT fails, we should mark the current BBT block
> as bad and use the BBT descriptor to scan for the next available unused
> block in the BBT. We should only return a failure if there isn't any space
> left.
> 
> Signed-off-by: Jeff Westfahl <jeff.westfahl@ni.com>

Hi Brian, I think this is another "Brien gook a glimpse" case :-) You
are our bad blocks expert nowadays, and if you could help reviewing this
patch, it would be cool.

-- 
Best Regards,
Artem Bityutskiy
