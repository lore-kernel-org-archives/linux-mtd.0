Subject: Re: [PATCH] Add support for SST 39VF6402B flash - block & sector
	support ?
From: David Woodhouse <dwmw2@infradead.org>
To: Florian Fainelli <florian.fainelli@int-evry.fr>
In-Reply-To: <200705171337.49203.florian.fainelli@int-evry.fr>
References: <200705161047.57549.florian.fainelli@int-evry.fr>
	<loom.20070517T093705-724@post.gmane.org>
	<200705171337.49203.florian.fainelli@int-evry.fr>
Content-Type: text/plain
Date: Thu, 17 May 2007 21:04:59 +0800
Message-Id: <1179407100.2859.490.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MikeW <mw_phil@yahoo.co.uk>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-05-17 at 13:37 +0200, Florian Fainelli wrote:
> Yes this would be better. I will try to come up with a patch to the MTD 
> subsystem that can handle this properly.

You should be able to handle it within the chip driver -- where you can
use 64KiB erase commands, do so -- else use 4KiB erase commands.

-- 
dwmw2
