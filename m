Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Wf4J-0007Cs-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Feb 2002 14:53:35 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1012574966.21595.10.camel@pcjonashg> 
References: <1012574966.21595.10.camel@pcjonashg>  <1012571237.21594.8.camel@pcjonashg> <1012561603.21481.4.camel@pcjonashg> <29597.1012570470@redhat.com> <31144.1012571348@redhat.com> 
To: Jonas Holmberg <jonas.holmberg@axis.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: chip drivers 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 01 Feb 2002 15:04:39 +0000
Message-ID: <8523.1012575879@redhat.com>
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

jonas.holmberg@axis.com said:
>  But how would I be able to detect all chips if I had a configuration
> like this:

> 0x00000000 - 0x003FFFFF 4MiB CFI chip
> 0x00400000 - 0x005FFFFF 2MiB jedec only chip
> 0x00600000 - 0x009FFFFF 4MiB CFI chip

You'd need three maps, three probe calls. Although I suppose you could have 
a single map driver for the first and last chips where the access calls do 
something like:
	return *(volatile __u32 *) (addr + (addr>0x400000?0x200000:0));

You probably don't want that though. Register them as three separate chips 
and then use the partition code that's been fixed to let you combine ranges 
of separate devices into one 'partition' rather than just split devices up.


--
dwmw2
