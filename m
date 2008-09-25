Date: Thu, 25 Sep 2008 16:46:41 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: aleem shariff <aleemshariff2006@gmail.com>
Subject: Re: Linux Support for Intel Flash Strata P30
In-Reply-To: <d5b029d60809232241r1ef4291cy8bb8d4db53318338@mail.gmail.com>
Message-ID: <alpine.LFD.1.10.0809251631230.14888@casper.infradead.org>
References: <d5b029d60809232241r1ef4291cy8bb8d4db53318338@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Panic logs points me that platform fails on attempt to read anything from mapped region.

What to do with this.

1. Check that you call ioremap and that this region is allowed for
mapping in your mxc_flash map driver. 
2. Kick-off special features like caching if any exist from map.
Why not to use physmap instead. 

Thanks,
Alexey


> 
> Hi Alexey, 
> As suggested i am sending the kernel boot up /Panic log for your 
> reference. Please help in this regards.
> Thanks in advance 
> Aleem 
> Hi,
> > 
> 
> > This is with reference to the mail in linux-mtd mailing list with regards to
> > Intel P30 strata flash driver problem. I am also using the same Intel P30
> > strata flash on my board. And I am stuck up in the flash driver for the
> 
> > same. The mapping is happening and later kernel hangs saying Kernel Panic..I
> > am using Linux 2.6.25-rc7 distribution. If anyone has come to solution
> > previously could you please share it with me and help me out.
> 
> >
> 
> 
