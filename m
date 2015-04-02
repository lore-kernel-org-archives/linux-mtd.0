Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YdjKI-0005Ya-Cw
 for linux-mtd@lists.infradead.org; Thu, 02 Apr 2015 17:54:47 +0000
Message-ID: <551D824D.3000004@nod.at>
Date: Thu, 02 Apr 2015 19:54:21 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Andrea Scian <rnd4@dave-tech.it>
Subject: Re: [PATCH 4/4] UBI: Implement bitrot checking
References: <mailman.38750.1427638218.22890.linux-mtd@lists.infradead.org>
 <mailman.38750.1427638218.22890.linux-mtd.{0bb8c466-de6c-4e79-8b63-7fc7efaf6273}.0@lists.infradead.org>
 <1427631197-23610-5-git-send-email-richard@nod.at>
 <551D7DB4.9010607@dave-tech.it>
In-Reply-To: <551D7DB4.9010607@dave-tech.it>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: boris.brezillon@free-electrons.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Am 02.04.2015 um 19:34 schrieb Andrea Scian:
> 
> Richard,
> 
> Il 29/03/2015 14:13, Richard Weinberger ha scritto:
>> +	mutex_lock(&ubi->buf_mutex);
>> +	err = ubi_io_read(ubi, ubi->peb_buf, e->pnum, 0, ubi->peb_size);
>> +	mutex_unlock(&ubi->buf_mutex);
>> +	if (err == UBI_IO_BITFLIPS) {
>> +		dbg_wl("found bitflips in PEB %d", e->pnum);
>> +		spin_lock(&ubi->wl_lock);
>> +
> 
> IIUC you trigger the action as soon as you have a bitflip error, is this
> correct?

I trigger it as soon UBI sees the bitflip. This depends on the configured MTD
bitflip_threshold.

> Isn't this too much conservative? You usually have a RBER on MLC devices
> that's between 1E-7 (for brand new devices) and 1E-4 (for devices with
> 1k-2k P/E cycle after 100k-300k read-without-P/E)
> 
> Having a few bitflips on a block read is more that usual and current ECC
> can correct more that 16 bit error over 512/1KiB.

Please see above. :)

Thanks,
//richard
