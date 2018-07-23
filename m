Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fhiet-0002Er-Tp
 for linux-mtd@lists.infradead.org; Mon, 23 Jul 2018 21:46:25 +0000
From: NeilBrown <neil@brown.name>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 24 Jul 2018 07:45:57 +1000
Cc: Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Subject: Re: [PATCH] mtd: spi-nor: clear Extended Address Reg on switch to
 3-byte addressing.
In-Reply-To: <CAN8TOE9Pr2i4tXu8mGuY7xSY5bU_r7UhQ9SxfqYg_M4YDUt0ew@mail.gmail.com>
References: <874lkmw54j.fsf@notabene.neil.brown.name>
 <61e255fa-ece4-5566-d63a-730aaa25f18c@gmail.com>
 <87sh85uzu3.fsf@notabene.neil.brown.name>
 <a3bb28f9-1185-3dbb-1a1f-1bfe03a8798c@gmail.com>
 <87efjnvpjl.fsf@notabene.neil.brown.name>
 <CAN8TOE9Pr2i4tXu8mGuY7xSY5bU_r7UhQ9SxfqYg_M4YDUt0ew@mail.gmail.com>
Message-ID: <87tvoppqwa.fsf@notabene.neil.brown.name>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--=-=-=
Content-Type: text/plain

On Mon, Jul 23 2018, Brian Norris wrote:

> Hi,
>
> I'm a little late to this thread, but I recently noticed (and
> complained about) commit: 59b356ffd0b0 ("mtd: m25p80: restore the
> status of SPI flash when exiting").
>
> On Mon, Apr 9, 2018 at 6:05 PM, NeilBrown <neil@brown.name> wrote:
>> On Mon, Apr 09 2018, Marek Vasut wrote:
>>
>>> On 04/08/2018 11:56 PM, NeilBrown wrote:
>>>> On Sun, Apr 08 2018, Marek Vasut wrote:
>>>>
>>>>> On 04/08/2018 09:04 AM, NeilBrown wrote:
>>>>>>
>>>>>> According to section
>>>>>>    8.2.7 Write Extended Address Register (C5h)
>>>>>>
>>>>>> of the Winbond W25Q256FV data sheet (256M-BIT SPI flash)
>>>>>>
>>>>>>    The Extended Address Register is only effective when the device is
>>>>>>    in the 3-Byte Address Mode.  When the device operates in the 4-Byte
>>>>>>    Address Mode (ADS=1), any command with address input of A31-A24
>>>>>>    will replace the Extended Address Register values. It is
>>>>>>    recommended to check and update the Extended Address Register if
>>>>>>    necessary when the device is switched from 4-Byte to 3-Byte Address
>>>>>>    Mode.
>>>>>>
>>>>>> This patch adds code to implement that recommendation.  Without this,
>>>>>> my GNUBEE-PC1 will not successfully reboot, as the Extended Address
>>>>>> Register is left with a value of '1'. When the SOC attempts to read
>>>>>> (in 3-byte address mode) the boot loader, it reads from the wrong
>>>>>> location.
>>>>>
>>>>> Your board is broken by design and does not implement proper reset logic
>>>>> for the SPI NOR chip, right ? That is, when the CPU resets, the SPI NOR
>>>>> is left in some random undefined state instead of being reset too, yes?
>>>>
>>>> Thanks for the reply.
>>>
>>> Sorry for the delay.
>>>
>>>> "Broken" is an emotive word :-)  Certain the board *doesn't* reset the NOR
>>>> chip on reset.
>>>
>>> It's not emotive, it is descriptive of what it really is. Such boards
>>> which do not correctly reset the SPI NOR can, during ie. reset, get into
>>> a state where the system is unbootable or corrupts the content of the
>>> SPI NOR. This stuff came up over and over on the ML, it seems HW
>>> designers never learn.
>>
>> Ok, the board is broken.
>> Still, Linux has a history of even supporting broken hardware -  Spectre
>> and Meltdown for example.
>
> Except those can generally be worked around at the expense of
> performance. This is impossible to workaround completely without
> hardware changes.
>
>> I wouldn't propose a fix that harms the kernel in any way (hurts
>> maintainability or negatively affect other hardware), but I don't
>> think my proposed patch does.
>
> No, yours doesn't, but the original patch (Commit: 59b356ffd0b0 ("mtd:
> m25p80: restore the status of SPI flash when exiting")) started us
> down the slippery slope. If things work 99% of the time, people often
> fail to notice that they are broken for the 1%. Thus, that patch can
> harm future development, where unwitting designers think things are
> working fine and fail to fix their hardware. That's not to say
> designers always notice even when things are really really broken, but
> that patch makes the brokenness much harder to notice.
>
>>>> However the NOR chip doesn't have a dedicated RESET pin. It has a pin
>>>> that defaults to "HOLD" and can be programmed to act as "RESET".  This
>>>> pin is tied to 3V3 on my board. If it were tied to a reset line, it
>>>> would still need code changes to work (or switch from the default).
>>>
>>> I'm afraid this needs HW changes. The solution for SPI NORs without a
>>> dedicated reset line is to just hard cut the power to them for a while
>>> in case the CPU core reset out is asserted.
>>>
>>>> A few month ago:
>>>> Commit: 8dee1d971af9 ("mtd: spi-nor: add an API to restore the status of SPI flash chip")
>>>> Commit: 59b356ffd0b0 ("mtd: m25p80: restore the status of SPI flash when exiting")
>>>
>>> This works when reloading the driver, but not when restarting the system.
>>
>> I don't understand what you are saying.
>> The second patch provides a ->shutdown function for the spi_driver.
>> This is called by spi_drv_shutdown which is called by the driver
>> ->shutdown function, which is called by device_shutdown(), which
>> is only called by
>>   kernel_shutdown_prepare() and
>>   kernel_restart_prepare().
>>
>> So it works exactly when restarting the system, and not when reloading
>> the driver.
>>
>>>
>>>> were added to Linux.  They appear to be designed to address a very
>>>> similar situation to mine.  Unfortunately they aren't complete as the
>>>> code to disable 4-byte addressing doesn't follow documented requirements
>>>> (at least for winbond) and doesn't work as intended (at least in one
>>>> case - mine). This code should either be fixed (e.g. with my patch), or removed.
>
> I would (and already did) vote for removal. The shutdown() hook just
> papers over bugs and leads people to think that it is a good solution.
> There's a reason we rejected such patches repeatedly in the past. This
> one slipped through.

