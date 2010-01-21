Received: from mail-pz0-f195.google.com ([209.85.222.195])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NXw6H-00027m-Bv
	for linux-mtd@lists.infradead.org; Thu, 21 Jan 2010 12:25:30 +0000
Received: by pzk33 with SMTP id 33so1809648pzk.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Jan 2010 04:25:23 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1263676480.8276.107.camel@localhost.localdomain>
References: <c58fcbf21001080316j4ff51fe6wcb20eefd0d57e101@mail.gmail.com>
	<1263676480.8276.107.camel@localhost.localdomain>
From: Shweta Shetty <shyamashweta@gmail.com>
Date: Thu, 21 Jan 2010 17:55:03 +0530
Message-ID: <c58fcbf21001210425i3122677fw45f5628a2e36e89@mail.gmail.com>
Subject: Re: Ubi2- using NandSim for simulating flash and mounting ubi.
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi ,
Thank you for your help.
We had not tried the "ubinize" utility and hence were not able to
mount ubi with the saved data.
Having followed your instructions , we tried it and it works perfectly fine=
 now.
Thank you again !

On Sun, Jan 17, 2010 at 2:44 AM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
>
> Hi,
>
> sorry, I am not sure understand the question.
>
> On Fri, 2010-01-08 at 16:46 +0530, Shweta Shetty wrote:
> > Hi,
> >
> > To test ubi2 we intend to use NANDSIM. However we are facing certain pr=
oblems.
> >
> > From what we have understood, the method of using NANDSIM is :
> > 1>create an empty flash device (By default this uses the ram memory
> > but we can allocate other by the cache_file option)
> > 2>mount ubi on it
> > 3>mount ubifs on it
> > =3D> (Here we can load the previously stored image)
>
> If you want to write some pre-created image (e.g., created with
> mkfs.ubifs/ubinize) or previously saved image (e.g., you dumped
> your /dev/mtdX to a file previously), then you have to do this _before_
> attaching the MTD device to UBI. IOW, you have to do this between steps
> 1 and 2.
>
> > 4>use it
> > 5>while unmounting save the image on permanant storage
>
> After you have unmounted everything, you can save it, yes.
>
> > So as we can see, though NANDSIM can be effectively used for
> > simulating flash , it is of limited use in our project for testing
> > mount time as every time only the empty device is mounted.
>
> No. You can write your contents there before mounting.
>
> > From the ubi code that we have now studied , there is a flag set for
> > an empty device and in such case , all the system does is that it
> > initialises all its data structures.
>
> It does this _only_ if you feed it an empty flash. Do not feed it an
> empty flash, feed it a formatted flash, then it will not initialize it.
>
> > Hence we cannot show the
> > performance of our project on NANDSIM.
>
> Well, of course in any case, performance is better shown on a real
> device.
>
> > Our we missing some crucial point?
> > We would be grateful for clarification.
>
> Not sure I clarified, because I did not really understand the question,
> but HTH.
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>



--
Shweta Shetty
http://shweta-kaleidoscope.blogspot.com/
Humility is a strange thing. The minute you know you have got it you
have lost it.
