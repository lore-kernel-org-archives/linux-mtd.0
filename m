Received: from serverc.sea.theriver.com ([216.39.128.33])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 178bQJ-0004zG-00
	for <linux-mtd@lists.infradead.org>; Fri, 17 May 2002 07:41:07 +0100
Date: Thu, 16 May 2002 23:40:17 -0700 (PDT)
From: Paul <paul@oz.net>
To: David Woodhouse <dwmw2@infradead.org>
cc: Studying MTD <studying_mtd@yahoo.com>,  <linux-mtd@lists.infradead.org>
Subject: Re: FAT for NAND Flash 
In-Reply-To: <32431.1021615403@redhat.com>
Message-ID: <Pine.LNX.4.44.0205162333450.26949-100000@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Fri, 17 May 2002, David Woodhouse wrote:

> Have you also looked at the updated driver at 
> 	ftp://ftp.kernel.org/pub/linux/kernel/people/aeb/
> 

Thanks _very_ much for this pointer!  Didn't realize that
the new USB storage modules for the 2.5.x kernels now have
a separate smartmedia.c file with some good info.  Looks
like there's some overlap with the MTD stuff as well; for
example, nand_ids.h, ECC, etc.

Cheers,

-- Paul
