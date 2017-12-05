Date: Tue, 5 Dec 2017 14:00:24 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>, kernel@pengutronix.de
Subject: Re: [PATCH] UBI: Do not use outdated fastmaps to attach
Message-ID: <20171205130024.434j5iyp4lvodbrx@pengutronix.de>
References: <20171205100525.6253-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171205100525.6253-1-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 05, 2017 at 11:05:25AM +0100, Sascha Hauer wrote:
> When a fastmap gets updated, then it can happen that no free
> PEB for a new fastmap anchor is available. In this case we reuse
> the current fastmap anchor PEB. We are only allowed to do that
> though when we made sure that no outdated fastmap PEBs are in
> the erase worker queue. Otherwise an outdated fastmap anchor may
> be used to attach the device when an unclean reboot happens right
> after we have erased the current fastmap anchor.
> 
> This patch synchronously erases all pending erase work which belongs
> to outdated fastmap anchors. This way we make sure that when the
> current fastmap anchor PEB gets erased, no older fastmap anchors
> are on the device.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Richard and I agreed that we play safe and instead want to erase the
outdated fastmaps synchronously during attach, so please ignore this
one.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
