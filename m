Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HsOAR-0003xC-8r
	for linux-mtd@lists.infradead.org; Sun, 27 May 2007 15:12:48 -0400
Date: Sun, 27 May 2007 21:12:34 +0200
From: Haavard Skinnemoen <hskinnemoen@atmel.com>
To: Haavard Skinnemoen <hskinnemoen@atmel.com>
Subject: Re: Some issues with the AT91 dataflash driver...
Message-ID: <20070527211234.40777726@dhcp-255-175.norway.atmel.com>
In-Reply-To: <20070527200853.3caf8206@dhcp-255-175.norway.atmel.com>
References: <465431DA.5030500@atmel.com>
	<1179992308.13101.16.camel@fuzzie.sanpeople.com>
	<46558893.1020802@comcast.net>
	<1180010988.13101.103.camel@fuzzie.sanpeople.com>
	<012d01c79e06$66823470$3204200a@head.local>
	<20070524164654.3f106ead@newbox> <20070524181437.01550127@newbox>
	<20070527200853.3caf8206@dhcp-255-175.norway.atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: david-b@pacbell.net, Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org, Ivan Kuten <ivan.kuten@promwad.com>,
	Vadim Yatsenko <Vadim.Yatsenko@malva.ua>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 27 May 2007 20:08:53 +0200
Haavard Skinnemoen <hskinnemoen@atmel.com> wrote:

> Now that I've got the CRC errors sorted out, I'll try bisecting it.

Done. git-bisect blames this commit:

10731f83009e2556f98ffa5c7c2cbffe66dacfb3 is first bad commit
commit 10731f83009e2556f98ffa5c7c2cbffe66dacfb3
Author: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date:   Wed Apr 4 13:59:11 2007 +0300

    [JFFS2] fix buffer sise calculations in jffs2_get_inode_nodes()

    In read inode we have an optimization which prevents one
    min. I/O unit (e.g. NAND page) to be read more then once.

    Namely, at the beginning we do not know which node type we read,
    so we read so we assume we read the directory entry, because it
    has the smallest node header. When we read it, we read up to the
    next min. I/O unit, just because if later we'll need to read more,
    we already have this data.

    If it turns out to be that the node is not directory entry, and
    we need more data, and we did not read it because it sits in the
    next min. I/O unit, we read the whole next (or several next)
    min. I/O unit(s). And if it happens to be that we read a data node,
    and we've read part of its data, we calculate partial CRC.
    So if later we need to check data CRC, we'll only read the rest
    of the data from further min. I/O units and continue CRC checking.

    This code was a bit messy and buggy. The bug was that it assumed
    relatively large min. I/O unit, so that the largest node header
    could overlap only one min. I/O unit boundary.

    This parch clean-ups the code a bit and fixes this bug.
    The patch was not tested on flash with small min. I/O unit, like
    NOR-ECC, nut it was tested on NAND with 512 bytes NAND page, so
    it at least does not break NAND. It was also tested with mtdram
    so it should not break NOR.

    Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
    Signed-off-by: David Woodhouse <dwmw2@infradead.org>

I don't have a clue what's wrong with it, but I'll of course help you
debugging if you tell me what to do.

Haavard
