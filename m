Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by pentafluge.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EKtQM-0002mt-HL
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 09:05:51 +0100
Date: Thu, 29 Sep 2005 10:02:44 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Chen Zhigao <banyan8@yahoo.com.sg>
Message-ID: <20050929080244.GE16687@wohnheim.fh-wedel.de>
References: <433B9AF6.6020202@yahoo.com.sg>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <433B9AF6.6020202@yahoo.com.sg>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Wrong CLEANMARKER Position
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 29 September 2005 15:42:46 +0800, Chen Zhigao wrote:
> 
> I try to boot my IXP425 board with a JFFS2 root FS on the MTD, into 
> which I burned two images, "zImage" and "jffs2". I got a lot of messages 
> regarding wrong CLEANMARKER position during booting, although I can use 
> the root FS. What's wrong here?

Cleanmarkers were put every 0x00010000 bytes (64k), block size for
jffs2 is 128k.  What is the real block size for the flashes?

Jörn

-- 
tglx1 thinks that joern should get a (TM) for "Thinking Is Hard"
-- Thomas Gleixner
