From: David Woodhouse <dwmw2@infradead.org>
To: Joshua Wise <joshua@joshuawise.com>
In-Reply-To: <200310232136.58256.joshua@joshuawise.com>
References: <3F984931.E6409ED7@mvista.com>
	 <200310232136.58256.joshua@joshuawise.com>
Content-Type: text/plain
Message-Id: <1066981171.29915.581.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 24 Oct 2003 08:39:32 +0100
Content-Transfer-Encoding: 7bit
cc: Alice Hennessy <ahennessy@mvista.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: Different nand interface
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-10-23 at 21:36 -0400, Joshua Wise wrote:
> I'm not certain if this is what you're looking for, but the iPAQ h1910 has 
> NAND connected to the address pins. (Is this what you mean?) Take a look at 
> the NAND code in handhelds.org CVS (module linux/kernel26, I think, although 
> if h1910 flash is not an option there, try module linux/kernel) - it's just 
> standard MTD NAND, except with some changes not to do moronic caching of 
> IO_ADDR_R and IO_ADDR_W. (You can also look at the 1910 flash driver to see 
> how I change IO_ADDR_R/W based on ALE and CLE.)

Urgh. I suspect I already fixed the interface between nand.c and the
board drivers so you don't need to do that... if not I'll fix it some
more.


-- 
dwmw2
