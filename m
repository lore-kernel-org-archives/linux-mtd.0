Received: from real.realitydiluted.com ([208.242.241.164])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15HSDg-00026k-00
	for <linux-mtd@lists.infradead.org>; Tue, 03 Jul 2001 16:36:09 +0100
Message-ID: <3B41E627.9A0688AA@cotw.com>
Date: Tue, 03 Jul 2001 10:35:03 -0500
From: "Steven J. Hill" <sjhill@cotw.com>
Reply-To: sjhill@cotw.com
MIME-Version: 1.0
To: "Adam J. Richter" <adam@ns1.yggdrasil.com>
CC: dwmw2@redhat.com, linux-kernel@vger.kernel.org,
 	linux-mtd@lists.infradead.org
Subject: Re: linux-2.4.6-pre8/drivers/mtd/nand/spia.c: undefined symbols
References: <200107031310.GAA03900@ns1.yggdrasil.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

"Adam J. Richter" wrote:
> 
>         If there is no architecture on which
> linux-2.4.6-pre8/drivers/mtd/nand/spia.c will compile in its
> "pristine" form, then the CONFIG_MTD_NAND_SPIA should be commented
> out from drivers/mtd/nand/Config.in to avoid wasting the time of
> users and automated build processes alike that just want to build
> all available modules by default.  (At the moment, this code is
> not even bracketed by CONFIG_EXPERIMENTAL, although changing that
> would not be a sufficient fix.)
> 
David has fixed this and it is in the MTD CVS now.

>         Alternatively, if you will send me a one line description
> of each of those four #define parameters, I will be happy to do the grunt
> work of submiting a patch to you or whoever is appropriate to replace
> those values with module and setup parameters that default to those
> values if there are #defined and otherwise will abort initialization
> if they are not #defined and no values were provided at run time.
> (Or, better, yet, you can do this work!)
> 
I have filled in the #define values and placed the new 'spia.c' into
the MTD CVS. I added comments for how those various values should be
defined. Shame on me for forgetting to comment those months ago. Sorry.
I believe that fixes things now?

-Steve

-- 
 Steven J. Hill - Embedded SW Engineer
