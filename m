Received: from mailer.cse.iitd.ac.in ([202.141.68.3]
	helo=desh.cse.iitd.ernet.in)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D3EP5-00009p-Bh
	for linux-mtd@lists.infradead.org; Mon, 21 Feb 2005 09:19:16 -0500
Message-ID: <4219EDC3.1060506@kritikalsolutions.com>
Date: Mon, 21 Feb 2005 19:48:43 +0530
From: Narinder Kumar <narinder@kritikalsolutions.com>
MIME-Version: 1.0
To: dedekind@infradead.org, linux-mtd@lists.infradead.org
References: <4219E20F.80908@kritikalsolutions.com>
	<1108994310.13420.50.camel@sauron.oktetlabs.ru>
In-Reply-To: <1108994310.13420.50.camel@sauron.oktetlabs.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: mkfs.jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi ,

       First of all thanx for the reply . I am using AT45DB642 NAND 
Flash and it seems to have erase block of 0x420 i,e 1056 bytes. and when 
i have created my MTD partitions i have specified the partition sizes to 
be multiple of these eraseblock sizes in 
drivers/at91/mtd/at91_dataflash.c , My 3 partitions are 4*1024*1056  (4 
GB) , 3*1024*1056 (3 GB) and 1*1024*1056 (1 GB)


Artem B. Bityuckiy wrote:

>On Mon, 2005-02-21 at 18:58 +0530, Narinder Kumar wrote:
>  
>
>>mkfs.jffs2 -e 0x420 -d /tmp/Application
>>    
>>
>
>0x420 is strange size. I believe it is wrong, try to look at your Flash
>specification closer. 
>
>
>
>.
>
>  
>
