Received: from mail-pd0-x235.google.com ([2607:f8b0:400e:c02::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgrW9-0005ls-8i
 for linux-mtd@lists.infradead.org; Wed, 22 Oct 2014 08:43:42 +0000
Received: by mail-pd0-f181.google.com with SMTP id w10so3099912pde.40
 for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2014 01:43:20 -0700 (PDT)
Date: Wed, 22 Oct 2014 01:43:12 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] mtd: bcm47xxpart: alloc memory for more partitions
Message-ID: <20141022084258.GJ16128@brian-ubuntu>
References: <1412243326-6742-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1412243326-6742-1-git-send-email-zajec5@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 02, 2014 at 11:48:46AM +0200, Rafał Miłecki wrote:
> This is needed for some new Netgear devices (e.g. R6250).
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>

Pushed to l2-mtd.git.

Brian
