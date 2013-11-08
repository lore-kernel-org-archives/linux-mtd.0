Received: from mail-ie0-x235.google.com ([2607:f8b0:4001:c03::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ver3b-0002rJ-Vm
 for linux-mtd@lists.infradead.org; Fri, 08 Nov 2013 18:45:24 +0000
Received: by mail-ie0-f181.google.com with SMTP id ar20so3940699iec.12
 for <linux-mtd@lists.infradead.org>; Fri, 08 Nov 2013 10:45:00 -0800 (PST)
Date: Fri, 8 Nov 2013 10:44:53 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 2/2] mtd: gpmi: only scan two chips for imx6
Message-ID: <20131108184453.GA15480@ld-irv-0074.broadcom.com>
References: <1383817597-31992-1-git-send-email-b32955@freescale.com>
 <1383817597-31992-2-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1383817597-31992-2-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, festevam@gmail.com,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 07, 2013 at 05:46:37PM +0800, Huang Shijie wrote:
> We cannot scan two chips for imx23 and imx28:
>   imx23: the Ready-Busy1 line is not connected for some board.
>   imx28: we do not set the pinctrl for Ready-Busy1
> 
> So we only scan two chips for imx6.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>

Pushed to l2-mtd.git. Thanks!

This is a major bugfix (only for the queued-up code for 3.13), right? Do
we want to include a stronger bug description from Fabio?

Brian
