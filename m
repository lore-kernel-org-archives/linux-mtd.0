Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ajCmZ-0001ya-5P
 for linux-mtd@lists.infradead.org; Thu, 24 Mar 2016 21:27:08 +0000
Received: by mail-wm0-x232.google.com with SMTP id l68so5636488wml.0
 for <linux-mtd@lists.infradead.org>; Thu, 24 Mar 2016 14:26:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <56F4502D.3030902@nod.at>
References: <CABJ+KKu2RJuHXE3LpmzSYtE0i57sHDUHWOxPxufCP94RTa=eBA@mail.gmail.com>
 <CAAEAJfB42GY9kGDBvacpKNgtAt3Kp1bE6rfprm_A_WiwR_cXGg@mail.gmail.com>
 <56F4502D.3030902@nod.at>
Date: Thu, 24 Mar 2016 18:26:44 -0300
Message-ID: <CAAEAJfDXB34SWoCMXBiqEFSRMWAxZpGmMR9tPdsN=mokO8fkhw@mail.gmail.com>
Subject: Re: ubiblock RW
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Richard Weinberger <richard@nod.at>
Cc: Benson Young <benson6877@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Gstir <david@sigma-star.at>,
 Artem Bityutskiy <dedekind1@gmail.com>, Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 24 March 2016 at 17:38, Richard Weinberger <richard@nod.at> wrote:
> Hi!
>
> Am 24.03.2016 um 15:23 schrieb Ezequiel Garcia:
>> +MTD
>>
>> On 23 March 2016 at 14:40, Benson Young <benson6877@gmail.com> wrote:
>>> Hello Ezequiel,
>>>
>>> I came upon the discussion about block device emulation over UBI.
>>> http://linux-mtd.infradead.narkive.com/YF0XOFxY/block-device-emulation-=
on-top-of-ubi-volumes-with-read-write-support
>>>
>>> I understand the most recent implementation is read-only emulation for
>>> mounting squashfs based file system.
>>> However, I would really like to see the write option be brought back. I=
f
>>> not, can you please help me about enabling the write option in my build=
?
>>> I have used the patch listed in the following link
>>> https://lwn.net/Articles/525957/
>>> but i couldn't find any accompanying util that allows me to create the =
ubi
>>> block volume.
>>>
>>
>> You should be able to use mtd-utils' ubiblock tool (maybe you'll need to=
 do
>> some modifications).
>>
>> http://www.linux-mtd.infradead.org/doc/ubi.html#L_ubiblock
>>
>>> Reason for this request is that I am looking into root file system
>>> encryption over un-managed NAND flash. Now the mainline method of disk
>>> encryption in Linux revolves around
>>> dm-crypt module which requires a block device. i am under the impressio=
n
>>> that using mtdblock works to an extent until the partition you try to
>>> map/encrypt has bad blocks in it.
>>> I have seen discussion about using UBIFS, and I have seen a paper discu=
ssing
>>> it, where the author embeds the encryption engine within UBI layer, so =
each
>>> write and read is encrypted. However, its a path I would take when I ha=
ve no
>>> choice. Right now dm-crypt is my first choice basically because of the
>>> availability of support/discussion/information.
>>>
>>> I also saw you mentioned that you don't have NAND flash for testing, th=
is is
>>> something that I can help with. I have an abundance of NAND flash devic=
es.
>>
>> I have some devices with SLC NANDs now, but thanks for the offer.
>>
>>> For simplicity sake, I work with SLC because of better endurance compar=
ed to
>>> MLC. I am also curious about flash endurance with EXT4 over UBI. Destru=
ctive
>>> erase/write will definitely on my to-do list.
>>>
>>
>> So, like I said here:
>>
>> http://linux-mtd.infradead.narkive.com/YF0XOFxY/block-device-emulation-o=
n-top-of-ubi-volumes-with-read-write-support
>>
>> We can definitely implement write support if we have a good use case for=
 it.
>> Encryption might be one.
>>
>> Richard, what do you think?
>
> I'm definitely not fond of adding write support to ubiblock without turni=
ng it into a proper FTL.
> Otherwise it will be abused and will cause serious damage.
>

I'm not sure this statement makes much sense without actual numbers.

Of course, eraseblocks will be erased much more often with a regular
block-oriented
filesystem. But a user could agressively control write access and prevent t=
his.

Would it be that bad to add write support and add some big warning to
prevent users about potential damage?

--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
