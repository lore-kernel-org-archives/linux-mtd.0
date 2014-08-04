Received: from mail-pd0-x235.google.com ([2607:f8b0:400e:c02::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XEPnq-0001iU-SF
 for linux-mtd@lists.infradead.org; Mon, 04 Aug 2014 21:28:26 +0000
Received: by mail-pd0-f181.google.com with SMTP id g10so35147pdj.26
 for <linux-mtd@lists.infradead.org>; Mon, 04 Aug 2014 14:28:00 -0700 (PDT)
Date: Mon, 4 Aug 2014 14:27:57 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Samarth Parikh <samarthp@ymail.com>
Subject: Re: [PATCH] Drivers: MTD: Fixed checkpatch seq_printf warnings
Message-ID: <20140804212757.GF3711@ld-irv-0074>
References: <1405519230-48409-1-git-send-email-samarthp@ymail.com>
 <1405968570.83800.YahooMailNeo@web192501.mail.sg3.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1405968570.83800.YahooMailNeo@web192501.mail.sg3.yahoo.com>
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 22, 2014 at 02:49:30AM +0800, Samarth Parikh wrote:
> Fixed checkpatch warnings: "WARNING: Prefer seq_puts to seq_printf"
> 
> 
> 
> 
> This patch is created with reference to the ongoing lkml thread
> https://lkml.org/lkml/2014/7/15/646
> where Andrew Morton wrote:
> 
> "
> - puts is presumably faster
> 
> - puts doesn't go rogue if you accidentally pass it a "%".
> 
> - this patch would actually make compiled object files few bytes smaller.
>   Perhaps because seq_printf() is a varargs function, forcing the
>   caller to pass args on the stack instead of in registers.
> "
> 
> Signed-off-by: Samarth Parikh <samarthp@ymail.com>

Queued to l2-mtd.git/next.

Brian
