Received: from mail-bw0-f218.google.com ([209.85.218.218])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NorXR-0006iJ-Di
	for linux-mtd@lists.infradead.org; Tue, 09 Mar 2010 04:59:29 +0000
Received: by bwz10 with SMTP id 10so4434979bwz.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 08 Mar 2010 20:59:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <804f0d21003080823x730204feg70ea4e9a617b6378@mail.gmail.com>
References: <7FAAF01335A90841B8C1098FB08222A6908DFCB01F@GMVMAIL6.gmv.es>
	<Pine.LNX.4.64.1001291147400.32263@lnxricardw.se.axis.com>
	<804f0d21003080602m4adabf28p62ca7cf5d09c274b@mail.gmail.com>
	<ce9ab5791003080638v604412fcy7761482892c0d787@mail.gmail.com>
	<804f0d21003080823x730204feg70ea4e9a617b6378@mail.gmail.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Tue, 9 Mar 2010 10:29:02 +0530
Message-ID: <ce9ab5791003082059y7268cc03jb09b550b9008bab1@mail.gmail.com>
Subject: Re: JFFS2 error messages
To: Arno Steffen <arno.steffen@googlemail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Marco Donadio <mdonadio@gmv.com>,
	Ricard Wanderlof <ricard.wanderlof@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 8, 2010 at 9:53 PM, Arno Steffen
<arno.steffen@googlemail.com> wrote:
> 2010/3/8 Vimal Singh <vimal.newwork@gmail.com>:
>> On Mon, Mar 8, 2010 at 6:02 AM, Arno Steffen
>> <arno.steffen@googlemail.com> wrote:
>>> 2010/1/29 Ricard Wanderlof <ricard.wanderlof@axis.com>:
>>> ...
>>>> The 'Empty flash at ... ends at ...' usually indicates some sort of mi=
smatch
>>>> between the sector or block size of the flash and the erasesize used w=
hen
>>>> making the image. It could be harmless, or could indicate a more serio=
us
>>>> configuration problem.
>>> ...
>>>> /Ricard
>>>> --
>>>> Ricard Wolf Wanderl=F6f =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 ricardw(at)axis.com
>>>> Axis Communications AB, Lund, Sweden =A0 =A0 =A0 =A0 =A0 =A0www.axis.c=
om
>>>> Phone +46 46 272 2016 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 Fax +46 46 13 61 30
>>>
>>> I also suffered from this empty flash at ... message.
>>> So I checked with cat /proc/mtd the erasesize (which is 20000) and how
>>> I generated the jffs2 (with mkfs.jffs2 -lqnp -e 128).
>>>
>>> Imho this both match (128k). But somewhat has to cause this message.
>>> What else could I do to prevent such messages and how to get rid of it?
>>>
>>
>> May be you should try providing "-s,--pagesize=3DSIZE" option too in
>> 'mkfs.jffs2' command.
>> If you do not give this, default (4K) will be consider. Which I do not
>> think is ture in your case.
>>
>>
>> --
>> Regards,
>> Vimal Singh
>>
>
> Thanks, but I am a bit puzzled. In datasheet of flash MT29F1G there
> are several sizes:
> "=96 Page size
> =95 x8: 2112 bytes (2048 + 64 bytes)
> =95 x16: 1056 words (1024 + 32 words)"

Both are same things, e.i. 2112 bytes.

> "Each page consists of 2112 bytes. The pages are further divided into
> a 2048-byte data
> storage region with a separate 64-byte area. The 64-byte area s
> typically used for error
> management functions."
>
> As the pagesize is to be set in kByte I guess 2kByte would be the
> right setting? The extra bytes for error management is to be omitted?

Yes, that is correct. The pagesize should be set to 2kByte.

--=20
Regards,
Vimal Singh
