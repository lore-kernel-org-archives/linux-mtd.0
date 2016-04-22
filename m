Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1atWdm-0005t1-NW
 for linux-mtd@lists.infradead.org; Fri, 22 Apr 2016 08:40:43 +0000
Subject: Re: Encrypted NAND flash over UBI performance bench marking
To: Benson Young <benson6877@gmail.com>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
References: <CABJ+KKvj4VDUvqTnj+dWf8+qzhK5hhvacdx551JbzmUQye4biA@mail.gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <5719E36A.3070601@nod.at>
Date: Fri, 22 Apr 2016 10:40:10 +0200
MIME-Version: 1.0
In-Reply-To: <CABJ+KKvj4VDUvqTnj+dWf8+qzhK5hhvacdx551JbzmUQye4biA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 22.04.2016 um 10:19 schrieb Benson Young:
> Hello Ezequiel and everyone, 
> 
> I was trying full disk encryption using dm-crypt + LUKS on my embedded linux running on unmanaged SLC NAND flash. 
> I have tried Ezequiel's ubiblock patch 
> http://linux-mtd.infradead.narkive.com/YF0XOFxY/block-device-emulation-on-top-of-ubi-volumes-with-read-write-support
> So the way I went about was
> SLC NAND flash -> MTD -> UBI with ubiblock support -> dm-crypt + LUKS -> EXT4 
> and it appeared to work nicely.

Except that your kernel stack consumption is huge and you wear out the NAND.
Also ext4 does not know NAND and will issue a lot of writes and syncs to UBIFS
which has to write on the NAND.
Sure, it is better than using ext4 directly on top of ubiblock but still...

[...]

> My questions:
> 1. Why such a huge difference in speed performance? (especially write) Shouldn't EXT4 over UBI be faster than EXT4 over loopbacked file in UBIFS?

UBI is not a FTL. ubiblock write support is everything but perfect.
Also be aware of that fact that it will wear out your NAND very soonish.

> 2. some of the figures are weird, especially read speed where the throughput can reach 100+MB/s, SLC NAND flash's maximum theoretical read speed is around 23MB/s so is this the
> work of CPU cache?

Not sure which ubiblock version you are using but AFACT it does caching.
i.e. it will always read the whole LEB and then keep it in memory.
Maybe Ezequiel can tell more.
Same for loopback (page cache). This would explain the read numbers.

> 3. Is iozone the right tool for bench marking MTD based file systems?

Yes and no. We don't have special tools for that.
As with all benchmark tools you need to know what you do. :-)
Often a plain dd works best.

> In another thread, Richard has mentioned a side project for UBIFS encryption
>> Regarding encryption, encryption for UBIFS is in the pipes, Dave and I did already some preliminary
>> work. It will materialize within this year, depending on how much we get distracted by other projects.
>> So far it is a spare time project. The plan is adding file level encryption like ext4 and f2fs have.
> 
> is that based on Artem's ubifs patch?
> http://lists.infradead.org/pipermail/linux-mtd/2012-April/040659.html
> or its something else entirely?

It is something differently. The plan was to do it like f2fs and ext4 do.
I hope it will materialize soon. I got (again *sigh*) interrupted by other projects.

Thanks,
//richard
