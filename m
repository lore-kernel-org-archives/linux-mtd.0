Received: from red.impulse.net ([207.154.64.11])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17a6Z0-00005i-00
	for <linux-mtd@lists.infradead.org>; Thu, 01 Aug 2002 04:23:46 +0100
From: Bill Burgess <burgess@greeneridge.com>
To: <linux-mtd@lists.infradead.org>
Subject: 576-MB DOC reports as Millennium?
Date: Wed, 31 Jul 2002 20:23:37 -0700
Message-Id: <20020801032337.18882@smtp.impulse.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
