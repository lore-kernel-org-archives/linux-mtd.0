Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlBh4-0005L0-Pg
 for linux-mtd@lists.infradead.org; Fri, 16 May 2014 06:32:35 +0000
Received: by mail-pa0-f52.google.com with SMTP id fa1so2151707pad.11
 for <linux-mtd@lists.infradead.org>; Thu, 15 May 2014 23:32:13 -0700 (PDT)
Date: Thu, 15 May 2014 23:32:09 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: hujianyang <hujianyang@huawei.com>
Subject: Re: Who is in charge of JFFS2 and YAFFS2?
Message-ID: <20140516063209.GE2413@norris-Latitude-E6410>
References: <53718EC8.2050100@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53718EC8.2050100@huawei.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ David

On Tue, May 13, 2014 at 11:17:28AM +0800, hujianyang wrote:
> We have some BUGs of JFFS2 and YAFFS2 in our products. Could
> I know who is in charge of these two flash-based filesystems
> in this maillist?
> 
> Yaffs2 is not in mainline, does it have a separate maillist?
> how can I get the newest version of it?

YAFFS2 is not mainline and is not handled here. Try your favorite search
engine.

> If I send some patches about Jffs2 to this maillist, who is
> responsible for reviewing and upstreaming them?

scripts/get_maintainers.pl will point you to this list and to David. But
David does not review much here any more. Depending on their
obviousness, I can probably take patches. But JFFS2 development is not
very active, so this may not be easy.

Brian
