Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6hr9-00079q-AO
 for linux-mtd@lists.infradead.org; Tue, 06 Aug 2013 14:03:23 +0000
Message-ID: <1375798106.30770.146.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2 0/6] mtd: nand: cleanups to BBT
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 06 Aug 2013 17:08:26 +0300
In-Reply-To: <1375231980-13721-1-git-send-email-computersforpeace@gmail.com>
References: <1374647279-14083-1-git-send-email-computersforpeace@gmail.com>
 <1375231980-13721-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, Ivan Djelic <ivan.djelic@parrot.com>,
 linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Huang Shijie <b32955@freescale.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2013-07-30 at 17:52 -0700, Brian Norris wrote:
> Hi all,
> 
> This is v2 of my NAND BBT cleanup. The net diff is exactly the same as v1, but
> it splits up a few logical changes.
> 
> v1 -> v2:
>   Split up first patch into 3 patches, according to Ezequiel's comments.
>   Hopefully this makes it easier to read and review.

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
