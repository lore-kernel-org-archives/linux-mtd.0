Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19nb1R-0006G3-48
	for <linux-mtd@lists.infradead.org>; Fri, 15 Aug 2003 10:37:25 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Eugeny Mints <eugeny.mints@auriga.ru>
In-Reply-To: <5B439D84E6653F4AA2E14A5D8898A7E165648D@auriga.auriga.ru>
References: <5B439D84E6653F4AA2E14A5D8898A7E165648D@auriga.auriga.ru>
Message-Id: <1060940229.5306.8.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 15 Aug 2003 10:37:10 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: eraseall in mtd snapshot at 04 of August 2003
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-08-15 at 10:34, Eugeny Mints wrote:
> Hello David, all!
> 
> I use mtd snapshot at 04 of August 2003.  While 'eraseall /dev/mtdX'
> works fine for my TOSHIBA TC58256AFT NAND flash, 'eraseall -j /dev/mtdX'
> hangs. Earlier I used mtd snapshot at ealy of June and 'eraseall -j'
> worked. I checked eraseall implementation - it is the same in both
> snapshots. So, it seems the problem is somewhere in nand implementation
> (possible with cleanmarker of writeoob). Any suggestions would be very
> helpful!

Precisely where does it hang? In what system call (strace), and what
kernel function (ps l or SysRq-T)?

-- 
dwmw2
