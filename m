Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YckWg-0002HV-7B
 for linux-mtd@lists.infradead.org; Tue, 31 Mar 2015 00:59:30 +0000
Received: by pactp5 with SMTP id tp5so2681774pac.1
 for <linux-mtd@lists.infradead.org>; Mon, 30 Mar 2015 17:59:09 -0700 (PDT)
Date: Mon, 30 Mar 2015 17:59:05 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] mtd: maps: sa1100-flash: remove incorrect __exit markups
Message-ID: <20150331005905.GK32500@ld-irv-0074>
References: <20150309181041.GA25179@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150309181041.GA25179@dtor-ws>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 09, 2015 at 11:10:41AM -0700, Dmitry Torokhov wrote:
> Even if bus is not hot-pluggable, the devices can be unbound from the
> driver via sysfs, so we should not be using __exit annotations on
> remove() methods. The only exception is drivers registered with
> platform_driver_probe() which specifically disables sysfs bind/unbind
> attributes.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Pushed to l2-mtd.git.

Brian
