Received: from mail.free-electrons.com ([88.190.12.23])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QUhSt-0000fF-As
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 15:48:13 +0000
Message-ID: <4DF0EBE1.9000903@free-electrons.com>
Date: Thu, 09 Jun 2011 17:50:57 +0200
From: David Wagner <david.wagner@free-electrons.com>
MIME-Version: 1.0
To: Gilles <gilles.ganault@free.fr>
Subject: Re: [Ubiattach] "vtbl_check: too large reserved_pebs"
References: <mv61v65qqumjmnr9dkejjacgg4id8srbe7@4ax.com>	<4DF0B36E.2020605@free-electrons.com>	<7.0.1.0.2.20110609135430.06967d28@free.fr>	<4DF0BFA0.4030402@free-electrons.com>
	<e2p1v6tlj2gka1lq4q2bd0mk5al776ivms@4ax.com>
In-Reply-To: <e2p1v6tlj2gka1lq4q2bd0mk5al776ivms@4ax.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> Oops, sorry, the formula is
>> ((Subpage_size + Page_size)) / Page_size) * Page_size
>> That is, subpage+page truncated to page.
> 
> Thanks, but I must have misunderstood the formula, as I find the same
> number:
> 
> PEB_size - ((Subpage_size + Page_size)) / Page_size) * Page_size =
> LEB_size
> 
> 131.072 - ((512 + 2048 ) / 2048) * 2048) = 128.512

I should have mentionned that every sub-result has to be considered an
integer, here, sorry.
512+2048 = 2560
2560 / 2048 = 1 // That's where it is important that the result be
                // an integer.
1 * 2048 = 2048
131072 - 2048 = 129024

Regards,
-- 
David Wagner, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
