Date: Fri, 8 Dec 2017 11:57:22 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 kernel@pengutronix.de, Han Xu <han.xu@nxp.com>
Subject: Re: [PATCH 02/10] mtd: nand: gpmi: Utilize hardware to detect
 bitflips in erased blocks
Message-ID: <20171208105722.hkqurrj2cwpetfe4@pengutronix.de>
References: <20171206091925.5810-1-s.hauer@pengutronix.de>
 <20171206091925.5810-3-s.hauer@pengutronix.de>
 <20171206102713.47d2fdbe@bbrezillon>
 <20171206152804.u62dopc6mwwdz457@pengutronix.de>
 <20171206163431.5fddd6c6@bbrezillon>
 <20171208102157.vwmy3jmaoiiy6255@pengutronix.de>
 <20171208113550.3cfdf4e5@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171208113550.3cfdf4e5@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 08, 2017 at 11:35:50AM +0100, Boris Brezillon wrote:
> On Fri, 8 Dec 2017 11:21:57 +0100
> Sascha Hauer <s.hauer@pengutronix.de> wrote:
> 
> > On Wed, Dec 06, 2017 at 04:34:31PM +0100, Boris Brezillon wrote:
> > > On Wed, 6 Dec 2017 16:28:04 +0100
> > > Sascha Hauer <s.hauer@pengutronix.de> wrote:
> > >   
> > > > On Wed, Dec 06, 2017 at 10:27:13AM +0100, Boris Brezillon wrote:  
> > > > > Hi Sascha,
> > > > > 
> > > > > On Wed,  6 Dec 2017 10:19:17 +0100
> > > > > Sascha Hauer <s.hauer@pengutronix.de> wrote:
> > > > >     
> > > > > > The GPMI nand has a hardware feature to ignore bitflips in erased pages.
> > > > > > Use this feature rather than the longish code we have now.
> > > > > > Unfortunately the bitflips in erased pages are not corrected, so we have
> > > > > > to memset the read data before passing it to the upper layers.    
> > > > > 
> > > > > There's a good reason we didn't use the HW bitflip detection in the
> > > > > first place: we currently have no way to report the number of corrected
> > > > > bitflips in an erased page, and that's a big problem, because then UBI
> > > > > does not know when it should re-erase the block.    
> > > > 
> > > > Ah, ok.
> > > >   
> > > > > 
> > > > > Maybe we missed something when the initial proposal was done and
> > > > > there's actually a way to retrieve this information, but if that's not
> > > > > the case, I'd prefer to keep the existing implementation even if it's
> > > > > slower and more verbose.    
> > > > 
> > > > I'm not so much concerned about the verbosity of the code but rather
> > > > about the magic it has inside. I have stared at this code for some time
> > > > now and still only vaguely know what it does.
> > > > 
> > > > We could do a bit better: We can still detect the number of bitflips
> > > > using nand_check_erased_ecc_chunk() without reading the oob data.
> > > > That would not be 100% accurate since we do not take the oob data into
> > > > account which might have bitflips aswell, but still should be good
> > > > enough, no?  
> > > 
> > > Nope, we really have to take OOB bytes into account when counting
> > > bitflips. Say that you have almost all in-band data set to 0xff, but
> > > all OOB bytes reserved for ECC are set to 0 because someone decided to
> > > write this portion of the page in raw mode. In this case we can't
> > > consider the page as empty, otherwise we'll fail to correctly write ECC
> > > bytes next time we program the page.  
> > 
> > I would probably be with you if at least the current code worked correctly,
> > but unfortunately it doesn't.
> > 
> > I did a test with the attached program. What it does is that it writes
> > pages nearly full of 0xff in raw mode. In the first page the first byte
> > is exchanged with a bitflip, in the second page the second byte is
> > exchanged with a bitflip, and so on. What I would expect that the number
> > of corrected bits is the same for all bitflip positions. What I get
> > instead is this:
> > 
> > ./a.out /dev/mtd4 0x0f
> > byteno: 0x00000000 corrected: 5 failed: 0
> > byteno: 0x00000001 corrected: 4 failed: 0
> > byteno: 0x00000002 corrected: 5 failed: 0
> > byteno: 0x00000003 corrected: 6 failed: 0
> > byteno: 0x00000004 corrected: 5 failed: 0
> > byteno: 0x00000005 corrected: 5 failed: 0
> > byteno: 0x00000006 corrected: 4 failed: 0
> > byteno: 0x00000007 corrected: 5 failed: 0
> > byteno: 0x00000008 corrected: 5 failed: 0
> > byteno: 0x00000009 corrected: 4 failed: 0
> > ...
> > 
> > (Read this as: byteno <x> in page has 0x0f instead of 0xff, so number
> > of corrected bits should be 4, instead we have 5)
> > 
> > or:
> > ./a.out /dev/mtd4 0xfe
> > byteno: 0x00000000 corrected: 1 failed: 0
> > byteno: 0x00000001 corrected: 1 failed: 0
> > byteno: 0x00000002 corrected: 1 failed: 0
> > byteno: 0x00000003 corrected: 1 failed: 0
> > byteno: 0x00000004 corrected: 1 failed: 0
> > byteno: 0x00000005 corrected: 1 failed: 0
> > byteno: 0x00000006 corrected: 1 failed: 0
> > byteno: 0x00000007 corrected: 1 failed: 0
> > byteno: 0x00000008 corrected: 1 failed: 0
> > byteno: 0x00000009 corrected: 1 failed: 0
> > byteno: 0x0000000a corrected: 1 failed: 0
> > byteno: 0x0000000b corrected: 1 failed: 0
> > byteno: 0x0000000c corrected: 1 failed: 0
> > byteno: 0x0000000d corrected: 1 failed: 0
> > byteno: 0x0000000e corrected: 2 failed: 0
> > byteno: 0x0000000f corrected: 1 failed: 0
> > byteno: 0x00000010 corrected: 1 failed: 0
> > byteno: 0x00000011 corrected: 1 failed: 0
> > byteno: 0x00000012 corrected: 2 failed: 0
> > byteno: 0x00000013 corrected: 1 failed: 0
> > 
> > When I add a print_hex_dump to the driver I really see a buffer
> > with 5 bytes flipped instead of 4. When I do a raw read of the
> > page (under barebox, the Linux driver doesn't print the OOB data
> > properly), then I really see what I have written: A page with four
> > bitflips. The results are perfectly reproducable, so I don't expect
> > that to be any random read failures.
> 
> Wow, that's really weird.
> 
> > 
> > I know next to nothing about BCH, but could it be that the BCH engine
> > already starts correcting the page while it still doesn't know that
> > it can't be corrected at all leaving spurious cleared bits in the
> > read data?
> 
> Bitflips are not supposed to be fixed by the BCH engine if an
> uncorrectable error is detected. BCH is operating on a block of data
> (usually 512 or 1024 bytes), and before starting to fix actual errors,
> it searches their positions, and their positions is only determined
> after the correctable/uncorrectable check has been done, so really, I
> doubt BCH can mess up you data.
> 
> Did you find out where the extra bitflip is? Is it next to the other
> bitflips or in a totally different region?

