Received: from smtp6-v.fe.bosch.de ([2a03:cc00:ff0:100::2])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uui3f-0005dC-Ug
 for linux-mtd@lists.infradead.org; Thu, 04 Jul 2013 11:50:46 +0000
Message-ID: <51D56173.1030402@de.bosch.com>
Date: Thu, 4 Jul 2013 13:50:11 +0200
From: Dirk Behme <dirk.behme@de.bosch.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: [PATCH] UBIFS: add tolerance to use variable writesize
References: <1368634865-4186-1-git-send-email-dirk.behme@gmail.com>
 <1372665309.22014.40.camel@sauron.fi.intel.com>
 <F460390DA2C115469AFACD3583F41985032D2702E7@SI-MBX07.de.bosch.com>
 <1372671198.22014.58.camel@sauron.fi.intel.com>
In-Reply-To: <1372671198.22014.58.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Dirk Behme <dirk.behme@gmail.com>,
 "Dahlhoff Achim \(CM-AI/PJ-CF32\)" <Achim.Dahlhoff@de.bosch.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01.07.2013 11:33, Artem Bityutskiy wrote:
> On Mon, 2013-07-01 at 10:32 +0200, Dahlhoff Achim (CM-AI/PJ-CF32) wrote:
>> Hello.
>>
>> No, I do not want to touch the max_write_size or writebufsize. The
>> max_write_size is the size which can be transferred in one piece to
>> the chip and does not modify the UBIfs data structures.
>
> Not sure I understand what you mean. Max_write_size, which is the same
> as writebufsize, despite the name, is the _optimal_ I/O size. Sometimes
> UBI/UBIFS _will_ write in smaller chunks. But it will try to write in
> 'max_write_size'.
>
> Sounds like what you need - you flash does allow 1-byte writes, but will
> be more efficient when writes are 32-bytes instead.
>
>> The min size is relevant and can cause images to become incompatible
>> with a specific NOR chip. If the NOR driver should accidentally choose
>> a writesize which is too small, this will not cause any compatibility
>> issues or data loss. It will only reduce write performance.
>
> Right, increasing min_io_size breaks compatibility. Although I believe
> this is fixable, and I already suggested people to fix this several
> times in the past.
>
> But increasing max_write_size should not lead to incompatibilites.
>>
>> Without the tolerance patch, you cannot mount one UBSfs image on
>> different NOR devices with different writesize values of 1 or 32.
>
> I still think that you should just change writebufsize in your driver.
> May be you could find some other view-angle to show my why you think I
> am wrong?

I'm no expert on this, but let me try to explain what I've understood 
from Achim:

We are talking about UBIFS images which are created on the PC 
("mkfs.ubifs" and "ubinize") and then written to real physical NOR 
devices on the target hardware.

Different NOR devices can have different writesize values of 1, 8 or 32. 
On the target, this is reported from the physical NOR chip and used 
there for the UBIFS image. But, if the UBIFS image is created on the PC, 
the PC tools take the writesize as a parameter (--min-io-size) due to 
the unknown hardware device. This writesize is recorded in the UBIFS 
created on the PC, e.g. writesize == 1.

Now, this UBIFS image created on the PC should be written on the target 
to a real physical NOR device. This reports e.g. a writesize == 32. 
While writing the UBIFS image to the NOR device works, mounting it 
fails. Due to the mismatch in the writesize: The UBIFS image has recored 
1, while the physical NOR device reports 32.

As technically there is no reason why this shouldn't work, the patch we 
are discussing here tries to fix that.

I hope above is roughly correct ;)

Best regards

Dirk
