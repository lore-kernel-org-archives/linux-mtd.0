Received: from smtp.fh-landshut.de ([193.175.141.50])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BGjhI-0004xO-PI
	for linux-mtd@lists.infradead.org; Thu, 22 Apr 2004 20:17:20 +0100
Message-ID: <40881A48.9030704@fh-landshut.de>
Date: Thu, 22 Apr 2004 21:17:28 +0200
From: Oliver Korpilla <okorpil@fh-landshut.de>
MIME-Version: 1.0
To: dkey <dk.dbox2@gmx.net>
References: <4087DC65.7010703@fh-landshut.de>
	<4087EE53.2000608@fh-landshut.de> <200404222109.24118.dk.dbox2@gmx.net>
In-Reply-To: <200404222109.24118.dk.dbox2@gmx.net>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: (interleaved chips) cfi_cmdset_0002 -> Kernel Panic
Reply-To: okorpil@fh-landshut.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

dkey wrote:

>Hello!
>
>Did you tried the last diff for cfi_cmdset_0002.c from the mailinglist?
>
>greets dkey
>
>  
>
No, but I guess I'm trying again with my reverted version (1.93 of the 
cfi_cmdset_0002.c).

I will work on a mapping for my board (was easier when it was 
configurable :) ) and trying out that first, taking the mbx860.c as an 
example.

Guess that was a stupid newbie mistake. :)

Thanks.

Oliver Korpilla
