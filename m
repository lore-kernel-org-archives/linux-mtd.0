Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19FFYX-0006rZ-30
	for <linux-mtd@lists.infradead.org>; Mon, 12 May 2003 16:49:37 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Mike Kelly <mgkelly59@yahoo.com>
In-Reply-To: <20030512152319.11494.qmail@web9602.mail.yahoo.com>
References: <20030512152319.11494.qmail@web9602.mail.yahoo.com>
Message-Id: <1052754593.23450.75.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 12 May 2003 16:49:53 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Is it normal to have a defunct jffs2_gcd_mtd1 process?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-05-12 at 16:23, Mike Kelly wrote:
> I wasn't aware that I was mounting it twice.  I have
> "root=/dev/mtdblock1 rw" in the default string for the
> command line options (I am using MontaVista's TCT gui
> program for configuring and building the kernel). 
> Where else might I be mounting it?

Your initscripts or linuxrc will probably be doing 
'mount -orw,remount /' somewhere.

-- 
dwmw2
