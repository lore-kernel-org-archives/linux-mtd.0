Received: from [2002:d49e:dbb4::1] (helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CCKAT-00009H-O2
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2004 11:45:30 -0400
Date: Tue, 28 Sep 2004 16:45:20 +0100
From: Ben Dooks <ben-mtd@fluff.org>
To: "lp4u@inwind.it" <lp4u@inwind.it>
Message-ID: <20040928154520.GI22627@home.fluff.org>
References: <I4RBZW$1BC751545D7EDF7C8647146B5A96310F@libero.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <I4RBZW$1BC751545D7EDF7C8647146B5A96310F@libero.it>
Sender: Ben Dooks <ben@fluff.org>
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: Write on nand
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 28, 2004 at 05:21:32PM +0200, lp4u@inwind.it wrote:
> Hi,
> 
> finally my board detect the NAND. How to use MTD? How to write, read on my NAND?
> Can I write on:
> 0x00000000-0x00004000 : "Boot Agent"
> mtd: Giving out device 0 to Boot Agent
> 0x00004000-0x00400000 : "/boot"
> mtd: Giving out device 1 to /boot

The best thing to do is to read the following:

http://www.linux-mtd.infradead.org/
http://www.linux-mtd.infradead.org/nand.html

and look at things like nandwrite, jffs2

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
