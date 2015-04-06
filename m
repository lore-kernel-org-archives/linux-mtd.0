Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YewGM-0004Wv-Af
 for linux-mtd@lists.infradead.org; Mon, 06 Apr 2015 01:55:42 +0000
Received: by patj18 with SMTP id j18so29590550pat.2
 for <linux-mtd@lists.infradead.org>; Sun, 05 Apr 2015 18:55:21 -0700 (PDT)
Date: Sun, 5 Apr 2015 18:55:17 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v2] mtd: Make MTD tests cancelable
Message-ID: <20150406015517.GL2677@norris-Latitude-E6410>
References: <1427658726-27068-1-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1427658726-27068-1-git-send-email-richard@nod.at>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Mar 29, 2015 at 09:52:06PM +0200, Richard Weinberger wrote:
> I always go nuts when I start an MTD test on a slow device
> and have to wait forever until it finishes.

As do I.

As an additional measure, I'm tempted to add an 'ebcnt' parameter for
some of the tests that don't have them, for when I want a quicker test.

> From the debug output I already know what the issue is but I
> have to wait or reset the board hard.
> Resetting is often not an option
> (remote access, you don't want lose the current state, etc...).
> 
> The solution is easy, check for pending signals at key positions
> in the code. Using that one can even stop a test by pressing CTRL-C
> as insmod/modprobe have SIGINT pending.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
> v2: First patch was missing two hunks from my working tree.
>     git commit -a vs. git commit ;-\

Awesome! Pushed to l2-mtd.git. Thanks.

Brian
