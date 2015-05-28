Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yy7dW-00072j-Py
 for linux-mtd@lists.infradead.org; Thu, 28 May 2015 23:54:55 +0000
Received: by pacwv17 with SMTP id wv17so34743644pac.2
 for <linux-mtd@lists.infradead.org>; Thu, 28 May 2015 16:54:34 -0700 (PDT)
Date: Thu, 28 May 2015 16:53:57 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: namnguyen@chromium.org
Subject: Re: [PATCH v5] mtd-utils: Add mtdpart to add/delete partition
Message-ID: <20150528235357.GC2878@ld-irv-0074>
References: <1430233932-8380-1-git-send-email-namnguyen@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1430233932-8380-1-git-send-email-namnguyen@chromium.org>
Cc: vapier@chromium.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 28, 2015 at 08:12:12AM -0700, namnguyen@chromium.org wrote:
> From: "Nam T. Nguyen" <namnguyen@chromium.org>
> 
> Add a simple utility to exercise BLKPG ioctl.
> 
> Signed-off-by: Nam T. Nguyen <namnguyen@chromium.org>
> ---
> Changes since v4:
> 
>   * Check part_no parameter for INT_MAX overflow

Pushed to mtd-utils.git. Thanks!
