From: David Woodhouse <dwmw2@infradead.org>
To: Dave Dillow <ddillow@idleaire.com>
In-Reply-To: <1067376879.9396.1.camel@dillow.idleaire.com>
References: <3F9EA810.6010905@celerity.net>
	 <1067376879.9396.1.camel@dillow.idleaire.com>
Content-Type: text/plain
Message-Id: <1067427718.15551.1582.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 29 Oct 2003 11:41:59 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: INFTL problems
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-10-28 at 16:34 -0500, Dave Dillow wrote:
> Try this -- it's my current hack to get my 128MB recoginzed. When I get
> time, I plan to work on nand/diskonchip.c, per dwmw2's suggestion.

That looks sane enough for me to apply it, if it still actually works on
the 2000 and Millennium parts. Zachi, what's the correct name for these
parts? Is it 'DiskOnChip 2000 TSOP'?

-- 
dwmw2
