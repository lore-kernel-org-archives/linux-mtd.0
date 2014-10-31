Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XkL6P-0007ac-Bw
 for linux-mtd@lists.infradead.org; Fri, 31 Oct 2014 22:55:30 +0000
From: "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>
To: Richard Weinberger <richard@nod.at>, Tanya Brokhman
 <tlinder@codeaurora.org>, "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: RE: [RFC/PATCH 0/5 v2] mtd:ubi: Read disturb and Data retention
 handling
Date: Fri, 31 Oct 2014 22:55:02 +0000
Message-ID: <0D23F1ECC880A74392D56535BCADD7351C2D0438@NTXBOIMBX03.micron.com>
References: <1414331342-27839-1-git-send-email-tlinder@codeaurora.org>
 <544D5BEC.50802@nod.at> <544E052B.1040505@codeaurora.org>
 <544E08AE.7080506@nod.at> <5450C997.9010205@codeaurora.org>
 <5450D6C4.4040400@nod.at> <54538ABC.1040605@codeaurora.org>
 <5453ABF9.4070208@nod.at> <5453AD4D.2000303@nod.at>
In-Reply-To: <5453AD4D.2000303@nod.at>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hope I'm not over stepping here, but I thought I could help.  I'm a NAND AE=
. =20

Are you using NAND or eMMC?  If NAND why not use ECC to monitor for disturb=
?  NAND is a great storage unit, but you have to follow the rules.  Please =
refer to Micron datasheet MT29F2G08ABAEAH4 page 100.  NAND is made up of bl=
ocks(2048 in this case), each block has a number of pages.  The block is th=
e smallest erasable unit and the only way to change 0's to 1's.  Pages are =
the smallest programmable unit and can only change 1's to 0's.  P/E cycling=
 (100,000 in this case) wears out the block.  We provide 64bytes of spare a=
rea for BCH ECC and NAND management.  BCH ECC will tell you if bits have ch=
anged and will correct up to 5.=20

Read disturb is a recoverable failure.  It doesn't affect the cells in the =
page you are reading it affects the cells on either side of the page you ar=
e reading.  P/E cycling for this device is 100,000.  You can program once a=
nd read many many times.

Data retention is the loss of charge on the cells.  Technically you can onl=
y change a 0 to 1 by erasing the whole block.  However, data retention is t=
he loss of charge in a cell over time. In this case data retention is 10 ye=
ars.  Data retention gets worse as temperature goes up.


-----Original Message-----
From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of=
 Richard Weinberger
Sent: Friday, October 31, 2014 8:40 AM
To: Tanya Brokhman; dedekind1@gmail.com
Cc: linux-arm-msm@vger.kernel.org; linux-mtd@lists.infradead.org
Subject: Re: [RFC/PATCH 0/5 v2] mtd:ubi: Read disturb and Data retention ha=
ndling

Am 31.10.2014 um 16:34 schrieb Richard Weinberger:
> Hi Tanya,
>=20
> Am 31.10.2014 um 14:12 schrieb Tanya Brokhman:
>> Hi Richard
>>
>> On 10/29/2014 2:00 PM, Richard Weinberger wrote:
>>> Tanya,
>>>
>>> Am 29.10.2014 um 12:03 schrieb Tanya Brokhman:
>>>> I'll try to address all you comments in one place.
>>>> You're right that the read counters don't have to be exact but they do=
 have to reflect the real state.
>>>
>>> But it does not really matter if the counters are a way to high or too =
low?
>>> It does also not matter if a re-read of adjacent PEBs is issued too oft=
en.
>>> It won't hurt.
>>>
>>>> Regarding your idea of saving them to a file, or somehow with userspac=
e involved; This is doable, but such solution will depend on user space imp=
lementation:
>>>> - one need to update kernel with correct read counters (saved=20
>>>> somewhere in userspace)
>>>> - it is required on every boot.
>>>> - saving the counters back to userspace should be periodically trigger=
ed as well.
>>>> So the minimal workflow for each boot life cycle will be:
>>>> - on boot: update kernel with correct values from userspace
>>>
>>> Correct.
>>>
>>>> - kernel updates the counters on each read operation
>>>
>>> Yeah, that's a plain simple in kernel counter..
>>>
>>>> - on powerdown: save the updated kernel counters back to userspace
>>>
>>> Correct. The counters can also be saved once a day by cron.
>>> If one or two save operations are missed it won't hurt either.
>>>
>>>> The read-disturb handling is based on kernel updating and=20
>>>> monitoring read counters. Taking this out of the kernel space will res=
ult in an incomplete and very fragile solution for the read-disturb problem=
 since the dependency in userspace is just too big.
>>>
>>> Why?
>>> We both agree on the fact that the counters don't have to be exact.
>>> Maybe I'm wrong but to my understanding they are just a rough indicator=
 that sometime later UBI has to check for bitrot/flips.
