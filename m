Subject: Re: flushing buffer cache on mtd device: is the verify in flashcp
	actually reading back from the flash chip or the cache?
From: David Woodhouse <dwmw2@infradead.org>
To: Clem Taylor <clem.taylor@gmail.com>
In-Reply-To: <ecb4efd10610161302t5dafcfcfnb70ad31a2b9abe02@mail.gmail.com>
References: <ecb4efd10610161302t5dafcfcfnb70ad31a2b9abe02@mail.gmail.com>
Content-Type: text/plain
Date: Wed, 25 Oct 2006 15:41:18 +0300
Message-Id: <1161780078.27622.96.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-10-16 at 16:02 -0400, Clem Taylor wrote:
> 
> Recently a question came up as to where we were really verifying that
> the data was correctly being written to the flash. We are using
> flashcp from a 2006.05.04 mtd snapshot to program the flash. Looking
> at the code, after the write, it just does a lseek() back to the
> beginning of the device and then starts reading. It is opening the
> device with O_SYNC, but I thought that only effects writes, not reads.

s/effect/affect/

> Without doing something special, wouldn't this data just come from the
> buffer cache instead of the physical device?
> 
> Is there something else doing on under the hood that would force a
> read from physical device after a flash write? 

Access to character devices doesn't go through the buffer cache.

-- 
dwmw2
