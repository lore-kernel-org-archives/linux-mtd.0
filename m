Received: from marasystems.com ([213.15.252.90] helo=filer.marasystems.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17nDZ8-00062C-00
	for <linux-mtd@lists.infradead.org>; Fri, 06 Sep 2002 08:30:06 +0100
Date: Fri, 6 Sep 2002 09:29:31 +0200 (CEST)
From: =?ISO-8859-1?Q?Henrik_Nordstr=F6m?= <hno@marasystems.com>
To: MAL <mal@komcept.com>
cc: mateo@posta.star.si, <linux-mtd@lists.infradead.org>
Subject: Re: DOC 2000 and GRUB
In-Reply-To: <1031294438.7779.6.camel@mal>
Message-ID: <Pine.LNX.4.44.0209060926110.20719-100000@filer.marasystems.com>
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

On 6 Sep 2002, MAL wrote:

> If you want to boot linux from the HDD again, remove the DOC address
> selection jumper for your mainboard, boot, and put it back while the
> system is at it's bootloader.

Or use the patch recently posted on this list to make it possible to abort 
the loading of the grub firmware from the DoC.

Note: The jumer trick does not work on the mb I have. If a DoC is 
installed in the socket without a address selection jumper then the system 
hangs dead during POST.

Regards
Henrik
