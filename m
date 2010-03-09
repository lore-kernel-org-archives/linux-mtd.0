Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NouB5-0003SW-6m
	for linux-mtd@lists.infradead.org; Tue, 09 Mar 2010 07:48:35 +0000
Received: by wyf23 with SMTP id 23so3558212wyf.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 08 Mar 2010 23:48:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <ce9ab5791003082059y7268cc03jb09b550b9008bab1@mail.gmail.com>
References: <7FAAF01335A90841B8C1098FB08222A6908DFCB01F@GMVMAIL6.gmv.es>
	<Pine.LNX.4.64.1001291147400.32263@lnxricardw.se.axis.com>
	<804f0d21003080602m4adabf28p62ca7cf5d09c274b@mail.gmail.com>
	<ce9ab5791003080638v604412fcy7761482892c0d787@mail.gmail.com>
	<804f0d21003080823x730204feg70ea4e9a617b6378@mail.gmail.com>
	<ce9ab5791003082059y7268cc03jb09b550b9008bab1@mail.gmail.com>
Date: Tue, 9 Mar 2010 08:48:29 +0100
Message-ID: <804f0d21003082348m27adcf0exf1d928a53a84655b@mail.gmail.com>
Subject: Re: JFFS2 error messages
From: Arno Steffen <arno.steffen@googlemail.com>
To: Vimal Singh <vimal.newwork@gmail.com>
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

2010/3/9 Vimal Singh <vimal.newwork@gmail.com>:
> On Mon, Mar 8, 2010 at 9:53 PM, Arno Steffen
> <arno.steffen@googlemail.com> wrote:
>> 2010/3/8 Vimal Singh <vimal.newwork@gmail.com>:
>>> On Mon, Mar 8, 2010 at 6:02 AM, Arno Steffen
>>> <arno.steffen@googlemail.com> wrote:
>>>> 2010/1/29 Ricard Wanderlof <ricard.wanderlof@axis.com>:
>>>> ...
>>>>> The 'Empty flash at ... ends at ...' usually indicates some sort of m=
ismatch
>>>>> between the sector or block size of the flash and the erasesize used =
when
>>>>> making the image. It could be harmless, or could indicate a more seri=
ous
>>>>> configuration problem.
>>>> ...
>>>>> /Ricard
>>>>> --
>>>>> Ricard Wolf Wanderl=F6f =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 ricardw(at)axis.com
>>>>> Axis Communications AB, Lund, Sweden =A0 =A0 =A0 =A0 =A0 =A0www.axis.=
com
>>>>> Phone +46 46 272 2016 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 Fax +46 46 13 61 30
>>>>
>>>> I also suffered from this empty flash at ... message.
>>>> So I checked with cat /proc/mtd the erasesize (which is 20000) and how
>>>> I generated the jffs2 (with mkfs.jffs2 -lqnp -e 128).
>>>>
>>>> Imho this both match (128k). But somewhat has to cause this message.
>>>> What else could I do to prevent such messages and how to get rid of it=
?
>>>>
>>>
>>> May be you should try providing "-s,--pagesize=3DSIZE" option too in
>>> 'mkfs.jffs2' command.
>>> If you do not give this, default (4K) will be consider. Which I do not
>>> think is ture in your case.
>>>
>>>
>>> --
>>> Regards,
>>> Vimal Singh
>>>
>>
>> Thanks, but I am a bit puzzled. In datasheet of flash MT29F1G there
>> are several sizes:
>> "=96 Page size
>> =95 x8: 2112 bytes (2048 + 64 bytes)
>> =95 x16: 1056 words (1024 + 32 words)"
>
> Both are same things, e.i. 2112 bytes.
>
>> "Each page consists of 2112 bytes. The pages are further divided into
>> a 2048-byte data
>> storage region with a separate 64-byte area. The 64-byte area s
>> typically used for error
>> management functions."
>>
>> As the pagesize is to be set in kByte I guess 2kByte would be the
>> right setting? The extra bytes for error management is to be omitted?
>
> Yes, that is correct. The pagesize should be set to 2kByte.
>
> --
> Regards,
> Vimal Singh
>

With this command
mkfs.jffs2 -lqnp -s 2 -e 128 -r /opt/rootfs ...
the output grows and grows - mkfs will not stop. Even with -s 4 (which
should be default) the same.
Using -s 2048 gives a reasonable size.

mkfs.jffs2: Usage: mkfs.jffs2 [OPTIONS]
Make a JFFS2 file system image from an existing directory tree

Options:
  -p, --pad[=3DSIZE]        Pad output to SIZE bytes with 0xFF. If SIZE is
                          not specified, the output is padded to the end of
                          the final erase block
  -r, -d, --root=3DDIR      Build file system from directory DIR (default: =
cwd)
  -s, --pagesize=3DSIZE     Use page size (max data node size) SIZE
(default: 4KiB)
  -e, --eraseblock=3DSIZE   Use erase block size SIZE (default: 64KiB)
  -c, --cleanmarker=3DSIZE  Size of cleanmarker (default 12)

As "-s 4096" gives same result as without "-s" I assume the size is in byte=
 ?!
Just to be sure - I have to use 2048 instead of 2112 ?

Is there some kind of test to get out what really happened?
