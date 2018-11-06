Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJwoD-0004Sy-Be
 for linux-mtd@lists.infradead.org; Tue, 06 Nov 2018 08:34:02 +0000
Date: Tue, 6 Nov 2018 09:33:34 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
Cc: "boris.brezillon@free-electrons.com"
 <boris.brezillon@free-electrons.com>, Felix Fietkau <nbd@openwrt.org>,
 Hauke Mehrtens <hauke@hauke-m.de>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>, Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 PACKHAM Chris <chris.packham@alliedtelesis.co.nz>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Koen
 Vandeputte <koen.vandeputte@ncentric.com>, Fabio Bettoni
 <fbettoni@gmail.com>
Subject: Re: [PATCH v3 01/11] mtd: cfi_cmdset_0002: Change
 do_write_oneword() to use chip_good()
Message-ID: <20181106093334.35864341@bbrezillon>
In-Reply-To: <TYAPR01MB217579A7E16A687FE04B90E5DCCB0@TYAPR01MB2175.jpnprd01.prod.outlook.com>
References: <20181025163219.25788-1-ikegami@allied-telesis.co.jp>
 <20181025163219.25788-2-ikegami@allied-telesis.co.jp>
 <20181105111544.4e511ed9@bbrezillon>
 <TYAPR01MB217579A7E16A687FE04B90E5DCCB0@TYAPR01MB2175.jpnprd01.prod.outlook.com>
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

Hi IKEGAMI,

On Tue, 6 Nov 2018 00:25:43 +0000
IKEGAMI Tokunori <ikegami@allied-telesis.co.jp> wrote:

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
> > Anyway, this is the sort of clarification I'd like to have.  
> 
> I am thinking to update the commit message as below.
> 
>     mtd: cfi_cmdset_0002: Use chip_good() to retry in do_write_oneword()
> 
>     As reported by the OpenWRT team, write requests sometimes fail on some
>     platforms.
>     Currently to check the state chip_ready() is used correctly as described by
>     the flash memory S29GL256P11TFI01 datasheet.

I had a look at the S29GL256P datasheet here [1], and if I'm correct,
it's using cmdset 0001.

>     Also chip_good() is used to check if the write is succeeded and it was
>     implemented by the commit fb4a90bfcd6d8 ("[MTD] CFI-0002 - Improve error
>     checking").
>     But actually the write failure is caused on some platforms and also it can
>     be fixed by using chip_good() to check the state and retry instead.

Do you know on which NOR chips this happens? Do you have access to the
datasheet?

>     It is depended on the actual flash chip behavior so the root cause is
>     unknown.

Yes, and that's what I'd like you to figure out, or at least have a
good idea why this doesn't work on some chips but works on others.

> 
> If any comment please let me know.
> 
> >   
> > >
> > > Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
> > > Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> > > Signed-off-by: Koen Vandeputte <koen.vandeputte@ncentric.com>
> > > Signed-off-by: Fabio Bettoni <fbettoni@gmail.com>  
> > 
> > Has the patch really gone through all those people? SoB is used when you
> > apply a patch in your tree or when you're the original author.  
> 
> I have just checked the OpenWRT git log again and it looks that it was originally
> implemented by Felix Fietkau <nbd@openwrt.org> by the patch below so I will update the Signed-off-by tag as so.
>   <https://git.openwrt.org/?p=openwrt/openwrt.git;a=commitdiff;h=2530640f07cd2b3b14fe9ec03fa63a586452cc5f>
> 
> >   
> > > Co-Developed-by: Hauke Mehrtens <hauke@hauke-m.de>
> > > Co-Developed-by: Koen Vandeputte <koen.vandeputte@ncentric.com>
> > > Co-Developed-by: Fabio Bettoni <fbettoni@gmail.com>  
> > 
> > Not sure we want to add new undocumented tags, but you can mention
> > that all those people helped you find/debug the issue. They can also
> > add their Reviewed-by/Tested-by if they like.

My bad, I just noticed these are valid flags [2], so you can keep them,
and according to the doc, you should also keep the SoB.

Regards,

Boris

[1]http://www.cypress.com/file/219926/download
[2]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v4.20-rc1#n546
