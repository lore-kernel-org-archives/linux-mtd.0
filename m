Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 177Wuz-00004x-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 May 2002 08:40:21 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020514061754.D12882756@sitemail.everyone.net> 
References: <20020514061754.D12882756@sitemail.everyone.net> 
To: zeusj@firstlinux.net
Cc: all in MTD mailinglist <linux-mtd@lists.infradead.org>
Subject: Re: misc question about MTD 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 14 May 2002 08:40:19 +0100
Message-ID: <23802.1021362019@redhat.com>
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

zeusj@firstlinux.net said:
>  I think its just "assume" , If the Chip A and Chip B got QRY on the
> same location for data ,they will be still regarded as same chip,  and
> that's the "FIXME" in your code means,isnt it:)

Yes.

>    I think before mount the flash should be erased automatically ,but
> when I mount my flash (the mtd0 and mtdblock0 are all ok), I got the
> following message:

Strange. Is the flash completely erased? It should not be erased 
automatically -- too many people attempt to mount the wrong flash 
partition, and if you mount the partition that contains your bootloader you 
will _not_ thank me for auto-erasing it.

I would strongly recommend you use JFFS2, not JFFS. I haven't looked at JFFS
code for ages now, and I don't think anyone else is doing so either.

> I analysed all the case ,but I think that's impossible to enter the
> "else" bracket theoretically  Did I miss something or there is
> something special for the hardware?

Something special for the hardware. If you power cycle a chip while it's 
erasing, you may find that some bits become undefined -- sometimes they'll 
return a '1', other times a '0'. 


--
dwmw2
