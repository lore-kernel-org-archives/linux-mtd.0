Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ad0MP-0008UW-Ee
 for linux-mtd@lists.infradead.org; Mon, 07 Mar 2016 18:58:32 +0000
Received: by mail-pa0-x242.google.com with SMTP id hj7so8199116pac.1
 for <linux-mtd@lists.infradead.org>; Mon, 07 Mar 2016 10:58:08 -0800 (PST)
Date: Mon, 7 Mar 2016 10:58:05 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Roger Quadros <rogerq@ti.com>
Cc: tony@atomide.com, dwmw2@infradead.org, ezequiel@vanguardiasur.com.ar,
 javier@dowhile0.org, fcooper@ti.com, nsekhar@ti.com,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v5 10/26] mtd: nand: omap: Update DT binding documentation
Message-ID: <20160307185805.GV55664@google.com>
References: <1455916548-3441-1-git-send-email-rogerq@ti.com>
 <1455916548-3441-11-git-send-email-rogerq@ti.com>
 <20160305020430.GL55664@google.com> <56DD4DF0.4020500@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56DD4DF0.4020500@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 07, 2016 at 11:46:24AM +0200, Roger Quadros wrote:
> On 05/03/16 04:04, Brian Norris wrote:
> > Is it normal to mix types of addressing in a single 'reg' property? Is
> > your code working for anything besides CS==0?
> 
> Yes we're using non zero CS on different omap platforms.
> I haven't changed the behaviour of the reg property in this series. Just updated the documentation.
> 
> I didn't understand what you meant by mixing type of addressing.
> 
> This usage is exactly as mentioned here
> http://devicetree.org/Device_Tree_Usage#Ranges_.28Address_Translation.29

I think I was just misunderstanding the use of the reg, *-cells, and
ranges properties here. Thanks for the pointer.

Brian
