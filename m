Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HPIDw-0003gH-AW
	for linux-mtd@lists.infradead.org; Thu, 08 Mar 2007 08:00:41 -0500
Date: Thu, 8 Mar 2007 13:56:44 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] [MTD] Correct partition failed erase address
Message-ID: <20070308125643.GC23216@lazybastard.org>
References: <45EFE35C.70604@nokia.com>
	<1173349670.3461.398.camel@pmac.infradead.org>
	<1173349989.3461.402.camel@pmac.infradead.org>
	<45EFE727.5070509@nokia.com>
	<1173350593.3461.408.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1173350593.3461.408.camel@pmac.infradead.org>
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <ext-adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 8 March 2007 10:43:13 +0000, David Woodhouse wrote:
> 
> Ew, you're right -- and the API is worse than I thought.

And the API is _never_ used asynchronously.  For current drivers, it
is pure overhead.

Jörn

-- 
Joern's library part 1:
http://lwn.net/Articles/2.6-kernel-api/
