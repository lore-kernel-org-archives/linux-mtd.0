Received: from mail-pb0-x235.google.com ([2607:f8b0:400e:c01::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHOnH-0000x0-VM
 for linux-mtd@lists.infradead.org; Sun, 23 Feb 2014 02:27:52 +0000
Received: by mail-pb0-f53.google.com with SMTP id ma3so2405618pbc.40
 for <linux-mtd@lists.infradead.org>; Sat, 22 Feb 2014 18:27:30 -0800 (PST)
Date: Sat, 22 Feb 2014 18:27:28 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [patch] mtd: remove some duplicative checks
Message-ID: <20140223022728.GE11836@norris-Latitude-E6410>
References: <20140213112144.GD15549@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140213112144.GD15549@elgon.mountain>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 13, 2014 at 02:21:44PM +0300, Dan Carpenter wrote:
> "rc" is an error code here, no need to check it a second time.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Pushed to l2-mtd.git. Thanks!

Brian
