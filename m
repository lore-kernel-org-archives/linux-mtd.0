Received: from nz-out-0506.google.com ([64.233.162.227])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H9ayc-0005rY-Uf
	for linux-mtd@lists.infradead.org; Wed, 24 Jan 2007 00:47:22 -0500
Received: by nz-out-0506.google.com with SMTP id i11so136553nzi
	for <linux-mtd@lists.infradead.org>;
	Tue, 23 Jan 2007 21:46:58 -0800 (PST)
Date: Wed, 24 Jan 2007 14:47:31 +0900
From: Seongsu Lee <senux@senux.com>
To: linux-mtd@lists.infradead.org
Subject: Re: What is ANAND header?
Message-ID: <20070124054731.GA31267@pooky.senux.com>
References: <20070113063629.GA13015@pooky.senux.com>
	<1168794421.2941.70.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1168794421.2941.70.camel@localhost.localdomain>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jan 14, 2007 at 06:07:00PM +0100, Thomas Gleixner wrote:
> On Sat, 2007-01-13 at 15:36 +0900, Seongsu Lee wrote:
> > I want to use NFTL to mount the flash memory by FAT filesystem.
> > 
> > But NFTL does not work for me. I found that MTD failed to
> > find boot record in nftlmount.c source.
> 
> NFTL is only for M-Systems DiskOnChip devices. It can not be used on
> bare NAND chips.

Ok, I see.

Then, is there any sub module, like NFTL, that serves as
translation layer on NAND flash memory?

How can I mount 'conventional filesystem' such as FAT, EXT{2,3}
on NAND flash memory instead of mouting on mtdblock because of
its poor functionality. (no wear-leveling)

What I want to do in a final is to mount FAT filesystem on bare
NAND flash memories without performance degradation.

Thank you very much in advance.

-- 
Seongsu's blog - http://www.senux.com/
LILO, you've got me on my knees! (from David Black,
dblack@pilot.njin.net, with apologies to Derek and the
Dominos, and Werner Almsberger)
