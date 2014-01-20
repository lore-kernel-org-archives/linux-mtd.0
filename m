Received: from mail-qe0-x22e.google.com ([2607:f8b0:400d:c02::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W5KNh-0001QJ-Bu
 for linux-mtd@lists.infradead.org; Mon, 20 Jan 2014 19:19:33 +0000
Received: by mail-qe0-f46.google.com with SMTP id 8so6611427qea.5
 for <linux-mtd@lists.infradead.org>; Mon, 20 Jan 2014 11:19:12 -0800 (PST)
Date: Mon, 20 Jan 2014 11:19:08 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Eunbong Song <eunb.song@samsung.com>
Subject: Re: [PATCH] mtd: nand: make more readable panic_nand_wait_ready()
 and nand_wait_ready()
Message-ID: <20140120191908.GK8919@ld-irv-0074>
References: <19226555.341201389136795005.JavaMail.weblogic@epml09>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19226555.341201389136795005.JavaMail.weblogic@epml09>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 07, 2014 at 11:19:56PM +0000, Eunbong Song wrote:
> 
> panic_nand_wait_ready() and nand_wait_ready() calls dev_ready() without checking if it exists.

There are many occasions where we call a function pointer without
(locally) checking that it is non-NULL. That is by design.

If you see a problem with this behavior, please fix this properly rather
than covering it up. This patch will just make faulty drivers spin for
20ms rather than hitting a bug. Instead, you should aim to fix buggy
drivers that call dev_ready() without assigning it; or even better,
defensively improve nand_base to detect those drivers which are
utilizing nand_command_lp() or nand_command() without assigning
dev_ready().

> This patch add check routine dev_ready() before run dev_ready()
> and this makes the code more readable

This patch does not make the code more readable, nor does it improve the
state of the original code much. Please solve and document a real
problem.

Thanks,
Brian
