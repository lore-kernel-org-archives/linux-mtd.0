Received: from tidos.tid.es ([193.145.240.2] helo=tid.tid.es)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15iyBc-00070T-00
	for <linux-mtd@lists.infradead.org>; Mon, 17 Sep 2001 14:11:50 +0100
Message-ID: <3BA5F773.4010105@tid.es>
Date: Mon, 17 Sep 2001 15:15:31 +0200
From: Jose =?ISO-8859-1?Q?Rodr=EDguez?= Argente <jradc@tid.es>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd@lists.infradead.org
Subject: Re: Flash writings limit?
References: <3BA5F4EC.2060909@tid.es> <10490.1000732286@redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

David Woodhouse wrote:

> 
> jradc@tid.es said:
> 
>>     Is it harmful to the flash memory if the whole filesystem tree in
>> linux is intalled on flash (including /tmp /var and other directories
>> with a high rate of writing operations) ? I have Strata Flash with
>> JFFS2  installed.
> 
> 
> It depends how much you actually write to those directories, but yes - it's 
> advisable to put them elsewhere. The iPAQ uses ramfs for /tmp and some of 
> the subdirectories of /var - that seems like a sensible plan.
> 
> --
> dwmw2
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
Thanks a lot. How do you set this ram partitions at boot time? I am 
considering two options:

1) Have a compressed image in flash and load it with a loader in RAM
2) Execute a script in init to set the ramdisks partitions

   Which one do you think is best?

   Thanks a lot again
