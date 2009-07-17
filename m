Received: from smtpauth01.csee.onr.siteprotect.com ([64.26.60.145])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MRc6V-00025W-Md
	for linux-mtd@lists.infradead.org; Fri, 17 Jul 2009 01:19:20 +0000
Message-ID: <4A5FD18C.1090300@boundarydevices.com>
Date: Thu, 16 Jul 2009 18:19:08 -0700
From: Troy Kisky <troy.kisky@boundarydevices.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH V5 2/2] mtd: nand: Calculate better default ecc layout
References: <1247789948-5764-1-git-send-email-troy.kisky@boundarydevices.com>
	<1247789948-5764-2-git-send-email-troy.kisky@boundarydevices.com>
In-Reply-To: <1247789948-5764-2-git-send-email-troy.kisky@boundarydevices.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: david-b@pacbell.net, tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Troy Kisky wrote:
> Have nand_base calculate a good ecc layout
> default. A benefit of this is allowing
> a software ecc other than 3 bytes long. For example,
> 4 bit software ecc correction.
> 
> This patch should be safe because it adds new
> routines to be used. As board maintainers verify
> that the new routines work for them, they should
> send in a patch changing
> 
>    nand_scan -> nand_scan_finish
>    nand_scan_tail -> nand_scan_finish_tail
> 
> This patch will also add all oob bytes that
> are not reserved for ecc or bad block markers
> to the end of the free list. I don't think this
> can cause problems, but I would like an authority
> to say, "Yes, it's safe."
> 
I have a few checkpatch issues to deal with if this
approach is approved.

Sorry, it slipped my mind.

Troy
