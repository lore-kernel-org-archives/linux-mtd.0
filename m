Received: from snifit.smb.utfors.se ([195.58.112.20])
	by pentafluge.infradead.org with esmtp (Exim 4.12 #3 (Red Hat Linux))
	id 18g7AP-0007iI-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Feb 2003 17:47:29 +0000
Received: from LUMENTIS02 ([212.105.56.242])
 by snifit.smb.utfors.se (iPlanet Messaging Server 5.2 Patch 1 (built Aug 19
 2002)) with SMTP id <0H9S00D05PF4K1@snifit.smb.utfors.se> for
 linux-mtd@lists.infradead.org; Tue, 04 Feb 2003 18:47:29 +0100 (MET)
Date: Tue, 04 Feb 2003 18:47:28 +0100
From: Joakim Tjernlund <joakim.tjernlund@lumentis.se>
In-reply-to: <200302041734.24986.phil@river-bank.demon.co.uk>
To: Phil Thompson <phil@river-bank.demon.co.uk>,
 David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Reply-to: joakim.tjernlund@lumentis.se
Message-id: <IGEFJKJNHJDCBKALBJLLMEPCFJAA.joakim.tjernlund@lumentis.se>
MIME-version: 1.0
Subject: RE: Different zlib CRC Algorithms
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
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

> > > Why does ppcboot/uboot have two versions of crc32()? What's the
> > > difference between them?
> >
> > The difference is the ^0xffffffff part you decribed above. One is used by
> > uboot for crc'ing images, environment etc. The other for JFFS2 support in
> > uboot.
> 
> So that would confirm my original observation that the kernel does use a 
> slightly different CRC algorithm than userspace zlib.

hmm, does zlib use crc32() at all? I have only seen adler32() in zlib,
I haven't look very hard though.


> 
> It's not a problem - I was just curious to know why.
> 
> Phil
> 