Hi Brian,
 thanks for your thoughts.
 Could you just clarify what you see as the end-game.
 Do you have an alternate approach which can provide reliability for the
 various hardware which currently seems to need these patches?
 Or do you propose that people with this hardware should suffer
 a measurably lower level of reliability than they currently enjoy?

Thanks,
NeilBrown

>
> Brian

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEG8Yp69OQ2HB7X0l6Oeye3VZigbkFAltWTJYACgkQOeye3VZi
gbnyFBAArJiQv6S5G/USGOi6WNI4Y78Si/Y1vCBTJTsGjmyYrCFsDqVo52tcf85z
AV78X3WNq4YJbwMs+VUlyFvgkeRwqhTsXSOdGVcv1dWzkz034RkUUY9HU85NjnGy
RxWacrP/jEg3iPHrWUDTITgOovckIQAMwdKrIqlEVrrydc5ZBJ42VHXI17t+uaXg
1JePefPFP9v/pzXtq+z20pZr6JzPIk7gJH8JgbkSyd5E5EfUCZ6N3A+JowS1YSjq
LBwcQjzgUGsvUdmkTPs8wyWH4UWNwcg1KtagXGMco4Ul+AkmNNDEgnxyZsvc8eHo
X8m9hA9TEvbUYUyHv6ivyuZ/5XaGdL5ZHc1AVZoq/up18B681ifnfvfsttstYEAh
SYgZTz0zMKV+aVjSba08ZGvpmRRr19uW7vz1O86GhvPUi7OsFTcCR+nlKfL9m+Fu
FCGgDi9f4Dh98hdC5cMgNNmyFw8hj4lSTDS/gQKK6aOBi2l7f4bfpYv/Fs0yx1sQ
6HNOyuQjPhuAO6k8QztPR47zzrzndarTVwAT5eLwl1a8gx+Pgh4sSOUjqwylg9uK
LGz739D5+PLPrQiguSwkUgcJPFC1XgomXXfUs+C+0/opbS/mFa1DMRBIricIPEWD
Feq9PQizxrTtqLNGqzdn4MjL0p/pkxacGCVOZzIDrDiZ4RlDTsY=
=n6yx
-----END PGP SIGNATURE-----
--=-=-=--
