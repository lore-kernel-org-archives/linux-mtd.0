Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJeMh-0006JC-E5
 for linux-mtd@lists.infradead.org; Mon, 05 Nov 2018 12:52:25 +0000
Date: Mon, 5 Nov 2018 13:52:11 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: "ikegami@allied-telesis.co.jp" <ikegami@allied-telesis.co.jp>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "hauke@hauke-m.de" <hauke@hauke-m.de>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>, "chris.packham@alliedtelesis.co.nz"
 <chris.packham@alliedtelesis.co.nz>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "koen.vandeputte@ncentric.com"
 <koen.vandeputte@ncentric.com>, "fbettoni@gmail.com" <fbettoni@gmail.com>
Subject: Re: [PATCH v3 01/11] mtd: cfi_cmdset_0002: Change
 do_write_oneword() to use chip_good()
Message-ID: <20181105135211.78da0a3f@bbrezillon>
In-Reply-To: <403739a3578a37c517626091535fa4574bee0171.camel@infinera.com>
References: <20181025163219.25788-1-ikegami@allied-telesis.co.jp>
 <20181025163219.25788-2-ikegami@allied-telesis.co.jp>
 <20181105111544.4e511ed9@bbrezillon>
 <403739a3578a37c517626091535fa4574bee0171.camel@infinera.com>
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

On Mon, 5 Nov 2018 12:03:04 +0000
Joakim Tjernlund <Joakim.Tjernlund@infinera.com> wrote:

> On Mon, 2018-11-05 at 11:15 +0100, Boris Brezillon wrote:
> > CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
> > 
> > 
> > On Fri, 26 Oct 2018 01:32:09 +0900
> > Tokunori Ikegami <ikegami@allied-telesis.co.jp> wrote:
> >   
> > > In OpenWrt Project the flash write error caused on some products.  
> > 
> > It's okay to mention that the issue was discovered by the OpenWRT team,
> > but I'd rephrase it differently.
> > 
> > "As reported by the OpenWRT team, write requests sometimes fail on some
> > platforms".
> >   
> > > Also the issue can be fixed by using chip_good() instead of chip_ready().
> > > The chip_ready() just checks the value from flash memory twice.
> > > And the chip_good() checks the value with the expected value.
> > > Probably the issue can be fixed as checked correctly by the chip_good().
> > > So change to use chip_good() instead of chip_ready().  
> > 
> > Well, that's not really explaining why you think chip_good() should be
> > used instead of chip_ready(). So I went on and looked at the
> > chip_good(), chip_ready() and do_write_oneword() implementation, and
> > also looked at users of do_write_oneword(). It seems this function is
> > used to write data to the flash, and apparently the "one bit should
> > toggle to reflect a busy state" does not apply when writing things to
> > the memory array (it's probably working for other CFI commands, but I
> > guess it takes more time to actually change the level of a NOR cell,
> > hence the result of 2 identical reads does not mean that the write is
> > done).
> > 
> > Also, it seems that cmdset_0001 is not implementing chip_ready() the
> > same way, and I wonder if cmdset_0002 implementation is correct to
> > start with. Or maybe I don't get what chip_ready() is for.
> >   
> The 0001 cmd set is quite different to 0002 and 0001 is the superior one.
> If you look at recent 0002 cmd sets they offer an alternative cmd
> set to replace the all the "toggle" ones with something that is
> same/similar to what 0001 offers.

Okay. Do you know when chip_ready() (the one that checks if something
changes between 2 reads) should be used and when it shouldn't?
