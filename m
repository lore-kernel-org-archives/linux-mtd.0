Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NGWNa-0006cv-5l
	for linux-mtd@lists.infradead.org; Fri, 04 Dec 2009 11:31:23 +0000
Message-ID: <4B18F300.7080006@nokia.com>
Date: Fri, 04 Dec 2009 13:31:12 +0200
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: twebb <taliaferro62@gmail.com>
Subject: Re: ubifs wear leveling across entire device
References: <dbdb2ea60912030931j380a7702hc92d4fbe72341730@mail.gmail.com>
In-Reply-To: <dbdb2ea60912030931j380a7702hc92d4fbe72341730@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

twebb wrote:
> I'm confused about how wear leveling occurs across the entire device
> in the following example.  Could someone help me understand what I'm
> missing?
> 
> 4 GiB flash device (nand MLC):
> 4 MTD partitions defined:
> 0 - "p1" - 0x00000000 - 0x00800000
> 1 - "p2" - 0x00800000 - 0x10000000
> 2 - "p3" - 0x10000000 - 0x80000000
> 3 - "p4" - 0x80000000 - 0x100000000
> 
> kernel args specify 3 ubi volumes:
> ubi.mtd=p1 ubi.mtd=p2 ubi.mtd=p3
> (p4 is reserved and no volumes or filesystems sit on top of it)

That is 3 UBI devices not 3 UBI volumes

> 
> The "vol_size" for each of the ubi volumes (as specified in the
> ubinize cfg file) is slightly less than the corresponding mtd
> partition size.  The volumes are specified as dynamic because they
> need to be RW.
