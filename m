Received: from h24-66-20-25.wp.shawcable.net ([24.66.20.25] helo=iders01.iders.ca)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18M8mb-0000Az-00
	for <linux-mtd@lists.infradead.org>; Wed, 11 Dec 2002 15:28:22 +0000
From: "Christian Gan" <cgan@iders.ca>
To: <linux-mtd@lists.infradead.org>, "yaffs list" <yaffs@toby-churchill.org>
Subject: RE: NAND and concat
Date: Wed, 11 Dec 2002 09:58:57 -0600
Message-ID: <NFBBLPGPLKFIKCCPLALEAEPKCEAA.cgan@iders.ca>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20021211000255.6A0C2149A7@dragon.actrix.co.nz>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Sorry Charles, I think the title should have been "NAND and mtdconcat". :)

> -----Original Message-----
> From: linux-mtd-admin@lists.infradead.org
> [mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of Charles Manning
> Sent: Tuesday, December 10, 2002 5:58 PM
> To: Christian Gan; linux-mtd@lists.infradead.org; yaffs list
> Subject: Re: NAND and concat
> 
> 
> I'm not sure I understand what you mean by concat for NAND. Do 
> you mean being 
> able to read/write directly to the char device?
> 
> Certainly handling OOB and pages makes things a bit different. 
> Someone wrote 
> a nand dumper which maybe does what you want (or can be persuaded 
> :-). The 
> yaffs format tool uses the char interface. It needs to expand to 
> load up a 
> mkyaffsimage image into flash.
> 
> -- CHarles
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
