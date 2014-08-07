Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFOfB-0006Ix-4E
 for linux-mtd@lists.infradead.org; Thu, 07 Aug 2014 14:27:29 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 6/8] mtd: spi-nor: drop replaceable wait-till-ready
 function pointer
Date: Thu, 7 Aug 2014 16:25:11 +0200
References: <1407374222-8448-1-git-send-email-computersforpeace@gmail.com>
 <1407374222-8448-7-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1407374222-8448-7-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201408071625.11136.marex@denx.de>
Cc: Huang Shijie <b32955@freescale.com>, zajec5@gmail.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday, August 07, 2014 at 03:17:00 AM, Brian Norris wrote:
> We don't need to expose a 'wait-till-ready' interface to drivers. Status
> register polling should be handled by the core spi-nor.c library, and as
> of now, I see no need to provide a special driver-specific hook for it.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Very nice,

Reviewed-by: Marek Vasut <marex@denx.de>

Best regards,
Marek Vasut
