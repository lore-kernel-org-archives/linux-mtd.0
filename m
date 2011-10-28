Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RJsiz-0001GH-8b
	for linux-mtd@lists.infradead.org; Fri, 28 Oct 2011 20:08:21 +0000
Received: by faaf16 with SMTP id f16so5334069faa.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 28 Oct 2011 13:08:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAN8TOE_zHOtmTXkvr-pd25nDUR10i2V7kEGWeSR3wKW99gdwYg@mail.gmail.com>
References: <CAEq8YR8Vq1mDxOovREb5CBH-PfoWAP4_p-54W4icZ8bvip90Eg@mail.gmail.com>
	<CAEq8YR_pw4LO_1wvUELXR9Q7e11NA6xU0_082hYJ=oyZd5+=8g@mail.gmail.com>
	<CAEq8YR8wu5xL_nL8==m3gin+R50QsZiQPbuEM=gR98XeXCEn0g@mail.gmail.com>
	<CAN8TOE-1+0F=80jYpMQC5+V70BMpqnUZxTZ72tQ9_fy3K2F=-w@mail.gmail.com>
	<CAEq8YR8op9MSb3THcJ=-G5rUiYKgyESkiR1_gvdbuaPL=vv_Jg@mail.gmail.com>
	<CAN8TOE_zHOtmTXkvr-pd25nDUR10i2V7kEGWeSR3wKW99gdwYg@mail.gmail.com>
From: Robert Orzanna <orschiro@googlemail.com>
Date: Sat, 29 Oct 2011 09:07:38 +1300
Message-ID: <CAEq8YR-SuR4cvmxY9B1nLQGriWfzf_hVZcr3X=3mNdFci6-2xw@mail.gmail.com>
Subject: Re: Access to a xd memory card
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
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

Thanks Brian!

Now I understand the basic functionality.

Cheers,

PS: Thanks for the hint with the Cc. Will keep that in mind.

2011/10/29 Brian Norris <computersforpeace@gmail.com>:
> On Fri, Oct 28, 2011 at 12:39 PM, Robert Orzanna
> <orschiro@googlemail.com> wrote:
>> Very much thanks for the hint with SSFDC. Loading the module
>> immediately created a mountable device.
>>
>> Finally I can access my camera picture. Yes!
>
> Great!
>
>> Just for the understanding. SSFDC is the file system of my xD card and
>> by loading the module the SSFDC system can be mounted?
>
> No, the SSFDC module implements a software "Flash Translation Layer"
> so that Linux can treat it as a block device. The filesystem is still
> (probably) FAT, like you might use for USB flash drives or SD memory
> cards. You can read a little more on the =A0Linux-MTD website. Ignore
> the stuff specifically about UBIFS (a different filesystem for flash)
> and note that xD memory is like the "raw flash devices" mentioned:
>
> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_raw_vs_ftl
>
> BTW, if you want a response from specific individuals (e.g., me), it's
> usually a good idea to Reply-All so that the e-mail address appears in
> To/CC.
>
> Brian
>
