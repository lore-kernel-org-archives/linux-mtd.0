Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19D9f7-0001Gq-TW
	for <linux-mtd@lists.infradead.org>; Tue, 06 May 2003 22:07:46 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: manningc2@actrix.gen.nz
In-Reply-To: <20030506205634.D88B04585@blood.actrix.co.nz>
References: <D3AF5F134D627243993F2F2FC32EE4D229C730@mailman.eason.com>
	 <20030506205634.D88B04585@blood.actrix.co.nz>
Message-Id: <1052255277.7532.63.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Tue, 06 May 2003 22:07:57 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: Alex Pavloff <apavloff@eason.com>
cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: CompactFlash...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-05-06 at 21:58, Charles Manning wrote:
> The docs are inconsistent. Personally I am not really bothered by the lack of 
> wear levelling on some NAND systems. If a block dies, it is replaced by a 
> reserved one.  The SmartMedia block management scheme results in a 
> "statistical wear levelling". ie. Explicite wear levelling is not performed, 
> but the net result is some degree of wear levelling. My understanding is that 
> full-size (PCMCIA) ATA cards support explicite wear levelling, but CF does 
> not.

You have 50 blocks each with 1M erases. You have 48 blocks worth of
permanent code and data to store, one block of dynamic configuration and
data. You have only 'accidental' wear levelling, using two blocks alone
while leaving the 48 containing code entirely untouched. You have killed
your device after 2M erases, when the first two blocks go bad, while the
other 48 are entirely untouched. 

If you do explicit wear levelling you get 50M erases, not just 2M.

Of course that's a little contrived, we're assuming a block dies _on_
the 1 millionth erase and that there are no other bad blocks as you
might expect on NAND. But it does highlight why for some purposes
explicit wear levelling is desirable.

-- 
dwmw2
