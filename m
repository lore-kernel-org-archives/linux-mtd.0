Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b2DWv-0008Bc-8K
 for linux-mtd@lists.infradead.org; Mon, 16 May 2016 08:05:33 +0000
Date: Mon, 16 May 2016 10:05:11 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 moritz.fischer.private@gmail.com
Subject: Re: [PATCH] mtd: Adding of_mtd_info_get to get mtd_info from
 devicetree
Message-ID: <20160516100511.360c89c9@bbrezillon>
In-Reply-To: <20160516095534.727fcac6@bbrezillon>
References: <1462988859-32240-1-git-send-email-moritz.fischer@ettus.com>
 <20160516095534.727fcac6@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 16 May 2016 09:55:34 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Hi Moritz,
> 
> On Wed, 11 May 2016 10:47:39 -0700
> Moritz Fischer <moritz.fischer@ettus.com> wrote:
> 
> > This allows for getting a struct mtd_info from a node pointer,
> > allowing mtd devices to e.g. store serial numbers or MAC addresses.  
> 
> Can you detail a bit what you'll do next. I guess you need to provide
> this information to in-kernel users, and those users will just call
> mtd_read() after retrieving the mtd_info pointer.
> 
> Here are a few questions (I'm assuming the netdev + MAC address case):
> - how would you link the net/PHY device to the MTD partition storing
>   the MAC address

Sorry, I sent it before asking all my questions :).

- it seems quite specific to MTD devices to me. What if the MAC address
  is stored in something that is not exposed as an MTD device. I wonder
  if we shouldn't add an nvmem wrapper around MTD devices.


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
