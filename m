Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UtaVC-0008GZ-1W
 for linux-mtd@lists.infradead.org; Mon, 01 Jul 2013 09:34:30 +0000
Message-ID: <1372671198.22014.58.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBIFS: add tolerance to use variable writesize
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Dahlhoff Achim (CM-AI/PJ-CF32)" <Achim.Dahlhoff@de.bosch.com>
Date: Mon, 01 Jul 2013 12:33:18 +0300
In-Reply-To: <F460390DA2C115469AFACD3583F41985032D2702E7@SI-MBX07.de.bosch.com>
References: <1368634865-4186-1-git-send-email-dirk.behme@gmail.com>
 <1372665309.22014.40.camel@sauron.fi.intel.com>
 <F460390DA2C115469AFACD3583F41985032D2702E7@SI-MBX07.de.bosch.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Behme Dirk \(CM-AI/PJ-CF32\)" <Dirk.Behme@de.bosch.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Dirk Behme <dirk.behme@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-07-01 at 10:32 +0200, Dahlhoff Achim (CM-AI/PJ-CF32) wrote:
> Hello.
> 
> No, I do not want to touch the max_write_size or writebufsize. The
> max_write_size is the size which can be transferred in one piece to
> the chip and does not modify the UBIfs data structures. 

Not sure I understand what you mean. Max_write_size, which is the same
as writebufsize, despite the name, is the _optimal_ I/O size. Sometimes
UBI/UBIFS _will_ write in smaller chunks. But it will try to write in
'max_write_size'.

Sounds like what you need - you flash does allow 1-byte writes, but will
be more efficient when writes are 32-bytes instead.

> The min size is relevant and can cause images to become incompatible
> with a specific NOR chip. If the NOR driver should accidentally choose
> a writesize which is too small, this will not cause any compatibility
> issues or data loss. It will only reduce write performance.

Right, increasing min_io_size breaks compatibility. Although I believe
this is fixable, and I already suggested people to fix this several
times in the past.

But increasing max_write_size should not lead to incompatibilites.
> 
> Without the tolerance patch, you cannot mount one UBSfs image on
> different NOR devices with different writesize values of 1 or 32.

I still think that you should just change writebufsize in your driver.
May be you could find some other view-angle to show my why you think I
am wrong?

-- 
Best Regards,
Artem Bityutskiy
