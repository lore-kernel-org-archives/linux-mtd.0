Subject: Re: [PATCH] NAND hardware ECC controller on at91sam9263 / at91sam9260
From: David Woodhouse <dwmw2@infradead.org>
To: Richard Genoud <richard.genoud@gmail.com>
In-Reply-To: <80b317760804230237n188bd989oc28a5ed60e615d88@mail.gmail.com>
References: <47BABA0C.8070500@gmail.com>
	<1208889653.9212.641.camel@pmac.infradead.org>
	<80b317760804230237n188bd989oc28a5ed60e615d88@mail.gmail.com>
Content-Type: text/plain
Date: Wed, 23 Apr 2008 11:22:17 +0100
Message-Id: <1208946137.9212.778.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Brownell <david-b@pacbell.net>, linux-mtd@lists.infradead.org,
	Haavard Skinnemoen <hskinnemoen@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-04-23 at 11:37 +0200, Richard Genoud wrote:
> I don't know what kernel you use, but I'm getting no error with this
> patch on kernel 2.6.25-rc2 (and on 2.6.25 it's also ok) that I've
> downloaded from kernel.org:

Hm, that's true. There seem to have been changes since 2.6.25 which
cause the conflicts. Please could you make it apply to the current git
tree?

Thanks.

-- 
dwmw2
