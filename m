Received: from playa.onespot.com ([64.41.197.68] helo=mail.onespot.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B4NkJ-0004jK-1g
	for linux-mtd@lists.infradead.org; Fri, 19 Mar 2004 17:25:23 +0000
From: "Christopher Hoover" <ch@murgatroid.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>,
	"'Eisenhut, Daniel (MED)'" <Daniel.Eisenhut@med.ge.com>
Date: Fri, 19 Mar 2004 09:24:38 -0800
Message-ID: <001c01c40dd7$0e7e6270$7800000a@duckduck>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1079711717.16952.287.camel@hades.cambridge.redhat.com>
cc: linux-mtd@lists.infradead.org
Subject: RE: Block lock-bits
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> ioctl(MEMUNLOCK) on /dev/mtdX character device.
> 
> If this is the silly chip that automatically locks every time 
> you power cycle it, then perhaps we ought to be unlocking the 
> whole thing when we detect it.

It is.  I have a patch in my tree that unlocks the flash in my mapping
driver (sa1100), but perhaps it ought to be generalized a bit.

-ch
