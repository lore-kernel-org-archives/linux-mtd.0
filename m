Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17sQ7u-0007tL-00
	for <linux-mtd@lists.infradead.org>; Fri, 20 Sep 2002 16:55:30 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <DFEAJMIABOLKNEBOPGDHOEDLCBAA.jlu@rdmcorp.com> 
References: <DFEAJMIABOLKNEBOPGDHOEDLCBAA.jlu@rdmcorp.com> 
To: "Jack Lu" <jlu@rdmcorp.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: about jffs2's compression and cfi->fast_prog being turn off 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 20 Sep 2002 16:55:26 +0100
Message-ID: <22326.1032537326@redhat.com>
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

jlu@rdmcorp.com said:
>  1. With this latest jffs2, can we turn  off the compression? If can ,
> how can we turn it? 

Not implemented yet. Send patch -- it's quite simple :)

>  2. If we still use the jffs2 compression after we compress the image
> using CCITT4 Group algorithm, could it help us to reduce  the size to
> store the compressed image into the flash memory? 

It's unlikely that further compression will have any useful effect. You 
could try telling it to attempt only 'rtime' compression, but just telling 
it not to compress the file(s) in question would be best.

>  3. With the latest jffs2, the erase suspend is implemented for AMD
> CFI chips, such as Am29Lv320MB? 

JFFS2 knows nothing of such things. The current cfi_cmdset_0002 code does 
not support erase suspend. I've never had hardware I can test on, and 
nobody's submitted a patch known to be working. Again, fairly simple to 
implement this yourself.

> Turnning off the cfi->fast_prog will affect the the time needed to
> program the flahsh?

It shouldn't make a lot of difference.


--
dwmw2
