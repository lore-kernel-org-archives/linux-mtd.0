Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14xOrV-00020R-00
	for <linux-mtd@lists.infradead.org>; Wed, 09 May 2001 08:58:23 +0100
Received: from adsl-gte-la-216-86-194-70.mminternet.com ([216.86.194.70] helo=db.wireless.net)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14xOin-0000KW-00
	for linux-mtd@lists.infradead.org; Wed, 09 May 2001 08:49:22 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Devin Butterfield <dbutter@wireless.net>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [iPAQ] Sleep/resume problems, etc.
Date: Wed, 9 May 2001 00:50:46 -0700
Cc: ipaq@handhelds.org, linux-mtd@lists.infradead.org
References: <01050718392500.02834@dbm.wireless.net> <3428.989306452@redhat.com>
In-Reply-To: <3428.989306452@redhat.com>
MIME-Version: 1.0
Message-Id: <01050900504600.05074@dbm.wireless.net>
Content-Transfer-Encoding: 8bit
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

> The power cycle has reset the flash chip into read mode. The driver still
> thinks it's in status mode.
>
> The chip driver's resume function needs to make sure the chip is in a known
> state, rather than assuming it'll still be in the same state it was before
> the sleep.
>
> I'm sure I'd done this before.
>
> diff -u -r1.72 cfi_cmdset_0001.c
> --- cfi_cmdset_0001.c	2001/03/26 13:51:15	1.72
> +++ cfi_cmdset_0001.c	2001/05/08 07:19:12
> @@ -1582,7 +1582,9 @@
>  		spin_lock_bh(chip->mutex);
>
>  		if (chip->state == FL_PM_SUSPENDED) {
> -			chip->state = chip->oldstate;
> +			/* We need to force it back to a known state. */
> +			cfi_write(map, CMD(0xff), cmd_addr);
						  ^^^^^^^^
What should cmd_addr be here? It's not defined.
--
Regards, Devin.
