Subject: Re: NAND behind INT13 BIOS interface
From: David Woodhouse <dwmw2@infradead.org>
To: Indrek Kruusa <indrek.kruusa@artecdesign.ee>
In-Reply-To: <44BDFCAE.80807@artecdesign.ee>
References: <44BDFCAE.80807@artecdesign.ee>
Content-Type: text/plain
Date: Wed, 19 Jul 2006 11:09:45 -0400
Message-Id: <1153321785.29664.3.camel@shinybook.infradead.org>
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

On Wed, 2006-07-19 at 12:34 +0300, Indrek Kruusa wrote:
> I have board with NAND and BIOS seems to have built-in driver for that. 
> BIOS provides INT 13 interface for the NAND too.
> 
> Is there a solution to access such NAND (with the help of INT 13) as a 
> usual block device from Linux?

There used to be such a hack -- it's quite evil and fragile though. You
have to switch back into real mode to invoke the BIOS call, and you need
to preserve enough of the pre-boot environment that it can still work.
Running it in vm86 mode might also work, if you're lucky.

Seriously though, I wouldn't bother -- just implement a translation
layer in Linux which is compatible.

-- 
dwmw2
