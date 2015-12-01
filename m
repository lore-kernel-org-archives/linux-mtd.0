Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3qSW-0004wk-P6
 for linux-mtd@lists.infradead.org; Tue, 01 Dec 2015 19:19:29 +0000
Received: by pacej9 with SMTP id ej9so14064702pac.2
 for <linux-mtd@lists.infradead.org>; Tue, 01 Dec 2015 11:19:07 -0800 (PST)
Date: Tue, 1 Dec 2015 11:19:05 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Scott Branden <sbranden@broadcom.com>
Cc: linux-mtd@lists.infradead.org, Julia Lawall <julia.lawall@lip6.fr>,
 bcm-kernel-feedback-list@broadcom.com, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH] mtd: brcmnand: drop brcmnand_host::of_node field
Message-ID: <20151201191905.GZ64635@google.com>
References: <1448935287-144366-1-git-send-email-computersforpeace@gmail.com>
 <565DD627.5010400@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <565DD627.5010400@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 01, 2015 at 09:17:27AM -0800, Scott Branden wrote:
> Looks good.
> 
> On 15-11-30 06:01 PM, Brian Norris wrote:
> >We don't actually need to stash a copy of this device_node indefinitely;
> >we only need it in brcmnand_init_cs().
> >
> >Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> >Cc: <bcm-kernel-feedback-list@broadcom.com>
> >Cc: Kamal Dasu <kdasu.kdev@gmail.com>
> Acked-by: Scott Branden <sbranden@broadcom.com>

Applied
