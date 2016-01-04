Received: from mail-pf0-x22c.google.com ([2607:f8b0:400e:c00::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGEge-00006k-Pj
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2016 23:37:17 +0000
Received: by mail-pf0-x22c.google.com with SMTP id q63so173532326pfb.0
 for <linux-mtd@lists.infradead.org>; Mon, 04 Jan 2016 15:36:56 -0800 (PST)
Date: Mon, 4 Jan 2016 15:36:53 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: John Crispin <blogic@openwrt.org>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 5/6] MTD: lantiq: xway: fix nand locking
Message-ID: <20160104233653.GD128501@google.com>
References: <1451941501-42952-1-git-send-email-blogic@openwrt.org>
 <1451941501-42952-6-git-send-email-blogic@openwrt.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1451941501-42952-6-git-send-email-blogic@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 04, 2016 at 10:05:00PM +0100, John Crispin wrote:
> use a global lock in the cs function.
> 
> Signed-off-by: John Crispin <blogic@openwrt.org>

Again, patch description? Why would you need this change?
