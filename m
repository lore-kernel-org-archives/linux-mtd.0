Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AwGOY-0003Ei-Tc
	for linux-mtd@lists.infradead.org; Thu, 26 Feb 2004 07:57:23 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Trilok Soni <x000soni@india.ti.com>
In-Reply-To: <015601c3fc3b$49a70b20$73b6a8c0@ent.ti.com>
References: <015601c3fc3b$49a70b20$73b6a8c0@ent.ti.com>
Content-Type: text/plain
Message-Id: <1077782240.11584.1041.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Thu, 26 Feb 2004 07:57:21 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Unable to mount rootfs on mtdblock3
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-02-26 at 13:06 +0530, Trilok Soni wrote:

> 3. Now I had tried to boot using root=/dev/mtdblock3 command line argument.
> Here is the kernel -boot output.

In the 2.6 kernel you also need 'rootfstype=jffs2'.

-- 
dwmw2
