Date: Wed, 22 Jan 2014 17:49:06 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris BREZILLON <b.brezillon@overkiz.com>
Subject: Re: [RFC PATCH 1/9] mtd: nand: retrieve ECC requirements from Hynix
 READ ID byte 4
Message-ID: <20140123014906.GY8919@ld-irv-0074>
References: <1389190924-26226-1-git-send-email-b.brezillon@overkiz.com>
 <1389190924-26226-2-git-send-email-b.brezillon@overkiz.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1389190924-26226-2-git-send-email-b.brezillon@overkiz.com>
Cc: devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>,
 linux-doc@vger.kernel.org, dev@linux-sunxi.org, linux-kernel@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ Huang

Hi Boris,

On Wed, Jan 08, 2014 at 03:21:56PM +0100, Boris BREZILLON wrote:
> The Hynix nand flashes store their ECC requirements in byte 4 of its id
> (returned on READ ID command).
> 
> Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>

I haven't verified yet (perhaps Huang can confirm?), but this may be
similar to a patch Huang submitted recently. In his case, we found that
this table is actually quite unreliable and is likely hard to maintain.

Why do you need this ECC information, for my reference?

Brian
