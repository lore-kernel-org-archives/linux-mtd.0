Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16YSHr-0000Ha-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Feb 2002 13:38:59 +0000
Subject: Re: chip drivers
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <8523.1012575879@redhat.com>
References: <1012574966.21595.10.camel@pcjonashg>
	<1012571237.21594.8.camel@pcjonashg> <1012561603.21481.4.camel@pcjonashg>
	<29597.1012570470@redhat.com> <31144.1012571348@redhat.com>  
	<8523.1012575879@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 06 Feb 2002 14:49:42 +0100
Message-Id: <1013003382.14724.2.camel@pcjonashg>
Mime-Version: 1.0
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

> > 0x00000000 - 0x003FFFFF 4MiB CFI chip
> > 0x00400000 - 0x005FFFFF 2MiB jedec only chip
> > 0x00600000 - 0x009FFFFF 4MiB CFI chip
> 
> You'd need three maps, three probe calls. Although I suppose you could have 
> a single map driver for the first and last chips where the access calls do 
> something like:
> 	return *(volatile __u32 *) (addr + (addr>0x400000?0x200000:0));
> 
> You probably don't want that though. Register them as three separate chips 
> and then use the partition code that's been fixed to let you combine ranges 
> of separate devices into one 'partition' rather than just split devices up.

Can you explain that a bit further? I can't figure out how use
add_mtd_partitions (current CVS) when I want to make a partition that
starts in one map and ends in another. Since the map is an argument to
app_mtd_partitions I must make two calls to add_mtd_partitions, right?
But how do I make add_mtd_partitions merge the start of the device (in
the endo of the first map) with the end of the device (in the beginning
of the other map)?

/Jonas
