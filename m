Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JTtxe-0003Y9-Sz
	for linux-mtd@lists.infradead.org; Tue, 26 Feb 2008 07:10:48 +0000
Date: Tue, 26 Feb 2008 08:10:10 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Bruce_Leonard@selinc.com
Subject: Re: Question about the size field of mtd_info
Message-ID: <20080226071009.GA20428@lazybastard.org>
References: <OF364D6CEB.467C00F3-ON882573FB.001A64F5-882573FB.001B164C@selinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OF364D6CEB.467C00F3-ON882573FB.001A64F5-882573FB.001B164C@selinc.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 25 February 2008 20:55:58 -0800, Bruce_Leonard@selinc.com wrote:
> 
> I'm new to MTD (and writting drivers for Linux :-/ ), and I'm not sure 
> about a result I'm seeing in mtd_info->size.  I'm putting together a NAND 
> flash driver that ultimately will have 8G of flash attached to it in 2G, 
> 4G, and 8G stuffing options.  When I'm working with the 2G board 
> everything looks fine, but when I jumped to the 4G board I found something 
> interesting.  (I don't want to call it a bug, because I don't know how 
> things work yet, so I'll stick with "interesting".)  With the 2G board 
> mtd_info->size = 0x80000000, which is resonable, however, on the 4G board 
> mtd_info->size = 0x0.  That makes sense because 4G= 0x100000000, one bit 
> more than can be held in a 32-bit value which is how big mtd_info->size 
> is, but it sure makes a mess of the calculations that use mtd_info->size. 
> My question is, is this a bug or am I doing something wrong?

It is either a bug or a design limitation, depending on your mood.
Patches to change this are welcome, in particular when the submitter is
willing to work on them until they are merge-worthy.

Jörn

-- 
This above all: to thine own self be true.
-- Shakespeare
