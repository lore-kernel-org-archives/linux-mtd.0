Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ysojg-0003Kz-Mo
 for linux-mtd@lists.infradead.org; Thu, 14 May 2015 08:43:21 +0000
Message-ID: <55546011.20909@nod.at>
Date: Thu, 14 May 2015 10:42:57 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Sheng Yong <shengyong1@huawei.com>,
 Michael Niarchos <michael.niarchos@gmail.com>
Subject: Re: Cannot mount ubifs partition
References: <5552EE30.8060203@gmail.com>	<5552EE77.8050202@gmail.com>
 <CAFLxGvx+dqdKPJjQx5aHkuM561WLvWR1-AYP5VGBND6JctXpFA@mail.gmail.com>
 <55530FC7.400@gmail.com> <55531046.80304@nod.at> <555311C7.8060601@gmail.com>
 <55531263.5060908@nod.at> <55531421.1030700@gmail.com>
 <5553174C.6000000@nod.at> <55541A6B.6060406@huawei.com>
 <555455B8.5010101@nod.at> <55545BC8.3010207@huawei.com>
In-Reply-To: <55545BC8.3010207@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 14.05.2015 um 10:24 schrieb Sheng Yong:
>> Isn't this the behavior that all device drivers have?
> Yes, I think so. I just considered that is there any point to do something
> to avoid this, when I read the mail that you suggest Michael to check the
> device node. :-)

We already have a solution for that, udev and devtmpfs.
If you create the nodes by hand you're on your own.
Sadly some embedded folks still do, that's why I was asking...

Thanks,
//richard
