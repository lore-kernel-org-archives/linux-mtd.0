Subject: Re: pxa2xx-flash again, please?
From: David Woodhouse <dwmw2@infradead.org>
To: Lennert Buytenhek <buytenh@wantstofly.org>
In-Reply-To: <20060609001606.GC26509@xi.wantstofly.org>
References: <Pine.LNX.4.63.0606080916491.1760@pcgl.dsa-ac.de>
	<20060608073632.GA12338@wohnheim.fh-wedel.de>
	<Pine.LNX.4.63.0606080955050.1760@pcgl.dsa-ac.de>
	<20060608115208.GA4155@wohnheim.fh-wedel.de>
	<Pine.LNX.4.63.0606081356100.1760@pcgl.dsa-ac.de>
	<44887D8C.2040806@gmail.com> <20060609001606.GC26509@xi.wantstofly.org>
Content-Type: text/plain
Date: Fri, 09 Jun 2006 01:18:36 +0100
Message-Id: <1149812317.18635.53.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: tpoynor@infradead.org, Todd Poynor <toddpoynor@gmail.com>,
	linux-mtd@lists.infradead.org,
	=?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-06-09 at 02:16 +0200, Lennert Buytenhek wrote:
> I'd also like to see the unified pxa2xx flash mapping driver go in, so
> that it can be used by the LogicPD PXA270 board support code (merged
> in 2.6.17) too, instead of making Yet Another copy of
> mainstone-flash.c.

Can't we use platform_devices and physmap for all of it?

-- 
dwmw2
