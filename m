Received: from [74.213.171.136] (helo=hi.ry.ca)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NogrQ-0003HS-TR
	for linux-mtd@lists.infradead.org; Mon, 08 Mar 2010 17:35:24 +0000
Received: from mail-gy0-f177.google.com (mail-gy0-f177.google.com
	[209.85.160.177]) by hi.ry.ca (Postfix) with ESMTPSA id 248FC170E68
	for <linux-mtd@lists.infradead.org>;
	Mon,  8 Mar 2010 12:43:05 -0500 (EST)
Received: by gyd12 with SMTP id 12so3017296gyd.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 08 Mar 2010 09:35:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <62cbdcd91003080324v64e6855yf5471e63b9ae83cb@mail.gmail.com>
References: <56a87efc1003041025n7d7f8d7ud740b259308fea7@mail.gmail.com>
	<D47DD163F8914C69B534C8AA8FF3258F@WINXP>
	<56a87efc1003041233o8c10a1fif541dc9efee6462c@mail.gmail.com>
	<56a87efc1003041401t4382d2i504b309a6c98d3d7@mail.gmail.com>
	<62cbdcd91003050156g404106a5pfdf10bb29d9ce837@mail.gmail.com>
	<56a87efc1003050936j57e8d879q70855a5724fa3be9@mail.gmail.com>
	<56a87efc1003051322td74992cide1ca01776c24646@mail.gmail.com>
	<OF4610A640.936AF9C9-ONC12576DE.0053D1BE-C12576DE.005469DA@transmode.se>
	<62cbdcd91003080324v64e6855yf5471e63b9ae83cb@mail.gmail.com>
Date: Mon, 8 Mar 2010 11:35:14 -0600
Message-ID: <56a87efc1003080935n35d8a9ffl96b18b4b467c8e5c@mail.gmail.com>
Subject: Re: JFFS2 errors on ppc-4xx with CFI NOR flash
From: Ryan Thompson <i@ry.ca>
To: massimo cirillo <maxcir@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Massimo.CIRILLO@numonyx.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thank you Massimo. I received your private email and will respond from
my company address with the info you've asked for.

- R

On Mon, Mar 8, 2010 at 5:24 AM, massimo cirillo <maxcir@gmail.com> wrote:
> Ryan,
> the reason of bad performances is the disabling of erase suspend on
> every request (read and write), so when the garbage starts to free some
> blocks with erase, this erase cannot be suspended.
> If the performance is a problem for you, I should investigate about the
> flash device you are using.
> I'll write to you in private.
>
> 2010/3/6 Joakim Tjernlund <joakim.tjernlund@transmode.se>:
>>
>>>
>>> I also created the attached gnuplot graph showing the time taken to
>>> write 128KiB files versus the filesystem utilization. Note that the
>>> underlying partition size is 32128KiB.
>>>
>>> In case attachments don't work on linux-mtd, the graph is also hosted
>>> at http://ry.ca/clients/jffs2-128KiB.png
>>
>> I am guessing the flash is busy erasing blocks so writes have to wait.
>> What if you pause your test when it starts to get slow for a few mins
>> and continue?
>>
>> it is strange though that erase suspend isn't working for you. I have
>> no such problems and I use numonyx too, but not this exact part(don't ha=
ve
>> part info available ATM)
>>
>>>
>>> - R
>>>
>>> On Fri, Mar 5, 2010 at 11:36 AM, Ryan Thompson <i@ry.ca> wrote:
>>> > On Fri, Mar 5, 2010 at 3:56 AM, massimo cirillo <maxcir@gmail.com> wr=
ote:
>>> >> I suppose you don't have CONFIG_MTD_XIP enabled.
>>> >> So in order to completely disable the suspend,
>>> >> please in chip_ready() function just after "case FL_ERASING:"
>>> >> (line 775) put the line "goto sleep;" and repeat your test.
>>> >> Let me know.
>>> >
>>> > By skipping the FL_ERASING case as you suggested, my test now
>>> > completes successfully without any INFO-or-higher kernel messages.
>>> >
>>> > However, it still takes a very long time. The initial files are
>>> > written out quickly (subjectively, performance seems similar to raw
>>> > mtd speed). However, after 50% or so, performance begins to degrade
>>> > dramatically. At 65%, a 256KiB file takes 11 sec to write. At 75%, 20
>>> > sec. 90%, 38 sec. 95%, 77 sec. 99%, 121 sec. The entire test took 28.=
4
>>> > minutes to go from 3%-100% on the ~32MiB partition.
>>> >
>>> > Performance seems somewhat consistent with my previous result:
>>> >
>>> >> 2010/3/4 Ryan Thompson <i@ry.ca>:
>>> >>> The errors continued until the filesystem actually reported 100% fu=
ll
>>> >>> and my script terminated. The entire 3%-100% operation took about 2=
1
>>> >>> minutes for <32MiB, and was definitely much slower towards the end
>>> >>> with all the errors.
>>> >
>>> > I've done a flash_eraseall -j followed by a reboot before each run.
>>> >
>>> > I also benchmarked the mtdblock performance without JFFS2 (also
>>> > getting input from urandom):
>>> >
>>> > # time dd if=3D/dev/urandom of=3D/dev/mtdblock16
>>> > dd: writing '/dev/mtdblock16': No space left on device
>>> > 64257+0 records in
>>> > 64256+0 records out
>>> > Command exited with non-zero status 1
>>> > real =A0 =A05m 30.17s
>>> > user =A0 =A00m 0.08s
>>> > sys =A0 =A0 1m 2.66s
>>> > # perl -le 'printf("bytes written =3D 0x%08x\n", 64256 * 512);'
>>> > bytes written =3D 0x01f60000
>>> > # grep modules /proc/mtd
>>> > mtd16: 01f60000 00020000 "modules"
>>> >
>>> > - R
>>> >
>>> [attachment "jffs2-128KiB.png" deleted by Joakim Tjernlund/Transmode]
>>> ______________________________________________________
>>> Linux MTD discussion mailing list
>>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>
>>
>
