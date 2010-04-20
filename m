Subject: Re: Can PYSMAP_COMPAT go?
From: David Woodhouse <dwmw2@infradead.org>
To: Lennert Buytenhek <buytenh@wantstofly.org>
In-Reply-To: <20100420073503.GL4586@mail.wantstofly.org>
References: <20100420063547.GH19957@pengutronix.de>
	<20100420073503.GL4586@mail.wantstofly.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 20 Apr 2010 09:05:33 +0100
Message-ID: <1271750733.14748.1580.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Wolfram Sang <w.sang@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-04-20 at 09:35 +0200, Lennert Buytenhek wrote:
> COMPAT needs to die.  There are at least two other ways of specifying
> the same info (device tree or manual instantiation of a platform device
> from your platform code), and we really shouldn't allow specifying this
> in the .config as that will just give people other crazy ideas. 

If we take it away, they'll get crazier ideas. I've seen a fully-fledged
driver for a new board, including a bizarrely hacked-up copy of all the
CFI code and a special char device interface of its own, which could
have been supported by a simple PHYSMAP setup.

And this was i386, which unfortunately doesn't use the device-tree yet,
although on these embedded SoC devices it really _should_ be doing so.
And it doesn't have 'platform code' either.

If you explicitly configure your kernel to tell it that there is a flash
device at a certain address, then it's reasonable for the kernel to look
there for it. Aunt Tillie can go screw herself.

-- 
dwmw2
