Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C0KzY-0005wX-5Z
	for linux-mtd@lists.infradead.org; Thu, 26 Aug 2004 10:12:40 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: Jochen Karrer <j.karrer@lightmaze.com>
In-Reply-To: <MKELJOLMMOHJCMIPKLJKCEMOCAAA.j.karrer@lightmaze.com>
References: <MKELJOLMMOHJCMIPKLJKCEMOCAAA.j.karrer@lightmaze.com>
Content-Type: text/plain
Message-Id: <1093529549.3777.1767.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Thu, 26 Aug 2004 15:12:29 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Bug in cfi_cmdset_0002.c in linux-2.6.8.1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-08-26 at 15:11 +0200, Jochen Karrer wrote:
> Hi,
> jffs2 did not work in linux-2.6.8.1 because single word writes at the end
> of a buffer write are done with the wrong address:

Thanks. If this is needed though -- don't we _also_ need the same fix a
few lines up?

-- 
dwmw2
