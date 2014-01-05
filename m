Received: from mail-oa0-x22a.google.com ([2607:f8b0:4003:c02::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vzwgq-0003py-Og
 for linux-mtd@lists.infradead.org; Sun, 05 Jan 2014 23:01:05 +0000
Received: by mail-oa0-f42.google.com with SMTP id i4so18274755oah.1
 for <linux-mtd@lists.infradead.org>; Sun, 05 Jan 2014 15:00:42 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20140105224944.GC25372@norris-Latitude-E6410>
References: <1387651152-3884-1-git-send-email-zajec5@gmail.com>
 <20140105224944.GC25372@norris-Latitude-E6410>
Date: Mon, 6 Jan 2014 00:00:40 +0100
Message-ID: <CACna6rw_0g6mssZTq85gVTQJ6PNVw5w755qmOVg=xv1bRDdeDA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: bcm47xxpart: find boot partition by CFE magic
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2014/1/5 Brian Norris <computersforpeace@gmail.com>:
>> Both patches were verified with
>> ./verify ../linux/l2-mtd/ mips-bcm47xx_defconfig < patch
>
> Nice to know I'm not the only one running these tools :)

Artem taught me to! ;)

--=20
Rafa=C5=82
