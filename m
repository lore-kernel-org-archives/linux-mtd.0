Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OpypZ-0005Pd-Eg
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2010 07:31:02 +0000
Received: by gwb10 with SMTP id 10so2331299gwb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Aug 2010 00:31:00 -0700 (PDT)
Subject: Re: wiping a UBIFS volume
From: Artem Bityutskiy <dedekind1@gmail.com>
To: twebb <taliaferro62@gmail.com>
In-Reply-To: <AANLkTim32XFn_Dsk8NdLwTX1aXwdjN4UVQA1xhWvLJLQ@mail.gmail.com>
References: <AANLkTim32XFn_Dsk8NdLwTX1aXwdjN4UVQA1xhWvLJLQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 Aug 2010 10:30:54 +0300
Message-ID: <1283153454.12995.2.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-08-11 at 12:45 -0400, twebb wrote:
> I'm trying to delete everything in a UBIFS volume and leave as little
> as possible behind to prevent any malicious use of "deleted" files.
> Is there any significant difference between simply removing all the
> files on a UBIFS volume versus using "upiupdatevol /dev/ubi0_0 -t"?
> Is there a preferred way to accomplish this for a UBIFS volume?

When you delete files in UBIFS, this does not guarantee you that all
nodes belonging to these files are erased. They may still live on the
flash for long time, until garbage-collected.

Wiping out the volume guarantees that all data belonging to whole volume
(and thus, all UBIFS data) is erased, or at least scheduled for erasure.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
