Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14QZzX-0002L8-00
	for mtd-list@infradead.org; Wed, 07 Feb 2001 19:10:59 +0000
From: dr john halewood <john@frumious.unidec.co.uk>
To: David Woodhouse <dwmw2@infradead.org>, Ruslan Satlykov <ruslan@mik.ru>
Subject: Re: M-Sys's driver and public driver
Date: Wed, 7 Feb 2001 19:10:26 +0000
Content-Type: text/plain;
  charset="us-ascii"
Cc: mtd@infradead.org
References: <13874.010207@mik.ru> <8344.981531778@redhat.com> <18419.981568867@redhat.com>
In-Reply-To: <18419.981568867@redhat.com>
MIME-Version: 1.0
Message-Id: <0102071910260M.29605@frumious.unidec.co.uk>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Wednesday 07 February 2001 18:01, David Woodhouse wrote:
> Drop the contents of the kernel/ directory over the top of your kernel's
> drivers/mtd directory. Likewise the include/linux/mtd directory.

...and jffs.h and cjffs.h into include/linux, although you might be able to 
get away with it if you're not using jffs.

cheers
john


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
