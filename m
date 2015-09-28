Date: Sun, 27 Sep 2015 17:21:15 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] mxc_nand: fix copy_spare
Message-ID: <20150928002115.GC34421@google.com>
References: <1443020848-28813-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1443020848-28813-1-git-send-email-eric@eukrea.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 23, 2015 at 05:07:28PM +0200, Eric Bénard wrote:
> it was broken by 35d5d20efad8a04c8c002c7f31241dff973977a6
> "mtd: mxc_nand: cleanup copy_spare function"
> 
[...]
> 
> Signed-off-by: Eric Bénard <eric@eukrea.com>
> Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Added Fixes and -stable tags and pushed to linux-mtd.git. Thanks!

Brian
