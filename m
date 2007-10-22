Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Ijzog-0005nb-9V
	for linux-mtd@lists.infradead.org; Mon, 22 Oct 2007 17:07:48 +0100
Date: Mon, 22 Oct 2007 18:00:03 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: FTLs for NANDSim
Message-ID: <20071022160003.GA13023@lazybastard.org>
References: <7ee965bc0710200922n2159c5dav4357d1cdce5521e8@mail.gmail.com>
	<1193045588.2672.15.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1193045588.2672.15.camel@shinybook.infradead.org>
Cc: linux-mtd@lists.infradead.org, Sun Devil <sundevil007@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 22 October 2007 10:33:08 +0100, David Woodhouse wrote:
> 
> > 2. Do you have any implementations of FTL at Kernel level?
> 
> Yes. We have the simplistic 'mtdblock' which doesn't really do any
> translation at all, we have 'FTL' which works only on NOR flash, and we
> have 'NFTL' and 'INFTL' for use on DiskOnChip devices. There is a helper
> layer which is designed to make it relatively easy for you to provide
> your own translation layer, without having to get too deeply involved in
> how Linux block device drivers work.

There are at least two more:
ssfdc.c
rfd_ftl.c

One of them appears to do the smartmedia format, the other something
very similar.

Jörn

-- 
Science is like sex: sometimes something useful comes out,
but that is not the reason we are doing it.
-- Richard Feynman
