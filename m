Date: Fri, 23 May 2003 17:16:42 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
To: "Brian T." <btuch@usa.net>
In-Reply-To: <000f01c32145$f6560b40$150a0ac0@jbmsoft.com>
Message-ID: <Pine.LNX.4.44.0305231715140.2461-100000@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: RobertS <RobertS@visi.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: A solution for a particular "Magic bitmask 0x1985 not found"
 error
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 23 May 2003, Brian T. wrote:

> I have seen this also, but it was caused by uploading the jffs2 image to the
> unit using xmodem, which annoyingly pads the last (128 - (SIZE % 128)) of
> the file being uploaded with 0x1A.  I fixed this by padding the end of the
> file with 0xFF prior to upload to make it look erased instead.

That's why I added the '-p' option to mkfs.jffs2 many moons ago. It's not 
quite the same as the others are seeing though -- if you look closer at 
their messages, the words on the flash that JFFS2 is complaining about 
aren't all 0x1A1A and aren't at the end of the image; they're at the 
beginning.

-- 
dwmw2
