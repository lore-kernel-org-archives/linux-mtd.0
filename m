Received: from ms01.sssup.it ([193.205.80.99] helo=sssup.it)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GRYcq-0000JU-AU
	for linux-mtd@lists.infradead.org; Sun, 24 Sep 2006 19:22:48 +0100
Message-ID: <4516CC35.5010507@gandalf.sssup.it>
Date: Sun, 24 Sep 2006 20:19:33 +0200
From: Michael Trimarchi <trimarchi@gandalf.sssup.it>
MIME-Version: 1.0
To: "Nikhil Bansal (nikbansa)" <nikbansa@cisco.com>
Subject: Re: MTD Partitions
References: <ED07EE9DB42A8945877C9794BA15040805D582@xmb-sjc-229.amer.cisco.com>
In-Reply-To: <ED07EE9DB42A8945877C9794BA15040805D582@xmb-sjc-229.amer.cisco.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nikhil Bansal (nikbansa) wrote:

>Hi,
>
>>From what I understand you need to provide the partitioning details of
>MTD devices at the compile time. I was wondering if there is any way to
>partition a flash device at runtime based on the sectors. For Example:
>partition 1 from sector 1 to sector 10, partition 2 from sector 11 to
>sector 20. 
>
>The thing is that we have a board with a flash chip on it and
>configuration of this chip may vary based on several factors. I don't
>have the luxury of compiling the kernel for each such requirement :( I
>think I read somewhere that at this point, partitioning can be done at
>compile time only but just wanted to confirm.
>
>By the way, we can keep the number of partitions fixed but size needs to
>be varied. Please let me know if it can be done.
>
>Thanks in advance,
>Nikhil
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>  
>
Hi,
I think that you can use cmdline partition option in the kernel. I use 
it in the IXDP465
Regards Michael
