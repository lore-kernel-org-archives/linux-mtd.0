Received: from longford.logfs.org ([213.229.74.203])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6ltf-0005of-EO
 for linux-mtd@lists.infradead.org; Tue, 06 Aug 2013 18:22:16 +0000
Date: Tue, 6 Aug 2013 12:49:13 -0400
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jussi Kivilinna <jussi.kivilinna@iki.fi>
Subject: Re: [PATCH] alauda: do not use stack for URB transfer_buffers
Message-ID: <20130806164913.GD10535@logfs.org>
References: <20130806120329.8864.36301.stgit@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20130806120329.8864.36301.stgit@localhost6.localdomain6>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-usb@vger.kernel.org,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 6 August 2013 15:03:29 +0300, Jussi Kivilinna wrote:
> 
> Patch fixes alauda not to use stack as URB transfer_buffer. URB buffers need to
> be DMA-able, which stack is not.
> 
> Patch is only compile tested.

I have tested the driver back when I wrote it.  Not sure why it worked
then, maybe the chip in my notebook back then didn't care about
alignment or I just got lucky with the memory allocations.

My old test hardware was likely thrown out in the last move, about two
years back.  Performance sucked anyway, 400kB/s was the limit.  Maybe
we should just remove the driver and not spend any more time on it?

Jörn

--
Victory in war is not repetitious.
-- Sun Tzu
