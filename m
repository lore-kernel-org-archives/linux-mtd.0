Received: from mail-pd0-x235.google.com ([2607:f8b0:400e:c02::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V956t-0003qu-Uq
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2013 03:17:28 +0000
Received: by mail-pd0-f181.google.com with SMTP id g10so4246821pdj.40
 for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2013 20:17:05 -0700 (PDT)
Date: Mon, 12 Aug 2013 20:17:02 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 01/10] mtd: set the cell information for ONFI nand
Message-ID: <20130813031702.GI7267@brian-ubuntu>
References: <1376286173-12581-1-git-send-email-b32955@freescale.com>
 <1376286173-12581-2-git-send-email-b32955@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9F2A6B@DBDE04.ent.ti.com>
 <20130813004938.GD7267@brian-ubuntu> <5209A1F2.80600@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5209A1F2.80600@freescale.com>
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(You used HTML again, so this might not have gotten through the list)

On Tue, Aug 13, 2013 at 11:03:14AM +0800, Huang Shijie wrote:
> 于 2013年08月13日 08:49, Brian Norris 写道:
>      currently), we should modify it so that is a reliable source of
>      *only* 1
>      piece of information -- the number of bits per cell. Currently, it
> do you need to rename the cellinfo to bits_per_cell, or add a new field :
> bits_per_cell?

Well, my whole point was that 'cellinfo' is really not very useful for
us. We just mask it off all the time, and it makes life more
complicated.

So I'd just rename cellinfo to bits_per_cell and change its
assignment/usage appropriately.

But we can also wait a few days, considering that you asked for others'
thoughts, although I doubt many others will speak up (I'd be glad to be
proven wrong). Then you can send v2 at your leisure.

Brian
