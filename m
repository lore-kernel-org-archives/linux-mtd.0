Received: from mailserv.intranet.gr ([146.124.14.106])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QNFu-0001Gp-AH
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jun 2003 09:16:22 +0100
Received: from mailserv.intranet.gr (localhost [127.0.0.1])
	by mailserv.intranet.gr (8.11.7/8.11.3) with ESMTP id h5C8JgD16472
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Jun 2003 11:19:42 +0300 (EEST)
Message-ID: <3EE836BE.4030909@intracom.gr>
Date: Thu, 12 Jun 2003 11:15:58 +0300
From: Pantelis Antoniou <panto@intracom.gr>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <3EE6EBA0.3080508@intracom.gr>
	<200306121106.09768.tglx@linutronix.de>
In-Reply-To: <200306121106.09768.tglx@linutronix.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Cram FS on NAND - How to do this?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:

>On Wednesday 11 June 2003 10:43, Pantelis Antoniou wrote:
>
>>Hi
>>
>>I have a requirement to have a compressed read only
>>root filesystem in my board and I've come to the
>>conclussion that the best fit would be CRAMFS if only
>>had any concept of bad blocks.
>>
>
>Why don't you use a JFFS2 partition and mount it read only ?
>Then you have a compressed read only root filesystem.
>All there no hacking required. :)
> 
>
Well JFFS2 is a wonderful filesystem, but it does have it's
detractions.

The main problem with it is the time it spends on mount when
scanning the device; the larger the device, the larger the time.
Also the compression ratio's of CRAMFS are better.

You should use the right tool for the job.

And what's wrong with a little bit of hacking ehh? :-)

Regards

Pantelis
