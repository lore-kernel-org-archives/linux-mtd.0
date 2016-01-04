Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGEjX-0000jE-F0
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2016 23:40:15 +0000
Received: by mail-pa0-x22f.google.com with SMTP id do7so3850798pab.2
 for <linux-mtd@lists.infradead.org>; Mon, 04 Jan 2016 15:39:55 -0800 (PST)
Date: Mon, 4 Jan 2016 15:39:52 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: John Crispin <blogic@openwrt.org>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 3/6] MTD: lantiq: xway: remove endless loop
Message-ID: <20160104233952.GF128501@google.com>
References: <1451941501-42952-1-git-send-email-blogic@openwrt.org>
 <1451941501-42952-4-git-send-email-blogic@openwrt.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1451941501-42952-4-git-send-email-blogic@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 04, 2016 at 10:04:58PM +0100, John Crispin wrote:
> The reset loop logic could run into a endless loop. Lets fix it as
> requested.
> 
> http://lists.infradead.org/pipermail/linux-mtd/2012-September/044240.html

Ah, 3 to 4 years late on the follow up; nice :) Better late than never,
I guess...
