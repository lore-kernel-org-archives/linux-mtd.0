Received: from 209-184-180-125.faxtell.net ([209.184.180.125] helo=eventlog.faxtell.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14zJNt-0006Vy-00
	for <linux-mtd@lists.infradead.org>; Mon, 14 May 2001 15:31:41 +0100
Message-ID: <003b01c0dc83$4f6ace00$88b4b8d1@ShuhIII>
Reply-To: "Shuh C. Chang" <schang@3inet.com>
From: schang@3inet.com (Shuh C Chang)
To: "Felix Radensky" <felix@allot.com>,
	"Linux-mtd" <linux-mtd@lists.infradead.org>
References: <3AFFE80B.DCE1B139@allot.com>
Subject: Re: DOC problems on PowerPC
Date: Mon, 14 May 2001 09:36:49 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

> All I had to do is to run "eraseall /dev/mtd0",

Is "eraseall" equivalent to the DOS utility "docpmap /e" in functionality?
Anyone who can shed some light?

Shuh Chang


----- Original Message -----
From: "Felix Radensky" <felix@allot.com>
To: "Linux-mtd" <linux-mtd@lists.infradead.org>
Sent: Monday, May 14, 2001 9:13 AM
Subject: DOC problems on PowerPC


> Hi, all
>
> I was able to solve the DOC problems on PowerPC I've reported yesterday.
>
> All I had to do is to run "eraseall /dev/mtd0", then run "nftl_format
> /dev/mtd0"
> and  then create partitions with fdisk.
>
> Can someone please explain me the difference between eraseall and
> nftl_format.
> HOWTO says nothing about it.
>
> By the way, the latest mtd code would not compile, at least on my 2.4.2
> kernel
> unless you add #include <linux/kmod.h> to chipreg.c.  This is because of
>
> a call to request_module() in do_map_probe(), which IMHO should be
> under #ifdef CONFIG_KMOD, and not #ifdef CONFIG_MODULES.
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
