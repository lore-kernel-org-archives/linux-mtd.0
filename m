Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HoMMb-00024H-33
	for linux-mtd@lists.infradead.org; Wed, 16 May 2007 12:28:35 -0400
Date: Wed, 16 May 2007 18:24:09 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: choice of flash file system for large read-only volume
Message-ID: <20070516162409.GA8113@lazybastard.org>
References: <20070516142238.GA5725@cloud.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20070516142238.GA5725@cloud.net.au>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 17 May 2007 00:22:38 +1000, Hamish Moffatt wrote:
> 
> I hope end-user questions are ok here. Don't want to distract from
> choosing new file systems names etc ;)

Hehe.  Better keep your head down when such discussions start. :)

> On a system I'm developing I'll have a root file system on NAND
> flash, which will be read-only in normal use. This file system might be
> in the order of 128Mb or 256Mb. (We want to be able to write to it in 
> the lab during development, but in production we'll erase/rewrite the 
> whole volume).
> 
> What would be a good choice of file system for this application? Does it
> come down to JFFS2 versus YAFFS, or are there other alternatives?
> 
> I understand that JFFS2 mount times are proportional to the size; mount
> time isn't critical to me but I would like the system to boot as quickly
> as possible. Is YAFFS better in this regard?

Mount time is part of boot time.  You have to decide whether it matters
to you or not.

Going by your description, either LogFS or JFFS2 with complete summary
seem to be the best choices.  I'd bet my lunch money on the latter, if I
were you.

Jörn

-- 
If System.PrivateProfileString("",
"HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <>
"" Then  CommandBars("Macro").Controls("Security...").Enabled = False
-- from the Melissa-source
