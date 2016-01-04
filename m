Received: from mail-pf0-x229.google.com ([2607:f8b0:400e:c00::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGEhV-0000H2-D5
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2016 23:38:09 +0000
Received: by mail-pf0-x229.google.com with SMTP id 78so211619371pfw.2
 for <linux-mtd@lists.infradead.org>; Mon, 04 Jan 2016 15:37:49 -0800 (PST)
Date: Mon, 4 Jan 2016 15:37:46 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: John Crispin <blogic@openwrt.org>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 6/6] MTD: lantiq: xway: allow request line masking
Message-ID: <20160104233746.GE128501@google.com>
References: <1451941501-42952-1-git-send-email-blogic@openwrt.org>
 <1451941501-42952-7-git-send-email-blogic@openwrt.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1451941501-42952-7-git-send-email-blogic@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 04, 2016 at 10:05:01PM +0100, John Crispin wrote:
> There are several request lines. Allow masking the unused ones via OF.
> 
> Signed-off-by: John Crispin <blogic@openwrt.org>

There's no DT binding doc in the first place, so it's hard to add
properties. Please add a binding doc, then document your additions
properly.

Thanks,
Brian
