Received: from tulikuusama.dnainternet.net ([83.102.40.132])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6wea-0004KW-Am
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2013 05:51:25 +0000
Message-ID: <5201E03D.30306@iki.fi>
Date: Wed, 07 Aug 2013 08:50:53 +0300
From: Jussi Kivilinna <jussi.kivilinna@iki.fi>
MIME-Version: 1.0
To: =?UTF-8?B?SsO2cm4gRW5nZWw=?= <joern@logfs.org>
Subject: Re: [PATCH] alauda: do not use stack for URB transfer_buffers
References: <20130806120329.8864.36301.stgit@localhost6.localdomain6>
 <20130806164913.GD10535@logfs.org>
In-Reply-To: <20130806164913.GD10535@logfs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 06.08.2013 19:49, Jörn Engel wrote:
> On Tue, 6 August 2013 15:03:29 +0300, Jussi Kivilinna wrote:
>>
>> Patch fixes alauda not to use stack as URB transfer_buffer. URB buffers need to
>> be DMA-able, which stack is not.
>>
>> Patch is only compile tested.
> 
> I have tested the driver back when I wrote it.  Not sure why it worked
> then, maybe the chip in my notebook back then didn't care about
> alignment or I just got lucky with the memory allocations.

You might not see problems with your hardware/architecture.

"Documentation/DMA-API-HOWTO.txt" discusses about "What memory is DMA'able?".

> 
> My old test hardware was likely thrown out in the last move, about two
> years back.  Performance sucked anyway, 400kB/s was the limit.  Maybe
> we should just remove the driver and not spend any more time on it?
> 
> Jörn
> 
> --
> Victory in war is not repetitious.
> -- Sun Tzu
> 
