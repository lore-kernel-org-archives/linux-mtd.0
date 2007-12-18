Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J4fpo-00052i-Er
	for linux-mtd@lists.infradead.org; Tue, 18 Dec 2007 17:02:30 +0000
Date: Tue, 18 Dec 2007 17:56:49 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: David Brown <davidb@davidb.org>
Subject: Re: Limited support of NAND features in MTD.
Message-ID: <20071218165648.GH1741@lazybastard.org>
References: <Pine.LNX.4.64.0712121107010.19025@pentafluge.infradead.org>
	<20071218142335.GD1741@lazybastard.org>
	<Pine.LNX.4.64.0712181450540.31218@pentafluge.infradead.org>
	<20071218151800.GG1741@lazybastard.org>
	<20071218165758.GA11634@old.davidb.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20071218165758.GA11634@old.davidb.org>
Cc: linux-mtd@lists.infradead.org, =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	dwmw2@infradead.org, Alexey Korolev <akorolev@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 18 December 2007 08:57:58 -0800, David Brown wrote:
> 
> One problem with the on-chip copy is that ECC doesn't get corrected.  If
> there are errors on readback, it will get written that way, and errors
> would accumulate.

Ouch!  Such an implementation would indeed make this whole business
pointless.

> It is conceivable that the controller could do something intermediary, such
> as read the data, and if the ECC needs no correction, write from the
> on-chip cache, otherwise write the corrected data.

Yes, something like that would be necessary.

Jörn

-- 
To my face you have the audacity to advise me to become a thief - the worst
kind of thief that is conceivable, a thief of spiritual things, a thief of
ideas! It is insufferable, intolerable!
-- M. Binet in Scarabouche
