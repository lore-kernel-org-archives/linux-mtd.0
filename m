Received: from blood.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19RMLt-0000D5-Qj
	for <linux-mtd@lists.infradead.org>; Sun, 15 Jun 2003 02:30:38 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: Jasmine Strong <jasmine@regolith.co.uk>,
	Conn Clark <clark@esteem.com>
Date: Sun, 15 Jun 2003 13:33:34 +1200
References: <20030612163736.CFEC.MINGFENG@linpus.com>
	<3EE8A3EA.5090001@esteem.com>
	<Pine.LNX.4.53.0306131307040.11502@undine.linuxgrrls.org>
In-Reply-To: <Pine.LNX.4.53.0306131307040.11502@undine.linuxgrrls.org>
MIME-Version: 1.0
Message-Id: <20030615013104.0663F44BF@blood.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
cc: MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: Re: MRAM will kill FLASH ?
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday 14 June 2003 00:07, Jasmine Strong wrote:
> On Thu, 12 Jun 2003, Conn Clark wrote:
> > mingfeng wrote:
> > > who know MRAM(Magnetoresistive Random Access Memory) ?
> > > Will it kill FLASH soon?
> >
> > It probably wont be soon. I don't think it will kill flash completely
> > either.
>
> And either way it'll probably work the same sort of way as NAND Flash;
> ie error-prone, block-oriented and byte-serial.

My understanding of MRAM is that it can be read and written like RAM (ie. no 
concept of blocks, erasing etc. It might be error prone, but that can perhaps 
be sorted the same way as RAM errors are handled.

The biggest hurdle is that this stuff is still not practical for most 
applicaions. We're looking at devices of a few MB in 2004, when NAND is 
already volume shipping 256 MB. Thus, MRAM will only suite very niche 
applications for the forseeable future.

IMHO

-- CHarles
