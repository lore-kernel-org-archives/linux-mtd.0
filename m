Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1doV-0007mi-7D
 for linux-mtd@lists.infradead.org; Mon, 30 Jun 2014 15:48:16 +0000
Message-ID: <1404143270.6841.2.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] ubi: fix correct rb_tree node comparison in add_vol
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Reply-To: artem.bityutskiy@linux.intel.com
To: Heiko Schocher <hs@denx.de>
Date: Mon, 30 Jun 2014 18:47:50 +0300
In-Reply-To: <1403594718-20595-1-git-send-email-hs@denx.de>
References: <1403594718-20595-1-git-send-email-hs@denx.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Mike Snitzer <snitzer@redhat.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-06-24 at 09:25 +0200, Heiko Schocher wrote:
> Commit 604b592e6fd3c98f21435e1181ba7723ffc24715 ("UBI: fix rb_tree node comparison in add_map")
> 
> introduced problems with attaching ubi fastmap images,
> created with older kernel.

Changed the commit message to be a bit more reader-friendly and pushed
to linux-ubifs.git, thank you!

-- 
Best Regards,
Artem Bityutskiy
