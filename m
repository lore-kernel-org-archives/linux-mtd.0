Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fdXPu-0004o7-Qt
 for linux-mtd@lists.infradead.org; Thu, 12 Jul 2018 08:57:40 +0000
Date: Thu, 12 Jul 2018 10:57:15 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Cc: Richard Weinberger <richard@nod.at>, Miquel Raynal
 <miquel.raynal@bootlin.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Chris Packham
 <chris.packham@alliedtelesis.co.nz>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>
Subject: Re: [EXT] Re:  [PATCH 2/2] mtd: rawnand: micron: Fix on-die ECC
 detection logic
Message-ID: <20180712105715.3574016d@bbrezillon>
In-Reply-To: <81218b8d34df4881af81bb36fa55bf44@SIWEX5A.sing.micron.com>
References: <1be1ede4dcf14f24b68b8497b167c1b3@SIWEX5A.sing.micron.com>
 <20180711123209.5271d411@bbrezillon>
 <81218b8d34df4881af81bb36fa55bf44@SIWEX5A.sing.micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 12 Jul 2018 08:40:33 +0000
"Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:

> Hi, Boris
> It is true. Bit7 of byte4 in READID changes after enable/disable internal ECC in case of  its default value is 0. 
> Also this bit value  is volatile. After power cyling, it resets to default value.

That's actually a good thing that ECC status get resets on PoR. I'd
wish that would be the case when issuing a SW reset (RESET command),
but unfortunately it's not.

> I don't know if
> this condition will be changed or kept since maybe it was a specific design request from customers.
> But GET Feature is still the preferred way to determine the state of ECC, we recommend using this way. 
> If internal ECC is default on, we don't do anything, and if default is off, then SET feature and GET feature.
> This always makes sense.

No, it doesn't work. When Linux acquires control on the NAND, we don't
know what was done before (maybe u-boot enabled ECC and didn't disable
it), so checking READID[4].bit7 only does not work. We need to first
disable the ECC through the SET_FEATURES(DIS_ECC) and then check the
READID bytes.

Also, using GET_FEATURES() does not work either, because Micron NANDs
with "forced on-die ECC" do not expose the ECC status in the 0x90
(Array Operation Mode) feature reg. So if we do that we report ECC as
always disabled which means "not supported"

> 
> I am still digging into why this doesn't depict in datasheet and whether this will be kept in coming design.
> As long I have new update, I will back to you.

Arrrggg! Please don't change that in future designs. We seem to have
something that works to detect whether on-die ECC is supported and if
it can be disabled.
