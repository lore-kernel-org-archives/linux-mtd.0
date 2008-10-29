Received: from yw-out-1718.google.com ([74.125.46.153])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kv9Ti-0005Xh-2p
	for linux-mtd@lists.infradead.org; Wed, 29 Oct 2008 11:44:46 +0000
Received: by yw-out-1718.google.com with SMTP id 5so1462285ywm.72
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Oct 2008 04:44:44 -0700 (PDT)
Date: Wed, 29 Oct 2008 07:42:56 -0400
From: Josh Boyer <jwboyer@gmail.com>
To: Andre Puschmann <andre.puschmann@imms.de>
Subject: Re: flash read performance
Message-ID: <20081029114256.GA2239@yoda.jdub.homelinux.org>
References: <ge6old$oo3$1@ger.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ge6old$oo3$1@ger.gmane.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 28, 2008 at 11:14:05AM +0100, Andre Puschmann wrote:
>Hi list,
>
>I am currently trying to improve the flash read performance of my 
>platform. It's a gumstix verdex board with a pxa270 running at 400MHz. 
>My flash is a 16MB NOR Intel StrataFlash P30 (128P30T) and it's 
>operating in the _normal_ asynchronous mode. In my opinion the read 
>performance is very poor, only around 1.2 to 1.4 MB/s depending on the 
>blocksize. I think it should be possible to get much higher transfer rates.

Why do you think that?

>In Linux, I ran my tests with dd like this (copy 10MB):
>time dd if=/dev/mtd5 of=/dev/null bs=16k count=640
>640+0 records in
>640+0 records out
>real    0m 7.17s
>user    0m 0.00s
>sys     0m 7.17s
>
>
>Running top in another console brings up, that the CPU load is very high
>during copy. I am not sure if the system is doing some sort of busy 
>waiting or something like that? However, it should be possible to do a 
>copy without having such a high load.

Why do you think that?  The chip drivers don't do DMA, so all I/O goes
through the CPU.

josh
