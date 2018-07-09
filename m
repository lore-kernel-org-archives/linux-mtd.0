Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fcZ4b-0000xW-2B
 for linux-mtd@lists.infradead.org; Mon, 09 Jul 2018 16:31:43 +0000
Date: Mon, 9 Jul 2018 18:31:24 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Subject: Re: [PATCH v6 0/6] mtd: rawnand: support MT29F1G08ABAFAWP-ITE:F
Message-ID: <20180709183124.22f39f1b@bbrezillon>
In-Reply-To: <c27f10f9efc14fed817c1a343d8b67d4@SIWEX5A.sing.micron.com>
References: <c27f10f9efc14fed817c1a343d8b67d4@SIWEX5A.sing.micron.com>
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

Hi Bean,

On Mon, 9 Jul 2018 15:54:11 +0000
"Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:

> Hi, Boris and Chris
> 
> >>
> >> I see 2 solutions to this problem:
> >> 1/ Bean provides us a solution to reliably detect when ECC can be
> >>    de-actived and when it can't
> >> 2/ We only ever expose 64 bytes of OOB to the user and consider that
> >>    ECC can be disabled, even if it can't in reality
> >>  
> >
> >After reading the doc again, I forgot one thing you can try before deciding to
> >go for option #2.
> >
> >8th bit in byte 5 of READID's result encodes whether the on-die ECC state
> >(enabled or not). I remember we had a discussion with Bean where he told us
> >this was a runtime status reflecting the on-die ECC state, which is crazy, since
> >READID might return different values depending on the NAND state, and most
> >of the code in the core assumes READID provides a fixed ID that encodes the
> >chip characteristics/capabilities, not its state.
> >
> >Anyway, if this bit is actually reflecting the on-die ECC state and on-die
> >cannot be disabled on your chip, it should stay at 1 even after you have sent
> >the SET_FEATURES(DISABLE_ECC) command. Let's hope this works as I expect,
> >otherwise we're back to option #2 until Bean suggest something else.  
> 
> MT29F1G08ABAFAWP-ITE:F is Micron 70s SLC NAND with on-die ECC.
> If the bit7 in the byte 5 of READID default is 1(ECC Enabled), it is true on-die ECC
> Cannot be disabled by SET Feature command.
> In case sending Set Feature command, you can check previous command is success or not by
> Get Feature

Chris tried that already and it didn't work. GET_FEATURES(ECC) returns a
value with the bit cleared (meaning that ECC is supposedly disabled)
after SET_FEATURES(ECC, DISABLE) has been sent. Are you sure that
GET_FEATURES(ECC) is supposed to return the actual state of the ECC
engine and not the last value you wrote in the internal reg (would be
the case if this reg is just a dummy reg when on-die ECC is forcibly
enabled).

> or check this bit7 in byte 5 of READID later.

This, we'll have to test.

> 
> To check if this device supports on-die ECC or not, you can use inter ECC level (bit 0 and bit1 in byte 5 of READID)  
> http://lists.infradead.org/pipermail/linux-mtd/2017-April/073370.html

Okay, I think we already had this discussion, but I'm asking it again.
What are the possible values for that field and what do they mean?
Also, is it even used to encode the fact that the NAND has on-die ECC
on all your NANDs? We already had the problem of incompatible ID
schemes, so I wouldn't be surprised if that was the case here, hence my
initial suggestion to base the detection on the model name.

Bean, can you check that on a few different NAND parts before giving a
definitive answer, because, at least for the SET_FEATURES(ECC), we
don't see what you describe, and that's not the first time you suggest
things that do not work in real life.

Regards,

Boris
