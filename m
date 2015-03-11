Date: Wed, 11 Mar 2015 16:50:34 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] mtd: clean up whitespace in linux/mtd/map.h
Message-ID: <20150311235034.GH32500@ld-irv-0074>
References: <2266200.3mx7btcFe5@wuerfel>
 <2220416.D2kDyFWh1C@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2220416.D2kDyFWh1C@wuerfel>
Cc: Jingoo Han <jg1.han@samsung.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 10, 2015 at 05:51:55PM +0100, Arnd Bergmann wrote:
> As the only comments I got for the "mtd: cfi: reduce stack size"
> patch were about whitespace changes, it appears necessary to fix
> up the rest of the file as well, which contains the exact same
> mistakes.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> The two patches can be applied in either order, or this one dropped
> entirely, I don't care as long as the other patch can get merged,
> or get some constructive feedback.

Also applied to l2-mtd.git.

Brian
