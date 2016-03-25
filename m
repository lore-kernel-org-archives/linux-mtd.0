Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ajYMG-0004Qe-Ry
 for linux-mtd@lists.infradead.org; Fri, 25 Mar 2016 20:29:26 +0000
Subject: Re: ubiblock RW
To: Willy Tarreau <w@1wt.eu>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
References: <CABJ+KKu2RJuHXE3LpmzSYtE0i57sHDUHWOxPxufCP94RTa=eBA@mail.gmail.com>
 <CAAEAJfB42GY9kGDBvacpKNgtAt3Kp1bE6rfprm_A_WiwR_cXGg@mail.gmail.com>
 <56F4502D.3030902@nod.at>
 <CAAEAJfDXB34SWoCMXBiqEFSRMWAxZpGmMR9tPdsN=mokO8fkhw@mail.gmail.com>
 <20160324213950.GA8300@1wt.eu>
Cc: Benson Young <benson6877@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Gstir <david@sigma-star.at>, Artem Bityutskiy <dedekind1@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <56F59F89.1030705@nod.at>
Date: Fri, 25 Mar 2016 21:28:57 +0100
MIME-Version: 1.0
In-Reply-To: <20160324213950.GA8300@1wt.eu>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 24.03.2016 um 22:39 schrieb Willy Tarreau:
> On Thu, Mar 24, 2016 at 06:26:44PM -0300, Ezequiel Garcia wrote:
>> On 24 March 2016 at 17:38, Richard Weinberger <richard@nod.at> wrote:
>>> Hi!
>>>
>>> Am 24.03.2016 um 15:23 schrieb Ezequiel Garcia:
>>>> +MTD
>>>>
>>>> On 23 March 2016 at 14:40, Benson Young <benson6877@gmail.com> wrote:
>>>>> Hello Ezequiel,
>>>>>
>>>>> I came upon the discussion about block device emulation over UBI.
>>>>> http://linux-mtd.infradead.narkive.com/YF0XOFxY/block-device-emulation-on-top-of-ubi-volumes-with-read-write-support
>>>>>
>>>>> I understand the most recent implementation is read-only emulation for
>>>>> mounting squashfs based file system.
>>>>> However, I would really like to see the write option be brought back. If
>>>>> not, can you please help me about enabling the write option in my build?
>>>>> I have used the patch listed in the following link
>>>>> https://lwn.net/Articles/525957/
>>>>> but i couldn't find any accompanying util that allows me to create the ubi
>>>>> block volume.
>>>>>
>>>>
>>>> You should be able to use mtd-utils' ubiblock tool (maybe you'll need to do
>>>> some modifications).
>>>>
>>>> http://www.linux-mtd.infradead.org/doc/ubi.html#L_ubiblock
>>>>
>>>>> Reason for this request is that I am looking into root file system
>>>>> encryption over un-managed NAND flash. Now the mainline method of disk
>>>>> encryption in Linux revolves around
>>>>> dm-crypt module which requires a block device. i am under the impression
>>>>> that using mtdblock works to an extent until the partition you try to
>>>>> map/encrypt has bad blocks in it.
>>>>> I have seen discussion about using UBIFS, and I have seen a paper discussing
>>>>> it, where the author embeds the encryption engine within UBI layer, so each
>>>>> write and read is encrypted. However, its a path I would take when I have no
>>>>> choice. Right now dm-crypt is my first choice basically because of the
>>>>> availability of support/discussion/information.
>>>>>
>>>>> I also saw you mentioned that you don't have NAND flash for testing, this is
>>>>> something that I can help with. I have an abundance of NAND flash devices.
>>>>
>>>> I have some devices with SLC NANDs now, but thanks for the offer.
>>>>
>>>>> For simplicity sake, I work with SLC because of better endurance compared to
>>>>> MLC. I am also curious about flash endurance with EXT4 over UBI. Destructive
>>>>> erase/write will definitely on my to-do list.
>>>>>
>>>>
>>>> So, like I said here:
>>>>
>>>> http://linux-mtd.infradead.narkive.com/YF0XOFxY/block-device-emulation-on-top-of-ubi-volumes-with-read-write-support
>>>>
>>>> We can definitely implement write support if we have a good use case for it.
>>>> Encryption might be one.
>>>>
>>>> Richard, what do you think?
>>>
>>> I'm definitely not fond of adding write support to ubiblock without turning it into a proper FTL.
>>> Otherwise it will be abused and will cause serious damage.
>>>
>>
>> I'm not sure this statement makes much sense without actual numbers.
>>
>> Of course, eraseblocks will be erased much more often with a regular
>> block-oriented
>> filesystem. But a user could agressively control write access and prevent this.
>>
>> Would it be that bad to add write support and add some big warning to
>> prevent users about potential damage?
> 
> +1, we're on linux, we're supposed to let the user shoot himself in the foot
> if he really *wants* to do so. But we must warn him so that it's not an
> accident. There are many other ways to destroy a flash anyway, I guess that
> running flash_erase in loops will achieve the same result, so we're not
> protecting much against stupid actions by removing useful features and we're
> only inciting users to work around them by employing possibly even uglier
> solutions (FS directly on mtdblock maybe ?).

Okay, that's a good point.
A parameter for the ubiblock tool a la "--enable-rw-i-know-what-im-doing" should be fine.

Thanks,
//richard
