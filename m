Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOyvq-0005hf-0o
 for linux-mtd@lists.infradead.org; Fri, 29 Jan 2016 02:37:07 +0000
Received: by mail-pf0-x242.google.com with SMTP id x125so3014471pfb.0
 for <linux-mtd@lists.infradead.org>; Thu, 28 Jan 2016 18:36:45 -0800 (PST)
Date: Thu, 28 Jan 2016 18:36:42 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-kernel@vger.kernel.org, Bayi Cheng <bayi.cheng@mediatek.com>,
 Marek Vasut <marex@denx.de>, djkurtz@chromium.org
Subject: Re: [RFC PATCH 7/8] mtd: spi-nor: add TB (Top/Bottom) protect support
Message-ID: <20160129023642.GC19540@google.com>
References: <1453960307-10181-1-git-send-email-computersforpeace@gmail.com>
 <1453960307-10181-8-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1453960307-10181-8-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 27, 2016 at 09:51:46PM -0800, Brian Norris wrote:
> This one hasn't been exhaustively tested yet, so I labeled it 'RFC'. I hope to
> have some sort of test scripts (possibly targeting mtd-utils) ready, to help
> make sure the locking APIs behave as expected. (And "as expected" is a little
> ill-defined, IMO.)

I've written up some ugly (but effective) tests locally and found a few
edge case problems with this patch, so I'm going to refactor both this
patch and patch 2. Stay tuned.

Brian
