Received: from [207.209.118.131] (helo=msi-ex6.m-sys.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17a6t8-00007o-00
	for <linux-mtd@lists.infradead.org>; Thu, 01 Aug 2002 04:44:35 +0100
Message-ID: <AEA9DCA73595D411A6D4009027DE9C5E019BFE5E@MSI-EX6>
From: Vadim Khmelnitsky <vadim.khmelnitsky@m-sys.com>
To: 'Bill Burgess' <burgess@greeneridge.com>
Cc: linux-mtd@lists.infradead.org
Subject: RE: 576-MB DOC reports as Millennium?
Date: Wed, 31 Jul 2002 20:46:33 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

That's true .

New diskonchip 2000 of certain capacities will not work with current open
source driver .
576MB is one of them .

Vadim.


-----Original Message-----
From: Bill Burgess [mailto:burgess@greeneridge.com]
Sent: Wed, July 31, 2002 8:24 PM
To: linux-mtd@lists.infradead.org
Subject: 576-MB DOC reports as Millennium?


Doc2000.c can't seem to handle the new 576-MB DoC's.

The docprobe.c driver (version 1.30) reports them as
Millenniums, but then doc2000.c (version 1.46) fails
to access the mfr or id using Millennium-oriented calls;
these come back 0xff or 0.  If I force the ChipID to be
a 2000, docprobe doesn't even get past the initial toggle
test.  Also like a blank Millennium, there is no 0x55aa
signature at the base address, only 0xffff.

The 576's have NOT been formatted with DFORMAT
or anything else, they came raw.  However what I am
attempting is so low-level, the formatting should be
irrelevant -- shouldn't it??

I am not actually using Linux, but have incorporated
the drivers into a low-level custom system based on
a 68K.  The drivers have worked beautifully for months.
Even now I can swap an 8-MB or a 288-MB DOC2000
into the socket and they work fine.  So I don't think
it's my platform that's suddenly gone off.

If the solution is not obvious or quick I will have
to buy some 288's very soon, which will hurt as I have
already bought the 576's :-<  Help!

Cheers & thanks!

--Bill

_________________________________________________________
William C. Burgess, Ph.D., Senior Research Engineer
Greeneridge Sciences Inc., 1411 Firestone Rd., Goleta, CA 93117
Tel: (805) 899-3558  Fax: (805) 967-7720
http://www.greeneridge.com



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
