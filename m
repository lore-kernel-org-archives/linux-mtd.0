Received: from nz-out-0506.google.com ([64.233.162.233])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H9yRn-0007k2-5i
	for linux-mtd@lists.infradead.org; Thu, 25 Jan 2007 01:51:03 -0500
Received: by nz-out-0506.google.com with SMTP id i11so623897nzi
	for <linux-mtd@lists.infradead.org>;
	Wed, 24 Jan 2007 22:50:57 -0800 (PST)
Received: from pooky.senux.com (localhost.localdomain [127.0.0.1])
	by pooky.senux.com (8.13.7/8.13.7) with ESMTP id l0P6or7B006611
	(version=TLSv1/SSLv3 cipher=DHE-DSS-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Thu, 25 Jan 2007 15:50:53 +0900
Received: (from senux@localhost)
	by pooky.senux.com (8.13.7/8.13.7/Submit) id l0P6orGF006610
	for linux-mtd@lists.infradead.org; Thu, 25 Jan 2007 15:50:53 +0900
Resent-Message-ID: <20070125065053.GB5712@pooky.senux.com>
Date: Thu, 25 Jan 2007 15:49:37 +0900
From: Seongsu Lee <senux@senux.com>
To: linux-mtd@lists.infradead.org
Subject: Re: What is ANAND header?
Message-ID: <20070125064937.GA5712@pooky.senux.com>
References: <20070124054731.GA31267@pooky.senux.com>
	<BFECAF9E178F144FAEF2BF4CE739C66803EAB0BB@exmail1.se.axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BFECAF9E178F144FAEF2BF4CE739C66803EAB0BB@exmail1.se.axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 24, 2007 at 01:14:55PM +0100, Ricard Wanderlöf wrote:
> > How can I mount 'conventional filesystem' such as FAT, EXT{2,3}
> > on NAND flash memory instead of mouting on mtdblock because of
> > its poor functionality. (no wear-leveling)
> >
> > What I want to do in a final is to mount FAT filesystem on bare
> > NAND flash memories without performance degradation.
> 
> Use UBI, then mount the filesystem on an UBI volume? (Check the mtd list archives or web pages for more info on UBI)

Thank you for the reply.

Then, is there any technical reason that translation layer
for bare NAND flash memory is *not* exist?
(NFTL is not for base flash memory but for DiskOnChip)

(I prefer to use translation layer in MTD because UBI is still
 experimental and is not included stable kernel tree.)

If something wrong, let me know. Thank you in advance.

-- 
Seongsu's blog - http://www.senux.com/
The human race never solves any of its problems. It
merely outlives them. -- David Gerrold
