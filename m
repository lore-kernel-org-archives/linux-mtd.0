Received: from e2.ny.us.ibm.com ([32.97.182.102])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C0REg-0007K6-0O
	for linux-mtd@lists.infradead.org; Thu, 26 Aug 2004 16:52:45 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: Ian Molton <spyro@f2s.com>
In-Reply-To: <20040826205437.55bf8a6a.spyro@f2s.com>
References: <20040824010927.04e6ccb3.spyro@f2s.com>
	<20040826205437.55bf8a6a.spyro@f2s.com>
Content-Type: text/plain
Message-Id: <1093553554.25339.10.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Thu, 26 Aug 2004 15:52:34 -0500
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: New driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-08-26 at 14:54, Ian Molton wrote:
> On Tue, 24 Aug 2004 01:09:27 +0100
> Ian Molton <spyro@f2s.com> wrote:
> 
> > Hi.
> > 
> > Here is my first run at the TC6393XB NAND/Smartmedia controller driver.
> 
> No comments ?

You forgot to iounmap in your tmio_cleanup function.

Also, you could put:

if(len & 0x3)
	BUG();

into a macro.  Later, if you can ever guarantee that will never be true,
you can just define the macro to be a no-op.  Just a coding style thing
though.

josh
