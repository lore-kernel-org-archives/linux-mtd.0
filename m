Received: from cs2875-45.austin.rr.com ([24.28.75.45] helo=localhost.localdomain)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14wU81-0007Ix-00
	for <linux-mtd@lists.infradead.org>; Sun, 06 May 2001 20:23:37 +0100
Received: from troche.org (IDENT:root@matrix [127.0.0.1])
	by localhost.localdomain (8.11.0/8.11.0) with ESMTP id f46JMi917255
	for <linux-mtd@lists.infradead.org>; Sun, 6 May 2001 14:22:45 -0500
Message-ID: <3AF5A484.C97DD62B@troche.org>
Date: Sun, 06 May 2001 14:22:44 -0500
From: Edmund Troche <edmund@troche.org>
Reply-To: edmund@troche.org
MIME-Version: 1.0
To: MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: Re: Invalid ioctl
References: <NEBBIDMHCLDPHDHEGDMLKEGLCBAA.jasonw@uswo.net> <2086.989061207@redhat.com> <3AF59E89.BAAAEE50@troche.org>
Content-Type: text/plain; charset=us-ascii
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

I have  the same results with a 48MB DoC 2000 also.


Edmund

Edmund Troche wrote:

> I created a 8MB partition (nftla1) on a 8MB DoC 2000, and tried to cp a jffs
> image that was created with mkfs.jffs, and got the following message:
>     Invalid ioctl 5401 (MEMGETINFO = 80204d01)
>     ECC needs a full sector write (adr: 9de00 size 134)
>
> The DiskOnChip is being found @ address 0xD6000 and it correctly detects it as
> 8MB. JFFS and MTD support is compiled in, no modules in this case.
>
> Anyone familiar with what may be the problem? Thanks in advance for any help.
>
> Edmund Troche
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
