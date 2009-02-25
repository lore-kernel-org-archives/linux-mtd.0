Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by casper.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LcG9T-00065r-9Y
	for linux-mtd@lists.infradead.org; Wed, 25 Feb 2009 09:34:05 +0000
Subject: Re: query on UBIFS
From: Artem Bityutskiy <dedekind@infradead.org>
To: Chakradhar thota <thota.chakradhar@gmail.com>
In-Reply-To: <8ccea6aa0902240910k6da07085u7e122cb010a99a02@mail.gmail.com>
References: <8ccea6aa0902240910k6da07085u7e122cb010a99a02@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 25 Feb 2009 11:30:28 +0200
Message-Id: <1235554228.25808.24.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-02-24 at 22:40 +0530, Chakradhar thota wrote:
> Hi ,
> 
>   I am in the process of using UBIfs on my embedded device.
>   but i came across that JFFS2 cannot be used as swap partition.
>   what about UBIfs? will UBIfs support swap paritition?
>   what are the various issues to be taken care if it supports?
>   thanks in advance.

Hi, we never kept this use-case in mind.

I do not think it is a brilliant idea to use UBIFS for swap.
First of all - why not UBI? It would be smarter to create a
simple FTL on top of UBI and put swap there.

But you would anyway have to take a look into UBI/mtd and make
sure they do not allocate RAM on their paths. Or if they do,
they should have some RAM reserve to use if the I/O is swapping.
Indeed, if we are swapping because of memory-shortage condition,
we should not allocate RAM.

Off the top of my head, UBI does allocate RAM when doing I/O.
But this can be fixed.

To put it simpler, if you want swapping on NAND, you should invest
time and make SW engineers look at this. You cannot just take
what we have now and start swapping.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
