Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15doJx-0006v7-00
	for <linux-mtd@lists.infradead.org>; Mon, 03 Sep 2001 08:39:01 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <71B37AB6576DD211AB7E008048CD4D319FA655@exchange.ten.logware.de> 
References: <71B37AB6576DD211AB7E008048CD4D319FA655@exchange.ten.logware.de> 
To: Veikko Werner <veikko.werner@logware.de>
Cc: "'linux-mtd@lists.infradead.org '" <linux-mtd@lists.infradead.org>
Subject: Re: AW: DOC2000 Boot de-ja-vue - add... 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 03 Sep 2001 08:44:54 +0100
Message-ID: <5030.999503094@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

veikko.werner@logware.de said:
>  okay now I know there's a problem. But I've no idea how to solve it.
> I attach a listing of my root-fs. maybe one can see an error.

Your /lib directory seems to be entirely populated by broken symlinks. Copy 
some of the actual libraries in there too and it should be a lot happier :)

--
dwmw2
