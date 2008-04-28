Subject: Re: [PATCH] physmap: do not probe absent modules
From: David Woodhouse <dwmw2@infradead.org>
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <20080424.223830.27953792.anemo@mba.ocn.ne.jp>
References: <20080424.223830.27953792.anemo@mba.ocn.ne.jp>
Content-Type: text/plain
Date: Mon, 28 Apr 2008 09:26:02 +0100
Message-Id: <1209371162.25560.109.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2008-04-24 at 22:38 +0900, Atsushi Nemoto wrote:
> For example, if MTD_CFI was not enabled, probing it does nothing other
> than just produces an error message.

Eww. We should _never_ have stuff in the static kernel depending on
CONFIG_xxx_MODULE. What if you build the module later?

I wouldn't be entirely averse to making some of these config options
boolean, though.

-- 
dwmw2
