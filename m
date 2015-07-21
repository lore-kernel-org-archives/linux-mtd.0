Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHQpn-0003zI-KR
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2015 06:15:24 +0000
Message-ID: <55ADE35F.6050808@nod.at>
Date: Tue, 21 Jul 2015 08:14:55 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Bhuvanchandra DV <bhuvanchandradv@gmail.com>
CC: linux-mtd@lists.infradead.org
Subject: Re: UBIFS errors when file-system is full
References: <55A3C342.9010704@gmail.com>
 <CAFLxGvzriSX-aGh_NShqP7McyZQK6bOdnOm=yXkZSUfX=r8pzw@mail.gmail.com>
 <55A48EA7.6050302@gmail.com> <55A4A896.9050500@nod.at>
 <55A4AC7A.1020203@gmail.com> <55A4ACEF.20307@nod.at>
 <55A4C866.2010400@gmail.com> <55A4CB60.2080505@nod.at>
 <55A4DF83.5080505@gmail.com> <55A4ED47.4060802@nod.at>
 <55A74812.2020906@gmail.com> <55A74AA1.2000000@nod.at>
 <55A7540C.3050900@nod.at> <55A7592D.6010906@gmail.com>
 <55A75A05.7040603@nod.at> <55ADE0F1.9090809@gmail.com>
In-Reply-To: <55ADE0F1.9090809@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Am 21.07.2015 um 08:04 schrieb Bhuvanchandra DV:
> Ran the power cut tests with fm_debug enabled, no additional logs are observed.
> After few hundred power cuts U-Boot fails to mount with -22 and kernel fails
> mounting with stack trace when reading the node.

Why U-Boot? Has U-Boot fastmap enabled?

Anyway, we need to sort out what is going on.
As fm_debug does not trigger it could also be a non-fastmap issue.
Did you try your test without fastmap being enabled?

Does your target pass UBI tests too?

> Log:
[...]
> [    2.847326] UBIFS error (ubi0:0 pid 1): ubifs_read_node: bad node type (255 but expected 3)
> [    2.866839] UBIFS error (ubi0:0 pid 1): ubifs_read_node: bad node at LEB 981:70368, LEB mapping status 1
> [    2.887961] Not a node, first 24 bytes:
> [    2.891864] 00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff                          ........................

Hmm, LEB1 is unmapped.
If you disable fastmap, does this target boot as expected?
Or is this a persistent corruption?

Thanks,
//richard
