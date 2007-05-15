Subject: Re: ECC on 2048 byte page size 8-bit NAND on Samsung S3C2440
From: David Woodhouse <dwmw2@infradead.org>
To: Harald Welte <laforge@openmoko.org>
In-Reply-To: <20070515003039.GB32448@prithivi.gnumonks.org>
References: <20070515003039.GB32448@prithivi.gnumonks.org>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 May 2007 15:04:13 +0800
Message-Id: <1179212653.2859.102.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Ben Dooks <ben@trinity.fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-05-15 at 08:30 +0800, Harald Welte wrote:
> Hi!
> 
> On openmoko's future mobile communications devices, we're using 2048
> byte page sized NAND chips (x8 organization such as K9F8G08U0A).
> of 
> However, it seems to me that the ECC support for 2048byte page sized
> NAND chips is not really implemented yet, neither by the NAND core, nor
> by the S3C2440 NAND driver.

The NAND core shouldn't be a problem -- in development of both the
CS553x and CAFÉ drivers for OLPC, we've used software ECC to start with,
then later switched over to hardware ECC support.

> As far as I understand it (I haven't worked with 2k page before), the
> 2440 NAND controller can generate a 4-byte ECC for each 2048byte page (8
> bytes in case of x16 organization, this seems somehow strange).
> 
> In addition to ECC on the actual main data area, it also supports ECC on
> the OOB data, too.  I haven't found any piece of code in any other NAND
> driver in the kernel that uses this feature.

Right. We haven't used ECC in the spare area. JFFS2 doesn't really need
it, although I _suppose_ we could use it for the cleanmarker. 

Maybe there's something to be said for using it on the BBT too.

> Also, I don't see something like a standard ECC layout for the 2048byte
> page deivces.  Is there one?

Basically, no.

> I can certainly spend my time hacking up some working code.  The
> quesetion is if there is already some thought by one of the people
> involved for some longer time with linux-mtd and/or the s3c2440.

Well, since I just got my Neo1973 working I need to make a ppc->arm
cross-toolchain anyway. I suppose I could try it with one of the 512MiB
or 1GiB chips I have lying around.

Probably better just to see what Ben comes up with :)

-- 
dwmw2
