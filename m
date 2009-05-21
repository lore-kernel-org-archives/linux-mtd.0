Received: from fed1rmmtao105.cox.net ([68.230.241.41])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M6w45-0004tA-Gx
	for linux-mtd@lists.infradead.org; Thu, 21 May 2009 00:23:39 +0000
Message-ID: <4A149EF2.1010208@boundarydevices.com>
Date: Wed, 20 May 2009 17:23:14 -0700
From: Troy Kisky <troy.kisky@boundarydevices.com>
MIME-Version: 1.0
To: "Narnakaje, Snehaprabha" <nsnehaprabha@ti.com>
Subject: Re: [PATCH 2.6.30-rc6 3/3] NAND: Add 4-bit ECC support for large
	page	NAND chips
References: <1242682705-19845-1-git-send-email-nsnehaprabha@ti.com>	<4A11F5FC.40709@boundarydevices.com>	<4A11FA90.3060403@boundarydevices.com>
	<7A436F7769CA33409C6B44B358BFFF0C01138180E0@dlee02.ent.ti.com>
	<4A1454B8.3010605@boundarydevices.com>
	<7A436F7769CA33409C6B44B358BFFF0C01138184F0@dlee02.ent.ti.com>
	<4A1465AE.7090706@boundarydevices.com>
	<7A436F7769CA33409C6B44B358BFFF0C0113818603@dlee02.ent.ti.com>
In-Reply-To: <7A436F7769CA33409C6B44B358BFFF0C0113818603@dlee02.ent.ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>,
	David Brownell <david-b@pacbell.net>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 
> I explored nand_bbt, jffs2 using the OOB area.
> 
> This is what I found -
> 2 bytes at offset 0: BB markers
> 4 bytes at offset 8: BBT magic number/data
> 1 byte at offset 12: BBT version
> 8 bytes at offset 16: JFFS2 clear markers
> 
> So, it is better to start with offset 24 (there are few bytes in between, but it is better to leave them as-is).
> 
> Dave, 
> 
> Did you have any comments?
> 
> Thanks
> Sneha


If you have to move the ECC anyway, there really isn't a further compatibility
problem with moving the JFFS2 bytes as well.

0-1 : BB marker
2-23 : Free space (JFFS2 will use)
24-63 : 4 x 10 bytes of ecc.


This way, if the default ecc layout patch that I submitted is ever accepted, the code in this
patch can be removed.

Troy
