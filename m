Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OtlHG-0000wt-Je
	for linux-mtd@lists.infradead.org; Thu, 09 Sep 2010 17:51:15 +0000
Received: by bwz13 with SMTP id 13so1774221bwz.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Sep 2010 10:51:13 -0700 (PDT)
Subject: Re: UBI/UBIFS interrupted write page handling
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <4C88DDD5.4060507@parrot.com>
References: <4C88DDD5.4060507@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 09 Sep 2010 20:51:09 +0300
Message-ID: <1284054669.11335.21.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-09-09 at 15:15 +0200, Matthieu CASTET wrote:
> Hi,
> 
> we have nands where interrupted write page become unstable and can't be 
> trusted.
> 
> All interrupted write page should be erased before further usage. This 
> mean we should have an algorithm to identify them when mounting/scanning.
> 
> If we are writing PageX and it is interrupt by power cut. On reboot we 
> could have the following case :
> 1) PageX empty. But we don't know if write process started and the page 
> can't be written again

So this page may be unstable and we should not really write there,
AFAIU. But UBIFS will, which is a problem. However, should be easily
fixable, se below.

> 2) PageX contains invalid data (bad crc, ecc).

I think UBIFS ignores ECC errors completely. When replying the journal,
if it gets an ECC error, it ignores it and checks the nodes in the read
buffer. Those which have correct CRC are used, those which have
incorrect ECC are dropped.

Obviously, UBIFS does not write anymore to this page. But it uses the
next page.

This is also a problem because if the page which had ECC errors is
unstable, some nodes which were OK may not be OK later.

Should be easily fixable as well.

> 3) PageX contains valid data, but we don't know if the write finish and 
> if the page is stable.

UBIFS always knows whether it was unmounted cleanly or not. But we are
considering the case when it was not cleanly unmounted. So yes, this is
a problem as well.

> How ubi/ubifs detect this interrupt write pages ?

You are right, currently UBIFS is vulnerable to the unstable pages
issue.

> Only case 2 seems handled and it is not enough.

I think none are properly handled actually :-)

> On one of our test, we are in case 3. Ubifs find a valid interrupt page 
> on mount and trust it. Latter the page become corrupted [1] because it 
> is unstable.

OK, I see.

> To identify a interrupted write page we :
> - could use interrupted flags for static volume
> - handle with care data move (copy flags) : if sqnum of the copy is the 
> biggest, we should ignore it/copy it.
> - use upper layer for dynamic volume. For ubifs this could be a journal.

Actually, for UBIFS things are rather simple. In UBIFS every writes go
to the journal. Even GC writes to the journal. So when we are mounting
after an unclean reboot, we can simply refresh the last LEBs of all
journal heads using the 'ubi_leb_change()' call. This should handle all
the three cases you describe.

I do not think it is very difficult to do.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
