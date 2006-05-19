Received: from webapps.arcom.com ([194.200.159.168])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fh1Lc-0005Dk-JL
	for linux-mtd@lists.infradead.org; Fri, 19 May 2006 05:32:47 -0400
Message-ID: <446D90B5.2090802@arcom.com>
Date: Fri, 19 May 2006 10:32:37 +0100
From: David Vrabel <dvrabel@arcom.com>
MIME-Version: 1.0
To: Jonathan McDowell <noodles@earth.li>
References: <20060518160940.GS7570@earth.li>	<20060518165728.GA26113@wohnheim.fh-wedel.de>
	<20060519090142.GB7570@earth.li>
In-Reply-To: <20060519090142.GB7570@earth.li>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Add Amstrad Delta NAND support.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jonathan McDowell wrote:
> On Thu, May 18, 2006 at 06:57:28PM +0200, Jörn Engel wrote:
>> On Thu, 18 May 2006 17:09:41 +0100, Jonathan McDowell wrote:
>>> +	omap_writew(0, (OMAP_MPUIO_BASE + OMAP_MPUIO_IO_CNTL));
>>                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> Could that be done in a macro?
> 
> Is there any benefit to doing so?
> 
>>> +	udelay(0.04);
>> Floating point in the kernel?
> 
> Not quite. udelay is a macro on ARM so this ends up as an integer before
> it ever hits a function call. In an ideal world I'd use "ndelay(40);"
> but that would result in a delay of over 1µs as ARM doesn't have ndelay
> defined so we hit the generic fallback.

Use instead:

/* delay for at least 40 ns */
udelay(1);

Or better yet provide an ndelay implementation for ARM.

David Vrabel
-- 
David Vrabel, Design Engineer

Arcom, Clifton Road           Tel: +44 (0)1223 411200 ext. 3233
Cambridge CB1 7EA, UK         Web: http://www.arcom.com/
