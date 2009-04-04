Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lq7kt-00075c-6t
	for linux-mtd@lists.infradead.org; Sat, 04 Apr 2009 15:26:06 +0000
Subject: Re: How to update UBIFS while running an application ?
From: Artem Bityutskiy <dedekind@infradead.org>
To: Manuel Sahm <Manuel.Sahm@feig.de>
In-Reply-To: <49D622FA.187F.00BC.1@feig.de>
References: <49D622FA.187F.00BC.1@feig.de>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 04 Apr 2009 18:25:45 +0300
Message-Id: <1238858745.15222.19.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
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

I could not chat to you because my client died, sorry.

On Fri, 2009-04-03 at 14:53 +0200, Manuel Sahm wrote:
> Hello,
>  
> I have 3 UBIFS mounted - one is the RFS, another one is mounted in
> /mnt/ubi1/ and the last one is mounted in /mnt/ubi2/
> My main application is in /mnt/ubi1/ and is running.
>  
> How could I update the actual ubifs ubi0_0, ubi1_0 and ubi2_0 ?
>  
> I tried ist with 
> 1.) flash_eraseall
> 2.) nandwrite
> ---> This doesn´t work -> after restart I got errors -> RFS is damaged
> and doesn´t boot anymore
>  
> another try:
> 1.) ubiupdatevol
> -----> the problem - this program doesn´t work if the ubifs is mounted
> - but I can´t unmount /mnt/ubi1 or /mnt/ubi2 or the RFS because there
> are applications running.

I'm not sure what exactly you ask, but you cannot update UBIFS
file system while it is mounted. You have to unmount it first.
Does any file-system allows this at all?

Or I misunderstood your questions?

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
