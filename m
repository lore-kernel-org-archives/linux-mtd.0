Received: from nz-out-0506.google.com ([64.233.162.227])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IO8iw-0000pt-2x
	for linux-mtd@lists.infradead.org; Thu, 23 Aug 2007 05:11:32 -0400
Received: by nz-out-0506.google.com with SMTP id z3so255720nzf
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Aug 2007 02:11:28 -0700 (PDT)
Message-ID: <3db60e760708230211g27b99f93o67da774f64d7c556@mail.gmail.com>
Date: Thu, 23 Aug 2007 14:41:28 +0530
From: "Tushar Kapse" <tusharkapse@gmail.com>
To: "Ricard Wanderlof" <ricard.wanderlof@axis.com>
Subject: Re: MTD nand driver help
In-Reply-To: <Pine.LNX.4.64.0708230841590.8989@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <3db60e760708160941g3d2978f8i7e07c4d85a34685e@mail.gmail.com>
	<3db60e760708222317o22392948g1f3cbf69e246eba6@mail.gmail.com>
	<Pine.LNX.4.64.0708230823000.8989@lnxricardw.se.axis.com>
	<3db60e760708222340g49294138w9ce3372ab5eb50bf@mail.gmail.com>
	<Pine.LNX.4.64.0708230841590.8989@lnxricardw.se.axis.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thank you for your nice support..
here i will explain detail of my problem.
1.I have PXA255 SBC board, and ported linux 2.6.12 on it without File Syste=
m.
     Linux Image : Resides in NOR Device ( 4Mb)
     File System:  To be reside in NAND Device (128Mb). Still to be done .
2.Now i want to put JFFS2 file system on NAND device.
3. First I have created the Linux image with MTD support (also JFFS2
file system selected) and ported on NOR device. On power ON of SBC
board, Linux is booted and got error "Kernel panic - not syncing: VFS:
Unable to mount root fs on unknown-block(31,0)"
4. As there is no JFFS2 File System on it we got this error.
5. We have downloaded the MTD utilities on the host system (PC).
Kindly please tell me the procedure to put JFFS2 FS in the NAND device
for the first time.
Note that we don't have any filesystem on NAND device.

Regards,
Tushar

On 8/23/07, Ricard Wanderlof <ricard.wanderlof@axis.com> wrote:
>
> On Thu, 23 Aug 2007, Tushar Kapse wrote:
>
> > Thanx for the reply,
> > But, my problem is as follows,
> >
> > I have the board with PXA255 and want to port the Linux with MTD driver=
 support.
> > I got the steps for creating the JFFS2 file system are :
> > 1. using mkfs.jffs2 create the file system.
> > 2. using eraseall erase the /dev/mtdn device
> > 3. using nandwrite copy the jffs2 image to /dev/mtdn.
> > But, my qustion is for erasing and copping jffs2 image in  /dev/mtdn
> > device do i need to have the file system exist in the nand already.
>
> No, that should not be necessary. Copying the image using nandwrite to an
> erased nand partition /dev/mtdn should be ok.
>
> /Ricard
> --
> Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
> Axis Communications AB, Lund, Sweden            www.axis.com
> Phone +46 46 272 2016                           Fax +46 46 13 61 30
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
