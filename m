Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UBQXU-0001Af-RD
 for linux-mtd@lists.infradead.org; Fri, 01 Mar 2013 14:02:21 +0000
Message-ID: <5130B4E9.5050700@parrot.com>
Date: Fri, 1 Mar 2013 15:02:17 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Paul Walmsley <paul@pwsan.com>
Subject: Re: [PATCH 1/3] mtd nand : onfi need to be probed in 8 bits mode
References: <1352199105-30215-1-git-send-email-matthieu.castet@parrot.com>
 <1354530053.30168.183.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1212240023100.17282@utopia.booyaka.com>
 <50E40336.2080008@parrot.com>
 <alpine.DEB.2.00.1301031704460.8721@utopia.booyaka.com>
 <50F6B904.5000600@parrot.com>
 <alpine.DEB.2.00.1301161713380.32170@utopia.booyaka.com>
 <alpine.DEB.2.00.1301220226530.25789@utopia.booyaka.com>
 <alpine.DEB.2.00.1302062321080.12769@utopia.booyaka.com>
 <5113783B.6010806@parrot.com>
In-Reply-To: <5113783B.6010806@parrot.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: Afzal Mohammed <afzal@ti.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Matthieu CASTET a écrit :
> Hi Paul,
> 
> Paul Walmsley a écrit :
>> Hi Matthieu,
>>
>> On Tue, 22 Jan 2013, Paul Walmsley wrote:
>>
>>> Any progress on updating and resending your "omap3 nand : use 
>>> NAND_BUSWIDTH_AUTO" patch?  We're in danger of missing the 3.9 merge 
>>> window if it takes too much longer.
>> Could you let us know if you're planning to update and repost this one?
>>
> Sorry for the delay I attached an updated version of the patch.
> 
> I was not able to test it : with mtd tree and my configuration I have to apply
> https://patchwork.kernel.org/patch/1810441/
> https://patchwork.kernel.org/patch/1884341/
> http://comments.gmane.org/gmane.linux.ports.arm.omap/91096
> 
> in order the kernel build.
> 
> And after that the kernel doesn't seem to boot on my beagle board. Could you
> test the patch ?
> 
> 
> I have also a problem : how should I change nand bus size. It is done by
> "gpmc_cs_configure(info->gpmc_cs, GPMC_CONFIG_DEV_SIZE, ...);", but now gpmc.h
> header is not public anymore.
> 
> I have to do a '#include "../gpmc.h"'.
> 
> 
Any news on this ?


Matthieu
