Received: from [208.177.141.226] (helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A5d2O-00037D-AW
	for <linux-mtd@lists.infradead.org>; Sat, 04 Oct 2003 04:24:56 +0100
From: Thayne Harbaugh <tharbuagh@lnxi.com>
To: Howard King <hking@qualcomm.com>
In-Reply-To: <6.0.0.22.2.20031003125817.03ae9010@e2k.qualcomm.com>
References: <6.0.0.22.2.20031003125817.03ae9010@e2k.qualcomm.com>
Message-Id: <1065213244.1508.14.camel@phantasm>
Mime-Version: 1.0
Date: Fri, 03 Oct 2003 21:18:10 -0600
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: mtd support for 64-bit bus
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-10-03 at 14:02, Howard King wrote:
> We have a customized board with 4 AMD 29L641V flash chips (4 * 8Mbyte) with 
> 64-bit wide bus. The mtd driver in linux 2.4.18 kernel does not work for 
> this configuration.  Does anyone have similar experiences?  What is the 
> solution?  Thanks.

Just last week I committed some 64 bit fixes.  I know of a few people
that are using 64 bit buses.  I looked for the AMD 29L641V - I didn't
see it on the AMD site
(http://www.amd.com/us-en/FlashMemory/TechnicalResources/0,,37_1693_2351,00.html).
Will you send me a URL for the data sheet?

If current CVS doesn't work, let us know.
