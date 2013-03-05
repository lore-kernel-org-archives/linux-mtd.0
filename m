Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCtAM-0001no-64
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 14:48:30 +0000
Message-ID: <1362494946.2943.55.camel@sauron>
Subject: Re: [PATCH 2/2] mtd: nand: provision full ID support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 05 Mar 2013 16:49:06 +0200
In-Reply-To: <1362494376-1588-2-git-send-email-dedekind1@gmail.com>
References: <1362494376-1588-1-git-send-email-dedekind1@gmail.com>
 <1362494376-1588-2-git-send-email-dedekind1@gmail.com>
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
> + * @dev_id: device ID part of the full chip ID array (refers the same memory
> + *          address as @id[0])

Here it should be @id[1] instead.

-- 
Best Regards,
Artem Bityutskiy
