Received: from mclean.mail.mindspring.net ([207.69.200.57])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A0WRG-0001wx-24
	for <linux-mtd@lists.infradead.org>; Sat, 20 Sep 2003 02:21:30 +0100
From: "Chuck Meade" <chuckmeade@mindspring.com>
To: "Chuck Meade" <chuckmeade@mindspring.com>,
	"David Woodhouse" <dwmw2@infradead.org>
Date: Fri, 19 Sep 2003 21:20:48 -0400
Message-ID: <IIEEICKJLNEPBBDJICNGEEDJDPAA.chuckmeade@mindspring.com>
MIME-Version: 1.0
In-Reply-To: <IIEEICKJLNEPBBDJICNGEEDIDPAA.chuckmeade@mindspring.com>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: RE: DOC filesystem questions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > On Thu, 2003-08-07 at 17:56, Chuck Meade wrote:
> > > David Woodhouse wrote:
> > > 
> > > > We _must_ retain the bad block table which was on the device when it
> > > > arrived from the factory. 
> > > 
> > > OK I see.  Would it be valuable then to have a Linux command-line
> > > utility which captures the BBT before calling nftl_format, then 
> > > is used to restore the BBT after calling nftl_format but before
> > > nftl tries to mount any partitions (via 'insmod nftl' or whatever)?
> > 
> > ... or which writes it back as _part_ of the nftl_format process,
> > perhaps?
> > 
> > Yes, it would be extremely useful to do this.
> 
> I have been working on the utilities to do this.  It is working on my
> DOC Millennium device that is soldered to the target board.  I now
> have a requirement to do the same with a DIMM DOC device.
> The device has the following markings:
>   MD-2220-D16-V3
>   DiskOnChip B-1.21
>   DIMM  (serial number follows)
> 
> This device is identified as a DOC 2000 at bootup, while my other one is
> identified as a DOC Millennium.
> 
> I am starting out saving and restoring the bad block table from the command
> line using dd.  Since the bad block table is to be saved before the 
> nftl_format, and restored afterwards, I thought it would be handy to do
> it with a shell script that uses dd.
> 
> This approach is working on the DOC Millennium device.  It is not working,
> however, on my DOC 2000 device.  I get:
> 
> Read of bad sector table failed (err -5)
> 
> when I boot after restoring the bad block table via dd.
> The -5 is an EIO being returned because it is unhappy with the ECC
> that is read out.  I modified doc2000.c to print out the ECC codes that
> are being written in doc_write_ecc, and read in doc_read_ecc.  They
> do not match at all.
> 
> Is there a known problem with ECC reading/writing with DOC 2000
> devices, or a subset of DOC 2000 devices?

Looks like this is a case of "I just didn't look at it long enough".
The dd operation (of course) just plants a new ECC in the OOB area, 
which already has the ECC from the nftl_format operation.  So you 
get a bogus ECC combination that is a bitwise and of the 2 ECCs.
Any zero bit in either ECC is zero in the ECC in the OOB area 
after doing the dd.  Of course, since it is writing flash.

So what I will do is read out the media headers, replacing the bad
block table in my local copy, then erase the sector it is in and
write back the whole sector, with the media header and the (now
valid) bad block table.

Chuck
