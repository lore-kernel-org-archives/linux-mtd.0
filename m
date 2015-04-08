Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YfnKC-0007V2-0z
 for linux-mtd@lists.infradead.org; Wed, 08 Apr 2015 10:35:14 +0000
Message-ID: <55250446.40707@nod.at>
Date: Wed, 08 Apr 2015 12:34:46 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Andrea Scian <rnd4@dave-tech.it>
Subject: Re: [PATCH 4/4] UBI: Implement bitrot checking
References: <mailman.38750.1427638218.22890.linux-mtd@lists.infradead.org>
 <mailman.38750.1427638218.22890.linux-mtd.{0bb8c466-de6c-4e79-8b63-7fc7efaf6273}.0@lists.infradead.org>
 <1427631197-23610-5-git-send-email-richard@nod.at>
 <551D7DB4.9010607@dave-tech.it> <551D824D.3000004@nod.at>
 <551D9630.3090704@dave-tech.it>
In-Reply-To: <551D9630.3090704@dave-tech.it>
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

Am 02.04.2015 um 21:19 schrieb Andrea Scian:
> Il 02/04/2015 19:54, Richard Weinberger ha scritto:
>> Hi!
>>
>> Am 02.04.2015 um 19:34 schrieb Andrea Scian:
>>> Richard,
>>>
>>> Il 29/03/2015 14:13, Richard Weinberger ha scritto:
>>>> +	mutex_lock(&ubi->buf_mutex);
>>>> +	err = ubi_io_read(ubi, ubi->peb_buf, e->pnum, 0, ubi->peb_size);
>>>> +	mutex_unlock(&ubi->buf_mutex);
>>>> +	if (err == UBI_IO_BITFLIPS) {
>>>> +		dbg_wl("found bitflips in PEB %d", e->pnum);
>>>> +		spin_lock(&ubi->wl_lock);
>>>> +
>>> IIUC you trigger the action as soon as you have a bitflip error, is this
>>> correct?
>> I trigger it as soon UBI sees the bitflip. This depends on the configured MTD
>> bitflip_threshold.
> 
> ops.. I confused UBI bitflip error with MTD bitflip error ;-)
> thanks for point this out and help me understanding the code
> 
> now it's clear and it sounds good to me

Is this an implicit Reviewed-by? :)

Thanks,
//richard
