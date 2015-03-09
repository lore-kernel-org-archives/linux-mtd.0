Received: from mail-pd0-x22a.google.com ([2607:f8b0:400e:c02::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YV1yF-0008Gk-AJ
 for linux-mtd@lists.infradead.org; Mon, 09 Mar 2015 18:00:04 +0000
Received: by pdbnh10 with SMTP id nh10so70706838pdb.4
 for <linux-mtd@lists.infradead.org>; Mon, 09 Mar 2015 10:59:42 -0700 (PDT)
Date: Mon, 9 Mar 2015 10:59:38 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH 0/3] mtd: nand: add Broadcom NAND controller support
Message-ID: <20150309175938.GV18140@ld-irv-0074>
References: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com>
 <CACna6rykQTjtfL8mqHJ4ZSY9Ci+kVhjDfDkjRpsFvg4YatNATw@mail.gmail.com>
 <20150308005720.GF12966@brian-ubuntu>
 <CACna6rz_iya8UMdDvsOSA0NSvc2YxNJ1GObqBLtr8Xd2-9enCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACna6rz_iya8UMdDvsOSA0NSvc2YxNJ1GObqBLtr8Xd2-9enCQ@mail.gmail.com>
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

On Sun, Mar 08, 2015 at 12:18:39PM +0100, Rafał Miłecki wrote:
> On 8 March 2015 at 01:57, Brian Norris <computersforpeace@gmail.com> wrote:
> > 3. I was told that there were only 2 or 3 chips that were released with
> > a v6.1 NAND controller, and BCM4708 wasn't one of them. Apparently I was
> > told wrong... I'll have to see if there are any other quirks we should
> > be accounting for.
> 
> Please note I'm speaking about 6.01, not 6.10. Maybe it make a difference?
> 
> Buffalo WZR-600DHP2 (BCM47081)
> [    0.325732] [brcmnand_revision_init:371] ctrl->nand_version:0x0601
> [    4.838105] bcma: bus0: Found chip with id 53010, rev 0x00 and package 0x02
> 
> Buffalo WZR-1750DHP (BCM4708)
> [    0.326823] [brcmnand_revision_init:371] ctrl->nand_version:0x0601
> [    6.674288] bcma: bus0: Found chip with id 53010, rev 0x00 and package 0x02
> 
> Netgear R6250 V1 (BCM4708)
> [    0.326248] [brcmnand_revision_init:371] ctrl->nand_version:0x0601
> [    8.721335] bcma: bus0: Found chip with id 53010, rev 0x00 and package 0x02
> 
> Netgear R8000 (BCM4709)
> [    0.241961] bcma: bus0: Found chip with id 53010, rev 0x00 and package 0x00
> [    1.990330] bcm_nand bcma0:18: NAND Controller rev 6.01

We've never had a MINOR number larger than 4 or 5, I think, so I haven't
actually bothered with two digits past the decimal. It's 8 bits of MAJOR
and 8 bits of MINOR, but we just call it 6.1 in all our documentation.

0x0601 == v6.1
0x0701 == v7.1

I suppose if we ever have to care (e.g., we get past 7.9), we'd probably
call it 7.10 (0x070a). Kinda like kernel versioning (and not like Ubuntu
versioning).

Brian
