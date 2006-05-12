From: David Woodhouse <dwmw2@infradead.org>
To: David Vrabel <dvrabel@arcom.com>
In-Reply-To: <44635DD6.10805@arcom.com>
References: <c384c5ea0605110820m606a04e7nc87cbc9302fd619c@mail.gmail.com>
	<44635DD6.10805@arcom.com>
Content-Type: text/plain
Date: Fri, 12 May 2006 01:28:18 +0100
Message-Id: <1147393699.12030.37.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Leon Woestenberg <leon.woestenberg@gmail.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Do not oops when configured flash size is less then
	chip size
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2006-05-11 at 16:52 +0100, David Vrabel wrote:
> This sounds like a valid, if unlikely, board configuration.  e.g., a
> board with chips fitted that are larger than the chip-select memory
> window.

An alternative plan is to (warn and) artificially reduce mtd->size so
that it fits in the map. That way, you at least get to use the region of
the flash that you can address.

-- 
dwmw2
