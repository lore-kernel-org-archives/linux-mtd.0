Received: from dhcp695.linuxsymposium.org ([209.151.10.193]
	helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19g3Ql-0002jR-AB
	for <linux-mtd@lists.infradead.org>; Fri, 25 Jul 2003 15:20:24 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Yuxiao Xi <xiyuxiao@harbournetworks.com>
In-Reply-To: <E19fueM-00023n-B0@pentafluge.infradead.org>
References: <E19fueM-00023n-B0@pentafluge.infradead.org>
Message-Id: <1059142770.28255.28.camel@lapdancer.baythorne.internal>
Mime-Version: 1.0
Date: Fri, 25 Jul 2003 10:19:32 -0400
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: compiling MTD error
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-07-25 at 01:00, Yuxiao Xi wrote:
> Which MTD version works well with linux kernel 2.4.17?

By specifying 2.4.17 you are explicitly saying you _want_ to use old
broken code and you don't want bug-fixes. So just use the MTD code that
is _in_ 2.4.17. Or upgrade your kernel.

-- 
dwmw2
