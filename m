Received: from mail-iw0-f198.google.com ([209.85.223.198])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mm2Lc-0007vr-Vd
	for linux-mtd@lists.infradead.org; Fri, 11 Sep 2009 09:23:22 +0000
Received: by iwn36 with SMTP id 36so622570iwn.24
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Sep 2009 02:23:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4AA77E2A.40604@gmail.com>
References: <2df346410909020235v5258eba3l30ff731841acc71@mail.gmail.com>
	<1252390936.5060.47.camel@localhost>
	<2df346410909090245v5995842asf3a94ae40da5fa72@mail.gmail.com>
	<4AA77E2A.40604@gmail.com>
Date: Fri, 11 Sep 2009 17:23:14 +0800
Message-ID: <2df346410909110223p87aefd2ibfe8fb11e040f56f@mail.gmail.com>
Subject: Re: UBIFS power cut issues
From: JiSheng Zhang <jszhang3@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

2009/9/9 Artem Bityutskiy <dedekind1@gmail.com>:
> On 09/09/2009 12:45 PM, JiSheng Zhang wrote:
>>>
>>> On Wed, 2009-09-02 at 17:35 +0800, JiSheng Zhang wrote:
>>>>
>>>> If we cut power when copy file into ubifs, then remount ubifs and try
>>>> to read the file, we found that the data at some offset of the file
>>>> began different from the data of the original file at the same offset.
>>>> Is this a bug of ubifs?
>>>
>>> This is expected behavior on any asynchronous FS. You may switch to
>>> synchronous behavior with '-o sync' mount option. I wrote a lot of
>>
>> I have tested with "mount -o sync", the result is the same. It's not
>> empty file. For example:
>> cp fileA /mnt/ubifs/fileB
>> random cut power before "cp" completed.
>> then remount
>> =9AFrom head of /mnt/ubifs/fileB to some offset offsetC is the same as
>> fileA. But from offsetC to the end is different from fileA at the same
>> offset offsetC, it's not empty either.
>> Hope I expressed myself clearly.
>
> Hmm, ok. What is your kernel version?
>
> Could you please take a closer look and see if these differences
> are zeroes or not?

My mistake, sorry. I have look from the offset to the end of the file,
they're really 0, that is file hole.
>
> Do you have an automated test for this? Can you share your script?

Hmm, I just run copy manually and diff once mounted again.
>
> --
> Best Regards,
> Artem Bityutskiy (=E1=D2=D4=A3=CD =E2=C9=D4=C0=C3=CB=C9=CA)
>

Best Regards,
Jisheng
