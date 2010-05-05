Subject: Re: [PATCH] sst25l.c: remove unnecessary MTD_DEBUG_LEVEL2 messages
From: Artem Bityutskiy <dedekind@infradead.org>
To: H Hartley Sweeten <hartleys@visionengravers.com>
In-Reply-To: <0D753D10438DA54287A00B0270842697636E825604@AUSP01VMBX24.collaborationhost.net>
References: <0D753D10438DA54287A00B0270842697636E825604@AUSP01VMBX24.collaborationhost.net>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 05 May 2010 08:51:17 +0300
Message-ID: <1273038677.3702.55.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	"ryan@bluewatersys.com" <ryan@bluewatersys.com>,
	"andre@bluewatersys.com" <andre@bluewatersys.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Linux Kernel <linux-kernel@vger.kernel.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-04-29 at 17:52 -0500, H Hartley Sweeten wrote:
> All the SST25L series flash parts have uniform erase sectors.  Remove
> the extra MTD_DEBUG_LEVEL2 messages showing the eraseregions info
> since they could never be shown.
> 
> Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Andre Renaud <andre@bluewatersys.com>
> Cc: Ryan Mallon <ryan@bluewatersys.com>

Pushed to l2-mtd-2.6 / master

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
