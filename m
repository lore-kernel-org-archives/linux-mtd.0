Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YsUOY-00038M-O2
 for linux-mtd@lists.infradead.org; Wed, 13 May 2015 11:00:11 +0000
Message-ID: <55532EA1.1060302@nod.at>
Date: Wed, 13 May 2015 12:59:45 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Michael Niarchos <michael.niarchos@gmail.com>
Subject: Re: Cannot mount ubifs partition
References: <5552EE30.8060203@gmail.com>	<5552EE77.8050202@gmail.com>
 <CAFLxGvx+dqdKPJjQx5aHkuM561WLvWR1-AYP5VGBND6JctXpFA@mail.gmail.com>
 <55530FC7.400@gmail.com> <55531046.80304@nod.at> <555311C7.8060601@gmail.com>
 <55531263.5060908@nod.at> <55531421.1030700@gmail.com>
 <5553174C.6000000@nod.at> <55531CB7.7070108@gmail.com>
 <55532493.5010407@nod.at> <5553286E.2090303@gmail.com>
 <55532AA2.5020808@nod.at> <55532E5C.9070509@gmail.com>
In-Reply-To: <55532E5C.9070509@gmail.com>
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

Am 13.05.2015 um 12:58 schrieb Michael Niarchos:
> $ modprobe ubifs
> modprobe: module ubifs not found in modules.dep
> 
> I think that this is a problem of my minimal built kernel.

*gnahhhh*. No ubifs for you.
Thus is why mount is failing...

Thanks,
//richard
