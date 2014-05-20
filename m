Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmtUx-0000ia-QM
 for linux-mtd@lists.infradead.org; Tue, 20 May 2014 23:31:08 +0000
Received: by mail-pa0-f42.google.com with SMTP id rd3so782271pab.29
 for <linux-mtd@lists.infradead.org>; Tue, 20 May 2014 16:30:46 -0700 (PDT)
Date: Tue, 20 May 2014 16:30:43 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Helmut Schaa <helmut.schaa@googlemail.com>
Subject: Re: [PATCH] UBI: block: Fix error path on alloc_workqueue failure
Message-ID: <20140520233043.GY28907@ld-irv-0074>
References: <1400577228-7835-1-git-send-email-helmut.schaa@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1400577228-7835-1-git-send-email-helmut.schaa@googlemail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 20, 2014 at 11:13:48AM +0200, Helmut Schaa wrote:
> Otherwise we'd return a random value if allocation of the workqueue fails.
> 
> Signed-off-by: Helmut Schaa <helmut.schaa@googlemail.com>
> ---
> Just stumbled over that one while playing with UBI block devices.

Acked-by: Brian Norris <computersforpeace@gmail.com>
