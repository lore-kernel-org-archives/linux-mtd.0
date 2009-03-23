Received: from mta-blr1.sasken.com ([203.200.200.72])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lln8P-0000gx-Fx
	for linux-mtd@lists.infradead.org; Mon, 23 Mar 2009 16:36:28 +0000
From: Ravi Vasarla <ravi.vasarla@sasken.com>
To: Ico Hristo <ico.yankov@gmail.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Date: Mon, 23 Mar 2009 22:03:21 +0530
Subject: RE: Create remove resize MTD partitions at runtime...is it possible?
Message-ID: <022F54DCE6CCCD45A5F9DF0B0B7BFEEB063562407F@EXGMBX01.sasken.com>
References: <5cd8ec960903230511m11d0bd2clb440d0f634f278b2@mail.gmail.com>
In-Reply-To: <5cd8ec960903230511m11d0bd2clb440d0f634f278b2@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
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

What do you mean the system up? does it means the MTD driver is loaded, the=
n you want to change the mtd partition? in that case it is not possible to =
change the mtd partitions details.
 As the entire partition is mapped by the respective MTD driver only once, =
so once it is configured as read only then it will only change by MTD drive=
r modification.

Regards,
Ravi

________________________________________
From: linux-mtd-bounces@lists.infradead.org [linux-mtd-bounces@lists.infrad=
ead.org] On Behalf Of Ico Hristo [ico.yankov@gmail.com]
Sent: Monday, March 23, 2009 17:41
To: linux-mtd@lists.infradead.org
Subject: Create remove resize MTD partitions at runtime...is it possible?

Hello,

I'm trying to find out whether I can create and MTD partition after
the system is loaded. I'm running custom embedded linux on arm9 custom
board, the four MTD partitions are defined in cmdlinepart and the
first one is marked as read-only. The concrete question is whether
it's possilbe and what should I do to create mtd4 that overlaps mtd0
and mtd1 dynamically while the system is up and running (in ramdisk) ?

I've researched the topic and mtd source tree and the best I could do
is create new MTD within the boudries of existing one (this also could
solve my problem, but does not overrides the read-only attribute on
mtd0). Any help would be greatly appreciated.

Best regards,
Hristo Yankov

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
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
