Received: from mta-blr1.sasken.com ([203.200.200.72])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lm6MF-0002mW-TN
	for linux-mtd@lists.infradead.org; Tue, 24 Mar 2009 13:08:12 +0000
From: Ravi Vasarla <ravi.vasarla@sasken.com>
To: Juergen Beisert <jbe@pengutronix.de>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Date: Tue, 24 Mar 2009 18:37:47 +0530
Subject: RE: DOC2000 flash: Do I miss something?
Message-ID: <022F54DCE6CCCD45A5F9DF0B0B7BFEEB0635624082@EXGMBX01.sasken.com>
References: <200903230852.02597.jbe@pengutronix.de>
	<200903232029.32897.jbe@pengutronix.de>
	<022F54DCE6CCCD45A5F9DF0B0B7BFEEB0635624080@EXGMBX01.sasken.com>,
	<200903241349.58312.jbe@pengutronix.de>
In-Reply-To: <200903241349.58312.jbe@pengutronix.de>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Check the MTD drivers write size, usually pagesize is same as the writesize=
.=20
 In nandwrite.c the ioctl will fired only when passed the option like -a (a=
utoplace) -n (noecc) passed. I guess it should not give below
 error with -j option. Check with the latest version of mtd-util of nandwri=
te.c file

Regards,
Ravi

________________________________________
From: Juergen Beisert [jbe@pengutronix.de]
Sent: Tuesday, March 24, 2009 18:19
To: linux-mtd@lists.infradead.org
Cc: Ravi Vasarla
Subject: Re: DOC2000 flash: Do I miss something?

Hi,

On Dienstag, 24. M=E4rz 2009, Ravi Vasarla wrote:
> Just check with nandwrite with option -j (--jffs2 oob layout) instead of
> autoplace oob layout.

I tried:

$ flash_eraseall -j /dev/mtd1
$ nandwrite -j /dev/mtd1 /root.jffs2
MEMSETOOBSEL: Inappropriate ioctl for device

Only the "-a" option given to "nandwrite" works. Maybe my image is wrong. I
took a look into the email archives you mentioned and change it to:

(note: Host is x86 and also the target)

$ mkfs.jffs2 -d images/work_dir --eraseblock=3D0x4000 -n -p \
        --pagesize=3D512 -o images/root.jffs2

I'm unsure about the eraseblock and pagesize option. /proc/mtd tells me:

$ cat /proc/mtd
dev:    size   erasesize  name
[...]
mtd1: 01000000 00004000 "DiskOnChip 2000 (NFTL Model)"

But nothing about the pagesize.

Regards,
Juergen
SASKEN BUSINESS DISCLAIMER
-------------------------
This message may contain confidential, proprietary or legally privileged in=
formation. In=20
case you are not the original intended Recipient of the message, you must n=
ot, directly or=20
indirectly, use, Disclose, distribute, print, or copy any part of this mess=
age and you are=20
requested to delete it and inform the sender. Any views expressed in this m=
essage are=20
those of the individual sender unless otherwise stated. Nothing contained i=
n this message=20
shall be construed as an offer or acceptance of any offer by Sasken Communi=
cation=20
Technologies Limited ("Sasken") unless sent with that express intent and wi=
th due=20
authority of Sasken. Sasken has taken enough precautions to prevent the spr=
ead of=20
viruses. However the company accepts no liability for any damage caused by =
any virus=20
transmitted by this email
