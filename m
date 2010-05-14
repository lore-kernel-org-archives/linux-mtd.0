Subject: Re: [PATCH v5 5/9] [MTD] remove bogus warning about missing boot
	bank  location
From: David Woodhouse <dwmw2@infradead.org>
To: Guillaume LECERF <glecerf@gmail.com>
In-Reply-To: <AANLkTik9nUPxig-XFRnVn8O3B45ofHraUMe6xPkPGMYW@mail.gmail.com>
References: <20100424155751.14723.46761.stgit@shiryu.yomgui.biz>
	<20100424155812.14723.66554.stgit@shiryu.yomgui.biz>
	<1273796379.9999.509.camel@macbook.infradead.org>
	<4BECEAE9.2030008@free.fr>
	<1273823642.9999.1528.camel@macbook.infradead.org>
	<AANLkTik9nUPxig-XFRnVn8O3B45ofHraUMe6xPkPGMYW@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 14 May 2010 09:15:32 +0100
Message-ID: <1273824932.9999.1578.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Wolfram Sang <w.sang@pengutronix.de>,
	linux-mtd <linux-mtd@lists.infradead.org>, Chris Moore <moore@free.fr>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-05-14 at 10:09 +0200, Guillaume LECERF wrote:
> I think bootloc and map->name need to be swapped to match the printk
> pattern order (%s first then %d). 

Doh. Fixed; thanks. 

-- 
dwmw2
