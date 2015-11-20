Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zzr1F-0002sO-3t
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 19:06:49 +0000
Received: by wmdw130 with SMTP id w130so31150878wmd.0
 for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2015 11:06:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <564F6D99.8090203@gmail.com>
References: <564CEB61.2000601@gmail.com> <20151120000226.GP64635@google.com>
 <564EC4E0.90602@gmail.com>
 <CAFSsGVsJBi6yPin7X9MCS8LD6nygjynfgDgFicjojkm0rOJSJw@mail.gmail.com>
 <20151120123540.GC1929@sirena.org.uk> <564F6D99.8090203@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Fri, 20 Nov 2015 20:05:48 +0100
Message-ID: <CAOMqctTt=78C4m2jjMb9mRBOkoZ5uZ4neVm0NS39iNO8otn=dA@mail.gmail.com>
Subject: Re: RfC: Handle SPI controller limitations like maximum message length
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, Mark Brown <broonie@kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 Martin Sperl <martin@sperl.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 20 November 2015 at 19:59, Heiner Kallweit <hkallweit1@gmail.com> wrote:
> Am 20.11.2015 um 13:35 schrieb Mark Brown:
>> On Fri, Nov 20, 2015 at 11:06:47AM +0100, Heiner Kallweit wrote:
>>> On Fri, Nov 20, 2015 at 7:59 AM, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>
>>>> It would be sufficient if it's a valid case that spi_master returns 0
>>>> and an actual_length < requested_length as this is some kind of error
>>>> situation.
>>
>>> I had one more look at the SPI core and e.g. spi_write_then_read
>>> calls spi_sync w/o checking actual_length afterwards.
>>> This can mean the discussed case is not valid, however it also could be
>>> simply a bug.
>>
>> We can't assume that users of spi_write_then_read() will cope with a
>> restarted transfer - the usual use case is things like register I/O
>> where restarting a partial transfer wouldn't produce the desired result
>> so it's just a plain error for users of that interface.  Anything that
>> is able to cope needs to be using the core API directly.
>>
>>> If the discussed case is valid a clear hint to all users of spi_sync and
>>> friends should be added that the caller can not rely on status code 0
>>> only but must check actual_length to verify that the complete message
>>> was transferred.
>>
>> You'll get an error on truncation.  It may be possible to recover.
>>
> OK, I interpret this as:
> Controller drivers shall return 0 only if the complete message was
> transferred successfully.
> If  a controller driver returns an error it has the option to set
> actual_length to what was transferred successfully.
>
> This means we can't use patch 4 from Michal because it bails out as soon
> as the underlying SPI transfer returns an error.
>
> Instead something like the spi-nor patch I sent on Oct 6th would be needed:
> [PATCH] mtd: spi-nor: handle controller driver limitations in spi_nor_read
>
> It loops over nor->read and ignores errors as long as at least something
> was read.
>

I don't think ignoring errors in general is good idea.

If it's desirable that a partial transfer is reported as error then a
particular error value should be defined for this case and drivers
that can continue the transfer in a driver-specific way (such as
spi-nor) can check for this error and handle it appropriately and pass
through any other error.

Thanks

Michal
