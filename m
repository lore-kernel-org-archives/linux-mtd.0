Received: from mail-ob0-x22c.google.com ([2607:f8b0:4003:c01::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W5KbC-0001s0-Vg
 for linux-mtd@lists.infradead.org; Mon, 20 Jan 2014 19:33:31 +0000
Received: by mail-ob0-f172.google.com with SMTP id vb8so7709797obc.17
 for <linux-mtd@lists.infradead.org>; Mon, 20 Jan 2014 11:33:09 -0800 (PST)
Date: Mon, 20 Jan 2014 11:33:06 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd: nand: add Intel manufacturer ID
Message-ID: <20140120193306.GO8919@ld-irv-0074>
References: <1388043465-17441-1-git-send-email-b32955@freescale.com>
 <1388739039-13584-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1388739039-13584-1-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 03, 2014 at 04:50:39PM +0800, Huang Shijie wrote:
> Add the Intel manufacturer Id.
> Tested with Intel JS29F32G08ACMD1(4096 + 224) which is ONFI 2.0 compliant
> nand.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>

Pushed to l2-mtd.git. Thanks!

Brian
