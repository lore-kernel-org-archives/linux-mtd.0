Received: from w228.z208176144.sjc-ca.dsl.cnc.net ([208.176.144.228]
	helo=ns1.pwrseries.com)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EPRvC-0007Ep-VR
	for linux-mtd@lists.infradead.org; Tue, 11 Oct 2005 17:44:45 -0400
From: "Joseph M Dupre (AVAB Inc.)" <dupre@avab.com>
To: linux-mtd@lists.infradead.org
Date: Tue, 11 Oct 2005 14:44:25 -0700
MIME-Version: 1.0
Message-ID: <434BCFC9.20808.127FE1D@localhost>
In-reply-to: <434BFE23.4060701@ieee.org>
References: <434B98B0.776.50BEDB@localhost>
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Cc: Dan Brown <dan_brown@ieee.org>
Subject: Re: docboot: nandwrite:  Input file is not page aligned
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11 Oct 2005 at 14:02, Dan Brown wrote:

> ./mtd_debug info /dev/mtd1
> 
> Could you send me the output from that?  On my DOC device it says
> (among other things):
> 
> mtd.erasesize = 16384 (16K)
> mtd.oobblock = 512
> mtd.oobsize = 16
> 
> If you get the same result, then we're in really weird territory, and
> I'd start to wonder if the mtd tools just don't build (or run)
> properly under uClibc.  Is there any chance you can use a standard
> glibc environment to doublecheck?

I get this output for 'mtd_debug info /dev/mdt1':

mtd.type = MTD_NANDFLASH
mtd.flags = MTD_CLEAR_BITS | MTD_ERASEABLE | MTD_OOB | MTD_ECC
mtd.size = 10567680 (10M)
mtd.erasesize = 16384 (16K)
mtd.oobblock = 512 
mtd.oobsize = 16 
mtd.ecctype = MTD_ECC_SW
regions = 0

Yes I think can set up a clean glibc system on this hardware to test. 
I had a Linux From Scratch system up and running at one time.  If I 
can only find it now...

- Joe
