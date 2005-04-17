Received: from dsl017-055-116.sfo1.dsl.speakeasy.net ([69.17.55.116]
	helo=mail.murgatroid.com)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DN1bf-0001WV-J7
	for linux-mtd@lists.infradead.org; Sun, 17 Apr 2005 00:42:04 -0400
From: "Christopher Hoover" <ch@murgatroid.com>
To: "'Nicolas Pitre'" <nico@cam.org>,
	"'Todd Poynor'" <tpoynor@mvista.com>
Date: Sat, 16 Apr 2005 21:41:58 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.62.0504122118560.14514@localhost.localdomain>
Message-Id: <20050417044201.51DE1A001C7@mail.murgatroid.com>
Cc: linux-mtd@lists.infradead.org
Subject: RE: Fixup Intel flash that powers up locked
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>> Any comments on whether this is or is not the way to go appreciated.

>Properly dealing with this "feature" appears to be so messy that I'm
starting
>to wonder if we should not just unconditionally unlock the flash at boot
time
>and be done with it.

I put forward such code over two years ago.  I can dig it up again.

-ch
