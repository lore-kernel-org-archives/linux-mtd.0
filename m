Received: from mail-out.m-online.net ([212.18.0.10])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W4cZQ-00021Z-Le
 for linux-mtd@lists.infradead.org; Sat, 18 Jan 2014 20:32:46 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: m25p80: assign default read command
Date: Sat, 18 Jan 2014 19:54:40 +0100
References: <1389906547-31959-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1389906547-31959-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201401181954.40539.marex@denx.de>
Cc: Sourav Poddar <sourav.poddar@ti.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday, January 16, 2014 at 10:09:07 PM, Brian Norris wrote:
> In the following commit (in -next):
> 
>     commit 8552b439aba7f32063755d23f79ca27b4d0a3115
>     drivers: mtd: m25p80: convert "bool" read check into an enum
> 
> We converted the boolean 'fast_read' property to become an enum
> 'flash_read', but at the same time, we changed the conditional path so
> that it doesn't choose a default value in some cases (technically, we
> choose the correct default simply by virtue of devm_kzalloc(), which
> zeroes this out to be a NORMAL read operation, but still...).

Yep, that's true. It did default to the correct _NORMAL.

> Fix this by setting a default for the 'else' clause.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Sourav Poddar <sourav.poddar@ti.com>

Let's be explicit indeed.

Acked-by: Marek Vasut <marex@denx.de>

Best regards,
Marek Vasut
