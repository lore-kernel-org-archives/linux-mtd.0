Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HJzIE-0001aQ-Lz
	for linux-mtd@lists.infradead.org; Wed, 21 Feb 2007 16:46:33 -0500
Date: Wed, 21 Feb 2007 21:43:10 +0000
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Jason Lunz <lunz@falooley.org>
Subject: Re: [PATCH] block2mtd oops in erase function.
Message-ID: <20070221214309.GH3219@lazybastard.org>
References: <20070219223023.GF7813@lazybastard.org>
	<1171938429.2859.2.camel@NF.local>
	<20070220105306.GC10455@lazybastard.org>
	<20070220213528.GA7764@metaxa.reflex>
	<20070220215513.GA13493@lazybastard.org>
	<20070221030254.GA11044@avocado.homenet>
	<20070221144754.GC464@lazybastard.org>
	<20070221154249.GB7764@metaxa.reflex>
	<20070221160217.GA2650@lazybastard.org>
	<20070221202650.GC7764@metaxa.reflex>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20070221202650.GC7764@metaxa.reflex>
Cc: Felix Fietkau <nbd@openwrt.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 21 February 2007 15:26:51 -0500, Jason Lunz wrote:
> 
> ...ah, it seems removing the -j does the trick. If I don't use it, mount
> goes from >50s to <4s.

That's sounds better.  Thank you for testing the patches.

Jörn

-- 
Time? What's that? Time is only worth what you do with it.
-- Theo de Raadt
