Received: from mail-ig0-x232.google.com ([2607:f8b0:4001:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YUZEb-0000FF-L9
 for linux-mtd@lists.infradead.org; Sun, 08 Mar 2015 11:19:02 +0000
Received: by igbhn18 with SMTP id hn18so14112862igb.2
 for <linux-mtd@lists.infradead.org>; Sun, 08 Mar 2015 04:18:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150308005720.GF12966@brian-ubuntu>
References: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com>
 <CACna6rykQTjtfL8mqHJ4ZSY9Ci+kVhjDfDkjRpsFvg4YatNATw@mail.gmail.com>
 <20150308005720.GF12966@brian-ubuntu>
Date: Sun, 8 Mar 2015 12:18:39 +0100
Message-ID: <CACna6rz_iya8UMdDvsOSA0NSvc2YxNJ1GObqBLtr8Xd2-9enCQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] mtd: nand: add Broadcom NAND controller support
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 Corneliu Doban <cdoban@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Kevin Cernekee <cernekee@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jonathan Richardson <jonathar@broadcom.com>,
 Anatol Pomazao <anatol@google.com>, bcm-kernel-feedback-list@broadcom.com,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Dmitry Torokhov <dtor@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 8 March 2015 at 01:57, Brian Norris <computersforpeace@gmail.com> wrote:
> 3. I was told that there were only 2 or 3 chips that were released with
> a v6.1 NAND controller, and BCM4708 wasn't one of them. Apparently I was
> told wrong... I'll have to see if there are any other quirks we should
> be accounting for.

Please note I'm speaking about 6.01, not 6.10. Maybe it make a difference?

Buffalo WZR-600DHP2 (BCM47081)
[    0.325732] [brcmnand_revision_init:371] ctrl->nand_version:0x0601
[    4.838105] bcma: bus0: Found chip with id 53010, rev 0x00 and package 0=
x02

Buffalo WZR-1750DHP (BCM4708)
[    0.326823] [brcmnand_revision_init:371] ctrl->nand_version:0x0601
[    6.674288] bcma: bus0: Found chip with id 53010, rev 0x00 and package 0=
x02

Netgear R6250 V1 (BCM4708)
[    0.326248] [brcmnand_revision_init:371] ctrl->nand_version:0x0601
[    8.721335] bcma: bus0: Found chip with id 53010, rev 0x00 and package 0=
x02

Netgear R8000 (BCM4709)
[    0.241961] bcma: bus0: Found chip with id 53010, rev 0x00 and package 0=
x00
[    1.990330] bcm_nand bcma0:18: NAND Controller rev 6.01

--=20
Rafa=C5=82
