Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y2H2D-0007C2-BF
 for linux-mtd@lists.infradead.org; Sat, 20 Dec 2014 10:13:18 +0000
Message-ID: <54954BA6.7050304@nod.at>
Date: Sat, 20 Dec 2014 11:12:54 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Oleksij Rempel <linux@rempel-privat.de>, t kevin <kevint324@gmail.com>,
 linux-mtd@lists.infradead.org
Subject: Re: Get error -74 (ECC error) during ubiattach
References: <CAOx4H9CgOoxu82M9cpmFcRdfn=n7mQOwOVzVqvhdUiyzddEPSw@mail.gmail.com>	<CAFLxGvx=a89_B-rAjwLT6esMzYgJ5E=t24wP3Yo_8w=9x52HVQ@mail.gmail.com>
 <CAOx4H9Ds5_ZSwwKRGcEzJc_k+CTeGyeeWRWAyo5mHV5rVEnSCA@mail.gmail.com>
 <549540F1.4040107@nod.at> <549548D5.8070109@rempel-privat.de>
 <54954950.2030800@nod.at> <549549E3.7000903@rempel-privat.de>
In-Reply-To: <549549E3.7000903@rempel-privat.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 20.12.2014 um 11:05 schrieb Oleksij Rempel:
> Am 20.12.2014 um 11:02 schrieb Richard Weinberger:
>> Am 20.12.2014 um 11:00 schrieb Oleksij Rempel:
>>> Am 20.12.2014 um 10:27 schrieb Richard Weinberger:
>>>> Hi!
>>>>
>>>> Am 20.12.2014 um 04:43 schrieb t kevin:
>>>>> So for uncorrectable ECC error ( e.g., bad block) the only way out is
>>>>> to do a fresh ubiformat?
>>>>> For device like harddisk you get bad blocks all the time, if it is not
>>>>> in the critical sector things can be fixed as much as possible by fsck
>>>>> so I was looking for something like fsck.ubifs.
>>>>
>>>> An uncorrectable ECC error means that more bits flipped than your ECC
>>>> algorithm can fix.
>>>
>>> At same time uncorrectable ECC error mean, the page was erase and there
>>> is no ECC sum. Something should be written to create ECC.
>>
>> Which would be a driver bug and needs fixing.
> 
> No at all. If driver get request to erase page, it should do it and
> nothing more.
> There are use cases where erase means erase, and not erase + write ecc.

Raw mode is a different thing.

> It is not a driver bug!

If users on top of MTD read from an erased block it has to return 0xFF bytes and
not an ECC error.
IOW if mtd_erase() -> mtd_read() causes an ECC error with your driver it needs
fixing.

Thanks,
//richard
