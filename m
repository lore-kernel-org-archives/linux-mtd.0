Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eQYr6-00030E-Fv
 for linux-mtd@lists.infradead.org; Sun, 17 Dec 2017 13:19:51 +0000
Date: Sun, 17 Dec 2017 14:19:16 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
Cc: Miquel RAYNAL <miquel.raynal@free-electrons.com>,
 ezequiel.garcia@free-electrons.com, linux-mtd@lists.infradead.org, "Kasper
 Revsbech (KREV)" <krev@triax.com>
Subject: Re: [BUG] pxa3xx: wait time out when scanning for bb
Message-ID: <20171217141916.04e377ab@bbrezillon>
In-Reply-To: <7892957c-273b-ea58-1d50-b35e70c69e02@prevas.dk>
References: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
 <20171211150200.51c7f3b4@xps13> <20171211150929.722a361a@xps13>
 <a5fc7dea-a043-370c-b18a-eeb8f1f067f4@prevas.dk>
 <20171212095119.475de032@xps13>
 <727489cf-d1f6-8777-c6f4-981127657c9d@prevas.dk>
 <20171212111227.4946cc15@xps13>
 <e9e6bf70-918f-b750-5893-55744dc34882@prevas.dk>
 <20171212120806.7c31463f@xps13>
 <a0267c71-4333-7dd4-dcf4-14aced37f8f9@prevas.dk>
 <20171212123523.48185f21@xps13>
 <75bd6b87-12ed-4003-262a-b1bd03a62cbd@prevas.dk>
 <20171212134706.49f3c57e@xps13>
 <2f16ce90-6e00-c95f-7a81-5603d9acf574@prevas.dk>
 <20171212143512.3b62d3f5@xps13>
 <48EEEC1C-954B-42E5-92BE-A00AD97A5789@prevas.dk>
 <20171212192327.57b1fa80@xps13>
 <9f578b28-ef3b-8e84-0a8c-b70c494efff0@prevas.dk>
 <20171213094105.73646658@xps13> <20171215182512.2449af9e@xps13>
 <45D7D798-BA86-41CD-AB56-156C1BD7FCC4@prevas.dk>
 <20171215201955.2431195c@xps13>
 <7892957c-273b-ea58-1d50-b35e70c69e02@prevas.dk>
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

Hi Sean,

On Sun, 17 Dec 2017 12:56:01 +0100
Sean Nyekjaer <sean.nyekjaer@prevas.dk> wrote:

> Hi Miquel
> >>> I am very sorry for the delay but it took me some time to figure a
> >>> way to reproduce your situation until I started doing the exact
> >>> sequence I asked you to follow. It turns out there was a nasty error
> >>> in the parser so you could not observe the last blocks of your chip
> >>> because I messed up with high addresses.  
> >> Fantastic always nice to be able to reproduce the issue. Glad to be
> >> able to help :-)
> >>  
> >>> I updated the Github branch [1], can you rebase on top of it? I think
> >>> this time we should get something :)  
> >> I just did a quick boot with the new commits, and the kernel is able
> >> to find the bbt table :-)  
> > Good ! :-)
> >
> > So with nand-ecc-mode = "none" + on-flash-bbt, there is no more issue,
> > right?  
> No more issue with reading the bbt :-)
> >  
> >> I also tried booting with ECC enabled and with that enabled the
> >> driver is unable to read the bbt and marked all blocks bad.  
> > And if I understand correctly, if you remove nand-ecc-mode = "none" (or
> > set it to "hw"), the kernel fails to find the BBT, that is right?  
> Yes.
> >
> > As I was not expecting such a quick answer, I did push another patch
> > after sending my email that fixes an issue in mtdcore.c, please check
> > you have it (there are a few "fixup!" patches, and on top of them you
> > must find one which is a well-formatted patch about
> > mtd_check_oob_ops()).  
> I have rebased on top of 9aee88a618f8 mtd: Fix mtd_check_oob_ops()
> >
> > I learned that today: to get a prompt while all blocks are bad, you can
> > add:
> >
> >      chip->options |= NAND_SKIP_BBTSCAN;
> >
> > Before nand_scan_tail().
> >
> > If you can reach a prompt with the failing configuration and when you
> > will have the time, I will welcome a dump of the same area as before
> > so we will try to understand what is wrong now ! :)  
> Nice one, a lot easier to read whats happens
> 
> nanddump of BBT without ECC enabled:
> https://gist.github.com/anonymous/627e5be058ed93c106d61641f6aa5da0
> 
> nanddump of BBT with ECC enabled:
> https://gist.github.com/anonymous/76b3240f156c6547cf76d59f2aae49fe
> bootsnippet with ECC and NAND_SKIP_BBTSCAN enabled.
> https://gist.github.com/anonymous/0d9be95cd9c36ff006f7aa03e7c2cc85
> 
> Please let me know what traces you need to fix the ECC :-)

The dumps look good (at least, the BBT pattern is correct, we have the
number of ECC bytes we expect and they are where we expect them).

My gut feeling is that something is wrong with ECC (or something related
to ECC) in u-boot.

Can you try to let Linux create the BBT on its own and dump the last
block as you did previously?

So, to sum-up

1/ put the following in your DT

	nand-ecc-mode = "hw";
	nand-on-flash-bbt;

2/ scrub the NAND from u-boot and make sure you don't reboot after that,
   so that u-boot can't recreate its own BBT.

3/ Let Linux boot and dump the pages (in raw mode) where BBTs created by
Linux are supposed to be (should be the same addresses as before)

If we end up with different ECC bytes than what u-boot produces then
there's a mismatch somewhere.

Regards,

Boris
