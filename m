Received: from mail-ie0-x235.google.com ([2607:f8b0:4001:c03::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VeUW7-0007gN-Ac
 for linux-mtd@lists.infradead.org; Thu, 07 Nov 2013 18:41:19 +0000
Received: by mail-ie0-f181.google.com with SMTP id ar20so1510482iec.12
 for <linux-mtd@lists.infradead.org>; Thu, 07 Nov 2013 10:40:57 -0800 (PST)
Date: Thu, 7 Nov 2013 10:40:53 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] mtd: gpmi: Use devm_kzalloc()
Message-ID: <20131107184053.GW20061@ld-irv-0074.broadcom.com>
References: <1383617225-8504-1-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1383617225-8504-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, b32955@freescale.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 05, 2013 at 12:07:05AM -0200, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
> 
> Using devm_kzalloc() can make the code simpler.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>

Thanks, pushed to l2-mtd.git.

Brian
