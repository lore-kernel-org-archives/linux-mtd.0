Received: from [2002:d49e:dbb4::1] (helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CAREH-0000fj-VT
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2004 06:53:38 -0400
Date: Thu, 23 Sep 2004 11:53:33 +0100
From: Ben Dooks <ben-mtd@fluff.org>
To: "lp4u@inwind.it" <lp4u@inwind.it>
Message-ID: <20040923105333.GD25491@home.fluff.org>
References: <I4HNJB$733ED100B2A7DCACE394A820AA6E46D2@libero.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <I4HNJB$733ED100B2A7DCACE394A820AA6E46D2@libero.it>
Sender: Ben Dooks <ben@fluff.org>
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: NAND detect
Reply-To: Ben Dooks <ben@fluff.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 23, 2004 at 11:54:47AM +0200, lp4u@inwind.it wrote:
> Hi,
> 
> I have a s3c2410 board (BAST architecture).
> I have installed on board a kernel2.4.26 patched and with MTD.
> But the board, at boot (OF LINUX), don't detect the NAND (I've 3 NANDs on board: 2 samsung 
> & 1 STM).
> The MTD detect only NOR Flash.

ok, we are looking into this, see the previous thread for
any more info on what is happening with this.

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
