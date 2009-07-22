Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MTVYW-0003Ge-WF
	for linux-mtd@lists.infradead.org; Wed, 22 Jul 2009 06:44:06 +0000
Message-ID: <4A66B547.6020207@nokia.com>
Date: Wed, 22 Jul 2009 09:44:23 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Bosi Daniele <Daniele.Bosi@mta.it>
Subject: Re: UBI FS mounting time
References: <531B6536C9F737458807DF75064873C8303DD7D768@mta-digimail.MTA.INT>
In-Reply-To: <531B6536C9F737458807DF75064873C8303DD7D768@mta-digimail.MTA.INT>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bosi Daniele wrote:
> We have a UBI+UBIFS 1GB partition on a NAND chip, which takes around 6s to mount.
> 
> We'd like to have the data available at least read-only earlier than that.
> 
> We know UBI on principle needs to read the map of all blocks in order to rebuild the logical view of the memory, but maybe there's another way around it to make it available earlier...
> 
> Someone know how?

Some options are:


a) Use another smaller partition that can mount first and provide some functionality while the larger partition mounts.
b) Reduce the number of eraseblocks by combining them into larger logical blocks.
c) Change UBI to write its mapping table when it is unloaded, so it can be read quickly when loading (still have to scan if UBI was not unloaded cleanly).
