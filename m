Received: from mail-bw0-f11.google.com ([209.85.218.11])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LMtzQ-0002xc-UT
	for linux-mtd@lists.infradead.org; Wed, 14 Jan 2009 00:52:15 +0000
Received: by bwz4 with SMTP id 4so52889bwz.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 13 Jan 2009 16:52:10 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <8b67d60901131318g43ede8e0ha88982d2f2be837c@mail.gmail.com>
References: <8b67d60901121401o752dd888m70d3e2bcaffc170d@mail.gmail.com>
	<8b67d60901131318g43ede8e0ha88982d2f2be837c@mail.gmail.com>
Date: Wed, 14 Jan 2009 00:52:10 +0000
Message-ID: <8b67d60901131652g6ebd3089hbf71a510f2625aa7@mail.gmail.com>
Subject: Re: Hot unplugging a device in the middle of a read
From: Adrian McMenamin <lkmladrian@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Adrian McMenamin <adrian@newgolddream.dyndns.info>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2009/1/13 Adrian McMenamin <lkmladrian@gmail.com>:
> 2009/1/12 Adrian McMenamin <lkmladrian@gmail.com>:
>> I am working on a map driver for the virtual memory unit (VMU) flash
>
>> [  184.277538] Removing MTD device #0 (vmu1.1.0) with use count 1
>
> Having looked through the sources I can see that this is indicating
> there is an additional user in play - because when I pull the VMU out
> when not in the middle of the initial reads I don't get this message
> (as use count is obviously 0) even though the code path is the same.
>
> Can I just put in an extra 'put'? Or is there some other way of doing this?
>

For the sake of completeness for those searching on google - I wrote a
function that checks if the usecount > 0, if it is, then I just have
to live with the block read errors but I don't crash the system
because I don't delete the mtd_info
