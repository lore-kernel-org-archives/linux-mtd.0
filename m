Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D4z0Q-0004Aj-FA
	for linux-mtd@lists.infradead.org; Sat, 26 Feb 2005 05:17:03 -0500
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: "Craig A. Vanderborgh" <craigv@voxware.com>
In-Reply-To: <421F9B58.60109@voxware.com>
References: <421F9B58.60109@voxware.com>
Content-Type: text/plain
Date: Sat, 26 Feb 2005 13:16:25 +0300
Message-Id: <1109412985.4688.3.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Kernel Panic w/Xscale (PXA255) & 2.6.10
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-02-25 at 16:40 -0500, Craig A. Vanderborgh wrote:
> Hello All:
> 
> This problem was recently reported in the mtd mailing list thread "Oops 
> vanilla 2.6.10" by Konstantin Kletschke.  However, there was no 
> resolution that I could see, so I am reporting it again in hopes that 
> some mtd guru might take pity on us.
> 
> Our platform is a PXA-255 based SBC.  It is running kernel 2.6.10 
> *extremely* well, with one exception - when accessing a VIRGIN jffs2 
> filesystem, we get a kernel panic.  We cannot get past this unless we 
> reload our 2.4.27 kernel and let it do the initial JFFS2 setup stuff.  
> After reloading kernel 2.6.10, everything is then okay.  Just the 
> uninitialized JFFS2 is a problem.  The JFFS2 error(s) and the KP should 
> look familiar:
> 
Hello Craig,

the first steps we ask everybody to do are:
1. try the latest MTD snapshot (download it from CVS);
2. if the problem hasn't gone, enable the JFFS2 debugging messages
(level 1) and send the JFFS2 output.

Please, do it.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
