Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Qu3W-0003aK-BG
	for <linux-mtd@lists.infradead.org>; Fri, 13 Jun 2003 20:17:46 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: f.callaghan@ieee.org
In-Reply-To: <200306131447.45138.f.callaghan@ieee.org>
References: <OOEOKBMECIFAEPIMFOGIMEPICBAA.sgluckman@omnitech.com>
	 <200306131411.07069.f.callaghan@ieee.org>
	 <1055528889.3632.180.camel@passion.cambridge.redhat.com>
	 <200306131447.45138.f.callaghan@ieee.org>
Message-Id: <1055531892.3632.183.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 13 Jun 2003 20:18:12 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Please Help, problem mounting jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-06-13 at 19:47, Frank R Callaghan wrote:
> OK, this sounds bad !  Where can I go from here ?

Well, you can start by just commenting out the whole of both the
jffs2_{start,stop}_garbage_collect_thread() functions since the thread
is an optimisation anyway. But basically you need to find out why
kernel_thread() isn't working.

It's not a uclibc bug -- it's a kernel bug, and not one in the standard
kernel either -- I'm inclined to suspect RTAI at this stage, although
you blatantly have other kernel threads running so it's not a simple and
obvious breakage.


-- 
dwmw2
