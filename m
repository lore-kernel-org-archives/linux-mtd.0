Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzBEu-0006SI-JF
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2015 22:30:09 +0000
Received: by pacdm15 with SMTP id dm15so58141396pac.3
 for <linux-mtd@lists.infradead.org>; Wed, 18 Nov 2015 14:29:48 -0800 (PST)
Date: Wed, 18 Nov 2015 14:29:45 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Clay McClure <clay@daemons.net>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH] mtd: brcmnand: clean up flash cache for parameter pages
Message-ID: <20151118222945.GA64635@google.com>
References: <1447721773-18417-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1447721773-18417-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 16, 2015 at 04:56:13PM -0800, Brian Norris wrote:
> The read_byte() handling for accessing the flash cache has some awkward
> swapping being done in the read_byte() function. Let's just make this a
> byte array, and do the swapping with the word-level macros during the
> initial buffer copy.
> 
> This is just a refactoring patch, with no (intended) functional change.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Clay McClure <clay@daemons.net>
> Cc: Ray Jui <rjui@broadcom.com>
> Cc: Scott Branden <sbranden@broadcom.com>
> Cc: <bcm-kernel-feedback-list@broadcom.com>
> Tested-by: Clay McClure <clay@daemons.net>

Pushed to l2-mtd.git