It's reproducably the same place, but at arbitrary positions:

See below for a one chunk. The '0xf0' is the bitflip I introduced, no idea
where the '0xbf' and '0xf7' come from:

[   44.223908] data: 00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   44.231436] data: 00000010: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   44.238414] data: 00000020: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   44.246150] data: 00000030: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   44.253560] data: 00000040: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   44.261099] data: 00000050: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   44.268076] data: 00000060: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   44.275795] data: 00000070: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   44.283177] data: 00000080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   44.290635] data: 00000090: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   44.297610] data: 000000a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   44.305274] data: 000000b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   44.312670] data: 000000c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   44.319648] data: 000000d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   44.327403] data: 000000e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   44.334850] data: 000000f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   44.342221] data: 00000100: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   44.349197] data: 00000110: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   44.356878] data: 00000120: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   44.364258] data: 00000130: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   44.371704] data: 00000140: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   44.378678] data: 00000150: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   44.386335] data: 00000160: ff ff ff ff ff ff ff bf ff ff ff ff ff ff ff ff
[   44.393767] data: 00000170: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   44.401211] data: 00000180: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   44.408187] data: 00000190: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff f7
[   44.415890] data: 000001a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   44.423286] data: 000001b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   44.430716] data: 000001c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   44.437693] data: 000001d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   44.445382] data: 000001e0: ff ff ff ff ff ff ff ff ff ff ff f0 ff ff ff ff
[   44.452814] data: 000001f0: ff ff ff ff ff ff ff ff ff ff ff ff f7 ff ff ff
[   44.459792] ecc: 00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
