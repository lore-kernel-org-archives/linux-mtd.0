Received: from mail.fh-wedel.de ([213.39.232.194])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AgSN7-0007qA-PR
	for linux-mtd@lists.infradead.org; Tue, 13 Jan 2004 17:30:33 +0000
Date: Tue, 13 Jan 2004 18:27:55 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Markus Borchers <MBorchers@adwin.de>
Message-ID: <20040113172755.GA25159@wohnheim.fh-wedel.de>
References: <opr1py4bes8jdzbh@10.100.100.100>
	<20040113154724.GA23333@wohnheim.fh-wedel.de>
	<1074009621.17620.70.camel@hades.cambridge.redhat.com>
	<opr1p1wgi48jdzbh@10.100.100.100>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <opr1p1wgi48jdzbh@10.100.100.100>
cc: linux-mtd@lists.infradead.org
Subject: Re: overwrite complete flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 13 January 2004 17:10:54 +0100, Markus Borchers wrote:
> 
> /dev/mtdblock0 (minor 0) is partition 0 (RedBoot).
> If it _is_ possible to register the whole device first, what do I have to 
> do?

Change the code.  Should be pretty simple, a couple of lines.  What is
your mapping driver?

BTW: Imo there is no sane reason, _not_ to register the whole device.
Ever.  Laziness is a reason, just not sane.

Jörn

-- 
Time? What's that? Time is only worth what you do with it.
-- Theo de Raadt
