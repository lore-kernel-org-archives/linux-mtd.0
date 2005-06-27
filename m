Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Dmzvy-0003jS-Ty
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2005 16:10:24 -0400
Date: Mon, 27 Jun 2005 22:10:11 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Ryan Underwood <nemesis-lists@icequake.net>
Message-ID: <20050627201011.GA6644@wohnheim.fh-wedel.de>
References: <20050625015430.GK8920@dbz.icequake.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20050625015430.GK8920@dbz.icequake.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: slram reserve its memory region?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 24 June 2005 20:54:30 -0500, Ryan Underwood wrote:
> 
> I am having a problem where slram fails to reserve the memory it is
> using, allowing a later-loaded PCI driver (yenta_socket) to have PCI
> resources mapped in the same area, which results in a non-functional
> hardware.  This effect is only possible because mem= kernel parameter is
> required to prevent the kernel from using memory that slram will be
> using later, but unfortunately device resources can still be mapped
> there since the kernel thinks slram's area is not physical RAM and is
> thus safe to use.
> 
> Is it an easy change to cause slram to reserve the memory area it uses
> so that nothing else attempts to use it?

No, it's not.  See my reply to the original thread.

Jörn

-- 
"doesn't need to know [...] how to cause a headache in order to take an 
aspirin."
-- Scott Culp, Manager of the Microsoft Security Response Center, 2001
