Received: from mtaout03-winn.ispmail.ntl.com ([81.103.221.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NXdKs-0003s1-DA
	for linux-mtd@lists.infradead.org; Wed, 20 Jan 2010 16:23:24 +0000
Received: from aamtaout01-winn.ispmail.ntl.com ([81.103.221.35])
	by mtaout03-winn.ispmail.ntl.com
	(InterMail vM.7.08.04.00 201-2186-134-20080326) with ESMTP id
	<20100120162304.MSQC17277.mtaout03-winn.ispmail.ntl.com@aamtaout01-winn.ispmail.ntl.com>
	for <linux-mtd@lists.infradead.org>; Wed, 20 Jan 2010 16:23:04 +0000
Received: from Parkytowers.ntlworld.com ([86.30.40.23])
	by aamtaout01-winn.ispmail.ntl.com
	(InterMail vG.2.02.00.01 201-2161-120-102-20060912) with ESMTP id
	<20100120162303.YKHV13254.aamtaout01-winn.ispmail.ntl.com@Parkytowers.ntlworld.com>
	for <linux-mtd@lists.infradead.org>; Wed, 20 Jan 2010 16:23:03 +0000
Date: Wed, 20 Jan 2010 16:17:55 +0000
To: linux-mtd@lists.infradead.org
From: David Parkinson <parky_dw@ntlworld.com>
Subject: Re: Is it an atomic operation for writing a page in NAND flash
In-Reply-To: <Pine.LNX.4.64.1001201548170.32263@lnxricardw.se.axis.com>
References: <2c3b11251001200158w56bf5cb8l9a27ade9ec3524f2@mail.gmail.com>
	<Pine.LNX.4.64.1001201111550.32263@lnxricardw.se.axis.com>
	<2c3b11251001200511x549f7285if75806e92300818b@mail.gmail.com>
	<20100120133315.GB30789@shareable.org>
	<2c3b11251001200625l4f4ee64emcfe43045913954c@mail.gmail.com>
	<Pine.LNX.4.64.1001201548170.32263@lnxricardw.se.axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Message-Id: <20100120162303.YKHV13254.aamtaout01-winn.ispmail.ntl.com@Parkytowers.ntlworld.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

At 14:54 20/01/2010, Ricard Wanderlof wrote:
 >...
 >The end result is that you can't say "if the ECC says it's ok, the data
 >hasn't been corrupted" (which you could with a CRC).
 >...

Apologies for nit-picking (and small digression), but a CRC is no 
guarantee either.  Whilst error correcting codes have additional 
information so that small errors can be corrected both CRCs and ECCs 
work in the same way in detecting likely errors in the communications 
channel.  (It's all maths and statistics....).

A side question here is have the check algorithms been matched to the 
characteristics of the MTDs?  For example a weakish radio signal is 
likely to have errors randomly distributed across the message.  With 
a magnetic disk drive the errors are likely be caused by a blemish on 
the surface and therefore will come in bursts.  Some algorithms will 
be better than others in the respective cases.

Regards

David
