Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJabs-0002cL-0h
 for linux-mtd@lists.infradead.org; Fri, 06 Feb 2015 04:33:40 +0000
Received: by mail-pa0-f45.google.com with SMTP id et14so14656657pad.4
 for <linux-mtd@lists.infradead.org>; Thu, 05 Feb 2015 20:33:19 -0800 (PST)
Date: Thu, 5 Feb 2015 20:33:15 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Niklas Cassel <niklas.cassel@axis.com>
Subject: Re: [PATCH] mtd: update ops->oobretlen in concat_write_oob
Message-ID: <20150206043315.GL18140@ld-irv-0074>
References: <1421746532-25547-1-git-send-email-niklass@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1421746532-25547-1-git-send-email-niklass@axis.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, Niklas Cassel <niklass@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 20, 2015 at 10:35:32AM +0100, Niklas Cassel wrote:
> In concat_read_oob both retlen and oobretlen is updated.
> concat_write_oob previously only updated retlen.
> 
> Signed-off-by: Niklas Cassel <niklass@axis.com>

Pushed to l2-mtd.git. Thanks.

Brian