>>
>> The idea is to prevent data loss, to prevent errors while reading,=20
>> because we might hit errors we can't fix. So although the read_disturb_t=
hreshold is a rough estimation based on statistics, we can't ignore it and =
need to stay close to the calculated statistics.
>>
>> Its really the same as wear-leveling. You have a limitation that each=20
>> peb can be erased limited number of times. This erase-limit is also an e=
stimation based on statistics collected by the card vendor. But you do want=
 to know the exact number of erase counter to prevent erasing the block ext=
ensively.
>=20
> So you have to update the EC-Header every time we read a PEB...?
>=20
>>
>>>
>>>> Another issue to consider is that each SW upgrade will result in=20
>>>> loosing the counters saved in userspace and reset all. Otherwise, syst=
em upgrade process will also have to be updated.
>>>
>>> Does it hurt if these counters are lost upon an upgrade?
>>> Why do we need them for ever?
>>> If they start after an upgrade from 0 again heavily read PEBs will quic=
kly gain a high counter and will be checked.
>>
>> yes, we do need the ACCURATE counters and cant loose them. For=20
>> example: we have a heavily read block. It was read from 100 times when t=
he read-threshold is 101. Meaning, the 101 read will most probably fail.
>=20
> You are trying me to tell that the NAND is that crappy that it will die a=
fter 100 reads? I really hope this was just a bad example.
> You *will* loose counters unless you update the EC-Header upon every read=
, which is also not sane at all.
>=20
>> You do a SW upgrade, and set the read-counter for this block as 0 and=20
>> don't scrubb it. Next time you try reading from it (since it's heavily r=
ead from block), you'll get errors. If you're lucky, ecc will fx them for y=
ou, but its not guarantied.
>>
>>>
>>> And of course these counters can be preserved. One can also place them =
into a UBI static volume.
>>> Or use a sane upgrade process...
>>
>> "Sane upgrade" means that in order to support read-disturb we twist the =
users hand into implementing not a trivial logic in userspace.
>>
>>>
>>> As I wrote in my last mail we could also create a new internal UBI volu=
me to store these counters.
>>> Then you can have the logic in kernel but don't have to change the UBI =
on-disk layout.
>>>
>>>> The read counters are very much like the ec counters used for=20
>>>> wear-leveling; One is updated on each erase, other on each read; One i=
s used to handle issues caused by frequent writes (erase operations), the  =
other handle issues caused by frequent reads.
>>>> So how are the two different? Why isn't wear-leveling (and erase=20
>>>> counters) handled by userspace? My guess that the decision to encapsul=
ate the wear-leveling into the kernel was due to the above mentioned reason=
s.
>>>
>>> The erase counters are crucial for UBI to operate. Even while=20
>>> booting up the kernel and mounting UBIFS the EC counters have to availa=
ble because UBI maybe needs to move LEBs around or has to find free PEBs wh=
ich are not worn out. I UBI makes here a bad decision things will break.
>>
>> Same with read-counters and last_erase_timestamps. If ec counters are lo=
st, we might get with bad blocks (since they are worn out) and have data lo=
ss.
>> If we ignore read-disturb and don't' scrubb heavily read blocks we will =
have data loss as well.
>> the only difference between the 2 scenarios is "how long before it=20
>> happens". Read-disturb wasn't an issue since average lifespan of a nand =
device was ~5 years. Read-disturb occurs in a longer lifespan. that's why i=
t's required now: a need for a "long life nand".
>=20
> Okay, read-disturb will only happen if you read blocks *very* often. Do y=
ou have numbers, datasheets, etc...?
>=20
> Let's recap.
>=20
> We need to address two issues:
> a) If a PEB is ready very often we need to scrub it.
> b) PEBs which are not read for a very long time need to be=20
> re-read/scrubbed to detect bit-rot
>=20
> Solving b) is easy, just re-read every PEB from time to time. No persiste=
nt data at all is needed.
> To solve a) you suggest adding the read-counter to the UBI on-disk layout=
 like the erase-counter values.
> I don't think that this is a good solution.
> We can perfectly fine save the read-counters from time to time and=20
> upon detach either to a file on UBIFS or into a new internal value. As=20
> read-disturb will only happen after a long time and hence very high read-=
counters it does not matter if we lose some values upon a powercut. i.e. Su=
ch that a counter is 50000 instead of 50500.
> Btw: We also have to be very careful that reading data will not wear out =
the flash.
>=20
> So, we need a logic within UBI which counts every read access and persist=
s this data in some way.
> As suggested in an earlier mail this can also be done purely in userspace=
.
> It can also be done within the UBI kernel module. I.e. by storing the cou=
nters into a internal volume.

Another point:
What if we scrub every PEB once a week?
Why would that not work?

Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
