Received: from main.gmane.org ([80.91.224.249])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1By4ah-0004ob-QW
	for linux-mtd@lists.infradead.org; Fri, 20 Aug 2004 04:17:50 -0400
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1By4ad-0007M3-00
	for <linux-mtd@lists.infradead.org>; Fri, 20 Aug 2004 10:17:35 +0200
Received: from a2125958202.net-htp.de ([212.59.58.202])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 20 Aug 2004 10:17:35 +0200
Received: from sst by a2125958202.net-htp.de with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 20 Aug 2004 10:17:35 +0200
To: linux-mtd@lists.infradead.org
From: =?ISO-8859-1?Q?Stefan_St=FCrke?= <sst@pandatel.com>
Date: Fri, 20 Aug 2004 10:17:31 +0200
Message-ID: <4125B39B.8010705@pandatel.com>
References: <cg23u5$gd0$1@sea.gmane.org>	<1092919733.23187.34.camel@linpc003.aimsys.nl>	<4124C848.7000808@pandatel.com>
	<1092930561.2991.8.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
In-Reply-To: <1092930561.2991.8.camel@weaponx.rchland.ibm.com>
Sender: news <news@sea.gmane.org>
Cc: jdup@us.ibm.com
Subject: Re: MTD and 28F128J3A
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Josh Boyer wrote:
...

> Is it in CFI query mode, or in Read Status mode?  I have seen it be left
> in Read Status mode after a write, but never CFI query mode.

Sorry, you are right, the flash is in Read Status mode.

> 
> Leaving it in Read Status mode shouldn't have any side effects during
> runtime operation, since the MTD code expects that.  It's probably more
> efficient anyway, since the code can't be sure of what the next
> operation will be.

Ok, I just implemented my 'dirty fix' and it works for my hardware :-)

Thanks again for your help,
Stefan

-- 
Stefan Stürke
