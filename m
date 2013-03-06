Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UD8Ys-0005dt-09
 for linux-mtd@lists.infradead.org; Wed, 06 Mar 2013 07:14:50 +0000
Message-ID: <1362554107.21850.4.camel@sauron>
Subject: Re: [PATCH 1/2] mtd: nand_ids: introduce helper macros
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 06 Mar 2013 09:15:07 +0200
In-Reply-To: <1362494376-1588-1-git-send-email-dedekind1@gmail.com>
References: <1362494376-1588-1-git-send-email-dedekind1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <b32955@freescale.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2013-03-05 at 16:39 +0200, Artem Bityutskiy wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> Introduce helper macros for defining NAND chips. These macros do not really add
> much value in the current code-base. However, we are going to add full ID
> support which adds some more complexity to the table, and helper macros become
> useful for readability.
> 
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Pushed to l2-mtd.git. If there is more review or tags coming, I can
amend the patches and re-base the tree. Thanks!

-- 
Best Regards,
Artem Bityutskiy
