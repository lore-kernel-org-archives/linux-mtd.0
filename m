Received: from smtp3.infineon.com ([203.126.106.229])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IV2AH-00005P-Hh
	for linux-mtd@lists.infradead.org; Tue, 11 Sep 2007 05:36:27 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: How to use MTD util: nandwrite
Date: Tue, 11 Sep 2007 17:36:11 +0800
Message-ID: <BA6FCA7F70D9FD43B88BFB2DD4E6EB7701136FCB@xiyse301.ap.infineon.com>
In-Reply-To: <49eab5c80709110223k525104f5ke965b190f16f634f@mail.gmail.com>
References: <BA6FCA7F70D9FD43B88BFB2DD4E6EB7701136E41@xiyse301.ap.infineon.com>
	<49eab5c80709110223k525104f5ke965b190f16f634f@mail.gmail.com>
From: <Wanghao.Yu@infineon.com>
To: <falls.huang@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
Thanks for your answer.
I already corrected the error.
Anyway,thank you again.=20


Best Regards,

Yu Wanghao (Helen)
Component Verification
COM IFCX CV
Infineon Technologies
CV Lab,F3, Block A, No.38, Gaoxin 6th Road,=20
Xi'an High-tech Industries Development Zone,=20
Xi'an,  P.R.China 710075=20
Tel.	+86 29 8832 8222 ext 8513
Fax 	+86 29 8831 7279
mailto:wanghao.yu@infineon.com


-----Original Message-----
From: falls huang [mailto:falls.huang@gmail.com]=20
Sent: Tuesday, September 11, 2007 5:23 PM
To: Yu Wanghao (IFCX COM CV)
Cc: linux-mtd@lists.infradead.org
Subject: Re: How to use MTD util: nandwrite

Hello Yu Wanghao!

   It's seemed that you made a low level mistake.

   Plz read the the nandwrite's usage and code carefully:  "Usage:
nandwrite [OPTION] MTD_DEVICE INPUTFILE" ,  but your command is :
"nandwrite /tmp/hello /dev/mtd0 ."

   RTFM !

2007/9/11, Wanghao.Yu@infineon.com <Wanghao.Yu@infineon.com>:
> Hi,
> I met a problem when I used nandwrite to copy file to NandFlash.
> The command I used is as follows.
> #nandwrite /tmp/hello /dev/mtd0 (copy file named hello to /dev/mtd0)=20
> The error message is
> MEMGETINFO: Inappropriate ioctl for device.
> Before using nandwrite, I have already used "flash_eraseall -j
/dev/mtd0" to erase the NandFlash.
> I don't know where the problem is.
> Could anyone help me?
>
> Best Regards,
>
> Yu Wanghao (Helen)
> Component Verification
> COM IFCX CV
> Infineon Technologies
> CV Lab,F3, Block A, No.38, Gaoxin 6th Road, Xi'an High-tech Industries

> Development Zone, Xi'an,  P.R.China 710075
> Tel.    +86 29 8832 8222 ext 8513
> Fax     +86 29 8831 7279
> mailto:wanghao.yu@infineon.com
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>


--
Regards
Falls Huang
