Received: from [213.86.99.237] (helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18eBfV-0000dy-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2003 10:11:38 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.52.0301281755410.19671@mag.devdep.sysgo.de> 
References: <Pine.LNX.4.52.0301281755410.19671@mag.devdep.sysgo.de> 
To: Marius Groeger <mag@sysgo.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: PATCH: support for Arctic/Beech/Ebony 
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Date: Thu, 30 Jan 2003 10:42:30 +0000
Message-ID: <4504.1043923350@passion.cambridge.redhat.com>
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

mag@sysgo.de said:
> attached is a patch that adds MTD support for a couple of PowerPC
> boards based on the IBM440GP CPU. It also clean up the PPC section in
> the mapping drivers Config.in, making it more robust against
> configuration errors.

Please also update Kconfig, and add $Id$ headers to new files.

--
dwmw2
