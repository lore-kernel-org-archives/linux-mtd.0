Received: from mailfe11.swip.net ([212.247.155.65] helo=swip.net)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Ksxwh-00040S-II
	for linux-mtd@lists.infradead.org; Thu, 23 Oct 2008 11:01:39 +0000
Received: from [89.233.213.76] (account mj456263@tele2.se HELO
	dhcp93.backing.se) by mailfe11.swip.net (CommuniGate Pro SMTP 5.2.6)
	with ESMTPA id 952147347 for linux-mtd@lists.infradead.org;
	Thu, 23 Oct 2008 13:01:35 +0200
Message-Id: <57F37BFC-A8EE-485B-BB15-63C5A31DED24@contactor.se>
From: Olof Backing <olof.backing@contactor.se>
To: linux-mtd@lists.infradead.org
In-Reply-To: <B7803DC652E2F9458758AEBB6A5FD60F03361F81@ZMY16EXM67.ds.mot.com>
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v929.2)
Subject: Re: Spansion password protection issue
Date: Thu, 23 Oct 2008 13:01:35 +0200
References: <B7803DC652E2F9458758AEBB6A5FD60F03361F81@ZMY16EXM67.ds.mot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 23 okt 2008, at 12.36, KRISHNAN SUDHAKAR-NRD743 wrote:

> My self working for password protection of the OTP area in spansion  
> flash.
>
> I like to know is there any utility or document available to use as  
> a utility in Linux.

No utility that I'm aware of. But you will find full documentation for  
the chip at Spansion.

> Also I like to know whether this mode is already present in the MTD  
> or do we need to edit the MTD code in Linux kernel.


No, couldn't find any traces of that support in the MTD.

/Olof
-- 
Olof Backing
CAG Contactor AB                              Office: +46 (0)8 752 81 00
Finlandsgatan 14                             Mobile: +46 (0)70 995 98 99
SE-164 74  KISTA                                 Fax: +46 (0)8 752 05 30
