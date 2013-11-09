Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vf0qH-0003ru-TU
 for linux-mtd@lists.infradead.org; Sat, 09 Nov 2013 05:12:18 +0000
Received: by mail-pd0-f175.google.com with SMTP id g10so3039898pdj.34
 for <linux-mtd@lists.infradead.org>; Fri, 08 Nov 2013 21:11:51 -0800 (PST)
Date: Sat, 9 Nov 2013 13:10:05 -0500
From: Huang Shijie <shijie8@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/2] mtd: gpmi: fix the NULL pointer
Message-ID: <20131109181004.GA2369@gmail.com>
References: <1383817597-31992-1-git-send-email-b32955@freescale.com>
 <20131108175119.GA20061@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131108175119.GA20061@ld-irv-0074.broadcom.com>
Cc: dedekind1@gmail.com, dwmw2@infradead.org, stable@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 festevam@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 08, 2013 at 09:51:19AM -0800, Brian Norris wrote:
> 
> I agree with Fabio; we don't actually need the +1. (Of course, saving 1
> byte is not that much of a problem. But making the code more
> straightforward is.) If you "ack" I'll just drop the +1 myself.
it is ok to me.

You can drop the +1 yourself.

thanks
Huang Shijie
