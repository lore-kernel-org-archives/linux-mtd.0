Received: from mail-ig0-x22e.google.com ([2607:f8b0:4001:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aNH1t-00073t-LJ
 for linux-mtd@lists.infradead.org; Sun, 24 Jan 2016 09:32:18 +0000
Received: by mail-ig0-x22e.google.com with SMTP id z14so17815383igp.1
 for <linux-mtd@lists.infradead.org>; Sun, 24 Jan 2016 01:31:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20160123224509.GE24744@localhost>
References: <1449277783-7369-1-git-send-email-zajec5@gmail.com>
 <20160123224509.GE24744@localhost>
Date: Sun, 24 Jan 2016 10:31:56 +0100
Message-ID: <CACna6rxuxE1y_LffMC-uhrKf8f_8S+g4JC=0jfLQHsnzv=4OEg@mail.gmail.com>
Subject: Re: [PATCH] mtd: bcm47xxpart: limit scanned flash area on BCM47XX
 (MIPS) only
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Hauke Mehrtens <hauke@hauke-m.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 23 January 2016 at 23:45, Brian Norris <computersforpeace@gmail.com> wro=
te:
> On Sat, Dec 05, 2015 at 02:09:43AM +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
>> We allowed using bcm47xxpart on BCM5301X arch with commit:
>> 9e3afa5f5c7 ("mtd: bcm47xxpart: allow enabling on ARCH_BCM_5301X")
>>
>> BCM5301X devices may contain some partitions in higher memory, e.g.
>> Netgear R8000 has board_data at 0x2600000. To detect them we should
>> use size limit on MIPS only.
>
> Why was the siez limit imposed in the first place? Just to make the scan =
more
> efficient?

That's correct, just to save a minimal amount of time.

--=20
Rafa=C5=82
