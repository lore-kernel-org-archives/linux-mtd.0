Subject: Re: [PATCH v4] mach-realview: expose PB1176 ROM using physmap and
	map_rom
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Linus Walleij <linus.walleij@stericsson.com>
Date: Sun, 11 Sep 2011 16:29:38 +0300
In-Reply-To: <1315292023-4125-1-git-send-email-linus.walleij@stericsson.com>
References: <1315292023-4125-1-git-send-email-linus.walleij@stericsson.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1315747783.18731.59.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-09-06 at 08:53 +0200, Linus Walleij wrote:
> From: Linus Walleij <linus.walleij@linaro.org>
> 
> This exposes the PB1176 ROM if you compile in the MTD physmap
> mapping and also the map_rom chiptype.
> 
> Signed-off-by: Linus Walleij <linus.walleij@stericsson.com>

I think this should go in via the corresponding arm subtree.

-- 
Best Regards,
Artem Bityutskiy
