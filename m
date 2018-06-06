Received: from mail1.sonicwall.com ([67.115.118.17] helo=es8300.sonicwall.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat
 Linux)) id 1fQMRH-0002yZ-CS
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2018 00:36:37 +0000
Received: from es8300.sonicwall.com (127.0.0.1) id h2sm960171sd for
 <linux-mtd@lists.infradead.org>;
 Tue, 5 Jun 2018 17:32:23 -0700 (envelope-from <iharutyunov@SonicWall.com>)
From: Iosif Harutyunov <iharutyunov@SonicWall.com>
To: "Cilli, Simone" <Simone.Cilli@datalogic.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Iosif
 Harutyunov" <iharutyunov@SonicWall.com>
Subject: RE: Fix race condition between ubi device creation and udev
Date: Wed, 6 Jun 2018 00:32:23 +0000
Message-ID: <df622c273e6347b986ad1beabc08ef2b@SonicWall.com>
References: <A29B57B7E2E9754091028DB7A4D3892B9BAD7CCC@BLQSRV405.dl.net>
In-Reply-To: <A29B57B7E2E9754091028DB7A4D3892B9BAD7CCC@BLQSRV405.dl.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
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

> From: Cilli, Simone <Simone.Cilli@datalogic.com>=20
> Sent: Tuesday, June 5, 2018 3:51 AM
> To: Iosif Harutyunov <iharutyunov@SonicWall.com>
> Subject: ubi: Fix race condition between ubi device creation and udev

> I found your name in a commit on Github. The related bug was a race condi=
tion while executing UBI attach operation on Linux system=20
> (https://github.com/torvalds/linux/commit/714fb87e8bc05ff78255afc0dca981e=
8c5242785).
> This problem affects some of our devices with flash NOR. We are executing=
 an ubitattach and right after a mount. Your fix solve the defect.

It's been a while since I found and addressed the problem, but I do remembe=
r some details.=20

> I'm now trying to understand which are the possible causes, if there are =
any, that can increase the probability to generate the problem
> (flash life time, number of write, ...). This is important to estimate th=
e occurrences of the problem on our devices already on the field.
> Did you do any study about it?

No, I did not collect such data, since in our case problem was 100% reprodu=
cible. I found the problem basically by reviewing the code and noticing pot=
ential race condition.
I don't think this is related to flash characteristics. My understanding bi=
ggest factors here was the platform itself: combination of the CPU and IO.
Some platforms are more susceptible to this racing condition, while others =
don't.

I hope this helps.
Regards.

Iosif Harutyunov
Sr. Distinguished Engineer, Platform Software Engineering
P:  +1 408-962-8136     E:  iharutyunov@sonicwall.com
SonicWall.com
