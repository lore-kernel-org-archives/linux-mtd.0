Received: from hex.linuxgrrls.org ([212.18.228.73] ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 173KSD-0003sD-00
	for <linux-mtd@lists.infradead.org>; Thu, 02 May 2002 18:33:17 +0100
Date: Thu, 2 May 2002 18:33:15 +0100
Subject: Re: Booting from DOC2000 with GRUB loader
Content-Type: text/plain; charset=US-ASCII; format=flowed
Mime-Version: 1.0 (Apple Message framework v481)
Cc: linux-mtd@lists.infradead.org
To: Ilguiz Latypov <ilatypov@superbt.com>
From: Jasmine Strong <jasmine@regolith.co.uk>
In-Reply-To: <Pine.LNX.4.44.0205021157100.10381-100000@server.superbt.com>
Message-Id: <AEF6BCEC-5DF2-11D6-B6D6-000502893FA1@regolith.co.uk>
Content-Transfer-Encoding: 7bit
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

On Thursday, May 2, 2002, at 05:09 PM, Ilguiz Latypov wrote:
> I am dumber when it comes to the bad block table issue.  My guess is 
> that
> nftl_format marks bad erase sectors in the NFTL bad block table.

It's supposed to but David wasn't sure whether this code worked properly.
Regardless of that, the blocks have their good/bad status marked in the
OOB area and nftl_format, while it doesn't necessarily handle it 
correctly,
certainly doesn't destroy that data.

>   No way
> GRUB itself is aware of any bad sectors in its own area.

If that area was bad, the chip would most likely be unusable-  the IPL
code isn't smart enough to take notice of such things, so any chips that
had badness in the first 48k or so would have failed M-Systems factory
QC.

Jas.
