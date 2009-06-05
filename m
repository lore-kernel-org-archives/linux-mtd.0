Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MCcFR-00083c-E9
	for linux-mtd@lists.infradead.org; Fri, 05 Jun 2009 16:26:35 +0000
Subject: Re: about ubifs
From: Artem Bityutskiy <dedekind@infradead.org>
To: tommy <jiujin.hong@mid-fun.com>
In-Reply-To: <1244204035.18630.0.camel@tommy-desktop>
References: <1244204035.18630.0.camel@tommy-desktop>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 05 Jun 2009 19:26:14 +0300
Message-Id: <1244219174.5847.305.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Fri, 2009-06-05 at 20:13 +0800, tommy wrote:
> Artem,
> What i do is just open an existing file in a UBIFS formated UBI volume
> on a Nand Flash,
> 
> add a few lines to it ,close the file ,then without unmounting the
> filesystem and reboot the filesystem.

> When my board reboots and i looked at that file ,it's zero length and
> has no contents.I suspect it's because
> 
> UBIFS does less frequent syncs .it just lost content of the file because
> there's no sync before the reboot!
> 
> How can i solve this ?

I've realized that the best way to answer your question is to
write a FAQ entry. There is a short answer for your question -
use fsync(). And there is a long answer, which you will find here:

http://www.linux-mtd.infradead.org/faq/ubifs.html#L_empty_file
and the above link also refers this one:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_sync_exceptions
which I've also created for you.

Enjoy!

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
