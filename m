Received: from mail-pd0-x230.google.com ([2607:f8b0:400e:c02::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X2Usu-0003iX-Qd
 for linux-mtd@lists.infradead.org; Thu, 03 Jul 2014 00:28:21 +0000
Received: by mail-pd0-f176.google.com with SMTP id ft15so12760751pdb.7
 for <linux-mtd@lists.infradead.org>; Wed, 02 Jul 2014 17:27:59 -0700 (PDT)
Date: Wed, 2 Jul 2014 17:27:56 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Kevin Hao <haokexin@gmail.com>
Subject: Re: [PATCH 1/2] mtd/ftl: drop the useless VirtualPageMap in
 partition_t
Message-ID: <20140703002756.GR3599@ld-irv-0074>
References: <1402905157-10330-1-git-send-email-haokexin@gmail.com>
 <1402905157-10330-2-git-send-email-haokexin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1402905157-10330-2-git-send-email-haokexin@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 16, 2014 at 03:52:36PM +0800, Kevin Hao wrote:
> This is not used by any code now. Just drop it.
> 
> Signed-off-by: Kevin Hao <haokexin@gmail.com>

Pushed this one to l2-mtd.git. Thanks!

Brian
