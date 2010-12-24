Received: from out10.bezeqint.net ([192.115.188.217])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PW589-00016a-U1
	for linux-mtd@lists.infradead.org; Fri, 24 Dec 2010 10:44:15 +0000
Received: from mail.wellsense-tech.com (bzq-218-140-171.cablep.bezeqint.net
	[81.218.140.171])
	by out10.bezeqint.net (Postfix) with ESMTPA id 21CA33A1774
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Dec 2010 12:44:08 +0200 (IST)
From: Boaz Ben-David <boaz.bd@wellsense-tech.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Fri, 24 Dec 2010 12:40:35 +0200
Subject: RE: UBIFS reboots issue
Message-ID: <39A4B204C321D34DA3490E3B119D5A6C68BF77573E@SBS2008.wellsense.local>
References: <39A4B204C321D34DA3490E3B119D5A6C68BF77673F@SBS2008.wellsense.local><1293049245.2051.4.camel@koala>
	<39A4B204C321D34DA3490E3B119D5A6C68BF77674A@SBS2008.wellsense.local>,
	<EF949E0CEB6551499A3643069FE41ACB034B6DFC@CNSHGSMBS01.ad4.ad.alcatel.com>
In-Reply-To: <EF949E0CEB6551499A3643069FE41ACB034B6DFC@CNSHGSMBS01.ad4.ad.alcatel.com>
Content-Language: en-US
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I would very much want to try yaffs2. I cloned the git repo and patched my =
kernel using the script provided
with the yaffs code. The kernel compiled with no errors but after I mounted=
 a yaffs partition I could not create any new files on it.
Each time I try to create a file on the partition I get "cannot allocate me=
mory",,,
I haven't had much time to investigate this so if anyone has any idea why t=
his is happening, this is also a very good direction for me to go with (usi=
ng yaffs).
________________________________________
From: ZHOU Zhongjun [Zhongjun.Zhou@alcatel-sbell.com.cn]
Sent: Friday, December 24, 2010 5:23 AM
To: Boaz Ben-David; linux-mtd@lists.infradead.org
Subject: RE: UBIFS reboots issue

Why do you not to use YAFFS2 for NAND flash?  It seems that Yaffs2 is more =
popularity.


-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lists=
.infradead.org] On Behalf Of Boaz Ben-David
Sent: Thursday, December 23, 2010 8:52 PM
To: linux-mtd@lists.infradead.org
Subject: Re: UBIFS reboots issue

I am using kernel 2.6.31 for iMX35 and I'm not sure what version of UBIFS i=
s patched in there.
What do I need to do in order to patch to the latest version?
Is is enough to clone UBIFS 2.6.31 and copy over the fs/ubifs and mtd/ubi d=
irectories or are there any other directories I need to take into account?

Thanks,

Boaz.

On Wed, 2010-12-22 at 22:20 +0200, Artem Bityutskiy wrote:
> On Wed, 2010-12-22 at 16:36 +0200, Boaz Ben-David wrote:
> > Hi all,
> >
> > We have an embedded system using a Samsung 2GB MLC NAND and are
> > using UBIFS as the file system on it.
> > I have a question regarding UBIFS and hard reboots.
> > After some work with the flash (doing reads and writes to it), some
> > times one of our partitions would fail to mount.
> > I suspected this has something to do with a reboot which happens
> > during a write to the flash.
> > In order to test this I created a simple script which copies a file
> > from to the partition, syncs, then deletes it and does this
> > repeatedly until a hard reboot occurs (using the watch dog to cause the=
 boot).
> > This process repeats itself until the partition fails to mount.
> > When I performed the test mentioned above, after about 3-4 times the
> > partition would fail.
> > I am not sure if this behaviour is normal or not.
> > Did someone encounter similiar behaviour?
>
> Just curious, did you see this:
>
> http://linux-mtd.infradead.org/faq/ubifs.html#L_ubifs_mlc
>
> I do not think you can just use UBI/UBIFS on MLC as is, you'd need to
> make sure MLC-specific behavior is handled properly.
>
> --
> Best Regards,
> Artem Bityutskiy (=E2=C9=D4=C0=C3=CB=C9=CA =E1=D2=D4=A3=CD)
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
