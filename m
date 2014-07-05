Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X3Ynd-0007sL-CD
 for linux-mtd@lists.infradead.org; Sat, 05 Jul 2014 22:51:17 +0000
Received: by mail-pa0-f51.google.com with SMTP id hz1so3501694pad.10
 for <linux-mtd@lists.infradead.org>; Sat, 05 Jul 2014 15:50:56 -0700 (PDT)
Date: Sat, 5 Jul 2014 15:50:52 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH] mtd: devices: elm: fix elm_context_save() and
 elm_context_restore() functions
Message-ID: <20140705225052.GC4083@norris-Latitude-E6410>
References: <1403255516-28413-1-git-send-email-ted.juan@gmail.com>
 <1403256725-28983-1-git-send-email-ted.juan@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAF6607@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAF6607@DBDE04.ent.ti.com>
Cc: Ted Juan <ted.juan@gmail.com>, "Liu, Yan" <yan-liu@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 20, 2014 at 09:45:32AM +0000, Pekon Gupta wrote:
> >From: Ted Juan [mailto:ted.juan@gmail.com]
> >
> > These two function's switch case lack the 'break' that make them always return error.
> >
> >Signed-off-by: Ted Juan <ted.juan@gmail.com>
...
> 
> Thanks for fixing this. Apologies, my bad, I didn't test this nicely.
> Also, marking it for stable, as it might break transition to low-power modes
> 
> CC: <stable@vger.kernel.org> # 3.12.x+
> Acked-by: Pekon Gupta <pekon@ti.com>

Pushed to linux-mtd.git, tagged for -stable. I'll try to send this to
Linus during the 3.16 cycle.

Thanks for the fix and the review!

Brian
