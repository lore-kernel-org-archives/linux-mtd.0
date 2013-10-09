Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTpQB-0003mR-FR
 for linux-mtd@lists.infradead.org; Wed, 09 Oct 2013 08:47:08 +0000
Date: Wed, 9 Oct 2013 10:46:40 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Wolfgang Denk <wd@denx.de>
Subject: Re: Grow UBI device?
In-Reply-To: <20131008192846.A25E7380A65@gemini.denx.de>
Message-ID: <alpine.DEB.2.00.1310091038110.28562@lnxricardw.se.axis.com>
References: <20131008192846.A25E7380A65@gemini.denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"; format=flowed
Content-Transfer-Encoding: 8BIT
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 8 Oct 2013, Wolfgang Denk wrote:

> Hi,
>
> I'm looking for a clever way to migrate devices (in the field) from
> JFFS2 to UBI/UBIFS.  In the end result, I want to have single UBI
> device (which covers the whole NAND chip) with several volumes used
> with UBIFS.  Unfortunately I must keep some of the existing data.
>
> It would be nice if I could start with a UBI device that is smaller
> than the NAND, so I can keep an existing MTD partition with a JFFS2
> file system. After copying the data from JFFS2 to a UBIFS volume, I
> would like to free and reuse the space of this JFFS2 partition.
>
> Is there a way to "grow" the existing UBI device so that it now also 
> covers the rest of the NAND chip?  Or is my only option to create a 
> second UBI device?

UBI devices are 'attached' to existing mtd partitions. So to grow a UBI 
device, you need to detach it from the partition, re-partition the flash 
(and I'm not sure if this step is even possible as it involves 
unregistering existing mtd partitions), then attach a UBI device to the a 
new partition.

Come to think of it, I'm not sure that would work anyway, as the 
resulting, new, enlarged partition would partly contain UBI data and 
partly old jffs2 data. I'm not sure what UBI does when it encounters 
incorrect data, if it just erases the relevant blocks and formats them for 
its own use, or if it barfs completely and just bails out complaining that 
the partition does not contain UBI data. If the relevant blocks were 
erased, then I think UBI would simply concede that the a previous erase 
attempt had been prematurely aborted, and re-erase the blocks and write 
its headers, so perhaps that is something to try. At any rate it involves 
at least some mild trickery (erase the blocks that previously contained 
jffs2 data).

It's probably easier to create a new UBI device by attaching it to the 
partition previously used by jffs2, after erasing it, but multiple UBI 
devices across a flash partly defeats the purpose of wear-leveling which 
UBI provides.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
