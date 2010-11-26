Subject: Re: [PATCH 2/4] mtd: FSMC NAND replace all use of uintNN_t with uN
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Linus Walleij <linus.walleij@stericsson.com>
In-Reply-To: <1290201121-15263-1-git-send-email-linus.walleij@stericsson.com>
References: <1290201121-15263-1-git-send-email-linus.walleij@stericsson.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 26 Nov 2010 18:24:55 +0200
Message-ID: <1290788695.2552.35.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
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

On Fri, 2010-11-19 at 22:12 +0100, Linus Walleij wrote:
> The short kernel versions of the basic types makes the world more
> readable.
> 
> Signed-off-by: Linus Walleij <linus.walleij@stericsson.com>

I do not think dwmw2 will merge this one because he often claimed that
u32 cannot be better than uint32_t, because the latter is C99 standard,
but the former is not. So I'd not do this, at least not at the area he
looks after.

:-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
