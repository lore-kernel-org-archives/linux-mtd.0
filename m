Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UDvyW-0008Cj-Hd
 for linux-mtd@lists.infradead.org; Fri, 08 Mar 2013 12:00:37 +0000
Message-ID: <1362744073.21850.194.camel@sauron>
Subject: Re: [PATCH v2] mtd: ofpart: support partitions of 4 GB and larger
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Aaron Sierra <asierra@xes-inc.com>
Date: Fri, 08 Mar 2013 14:01:13 +0200
In-Reply-To: <9b66b475-1755-4842-b44e-4948ed7ed9d4@zimbra>
References: <9b66b475-1755-4842-b44e-4948ed7ed9d4@zimbra>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Joe Schaack <jschaack@xes-inc.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2013-02-21 at 16:29 -0600, Aaron Sierra wrote:
> From: Joe Schaack <jschaack@xes-inc.com>
> 
> Previously, partitions were limited to less than 4 GB in size because
> the address and size were read as 32-bit values. Add support for 64-bit
> values to support devices of 4 GB and larger.
> 
> Signed-off-by: Joe Schaack <jschaack@xes-inc.com>
> Signed-off-by: Nate Case <ncase@xes-inc.com>
> Signed-off-by: Aaron Sierra <asierra@xes-inc.com>

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
