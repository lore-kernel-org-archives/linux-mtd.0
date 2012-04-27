Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SNjJq-0007DE-1a
 for linux-mtd@lists.infradead.org; Fri, 27 Apr 2012 11:26:35 +0000
Received: by wibhj13 with SMTP id hj13so387787wib.0
 for <linux-mtd@lists.infradead.org>; Fri, 27 Apr 2012 04:26:31 -0700 (PDT)
Subject: Re: [PATCH] mtd: nand: omap: fix race condition in omap_wait()
Mime-Version: 1.0 (Apple Message framework v1257)
Content-Type: text/plain; charset=us-ascii
From: Mark Olleson <mark.olleson@yamaha.co.uk>
In-Reply-To: <1335505821.1767.2.camel@koala>
Date: Fri, 27 Apr 2012 12:26:28 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <8C6340D0-2780-4E43-97C1-6F68013DBF37@yamaha.co.uk>
References: <1334661113-24709-1-git-send-email-ivan.djelic@parrot.com>
 <1335505821.1767.2.camel@koala>
To: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On 27 Apr 2012, at 06:50, Artem Bityutskiy wrote:

> On Tue, 2012-04-17 at 13:11 +0200, Ivan Djelic wrote:
>> If a context switch occurs in function omap_wait() just before the
>> while loop is entered, then upon return from context switch the
>> timeout may already have elapsed: in that case, status is never
>> read from NAND device, and omap_wait() returns an error.
>> This failure has been experimentally observed during stress tests.
>>=20
>> This patch ensures a NAND status read is always performed before
>> returning, as in the generic nand_wait() function.
>>=20
>> Signed-off-by: Ivan Djelic <ivan.djelic@parrot.com>
>=20
> Pushed this one to l2-mtd.git, thanks!
>=20

I'm investigating a problem where omap_wait() returns (apparently after =
the timeout) without the device being ready.    In my case, the loop has =
run at least once (my system is lightly loaded so cond_resched() is =
unlikely to block us for long).   This patch will help in the case where =
cond_resched() blocks the tread beyond the timeout as well as the case =
where a context switch occurs before ever reading a value.=20

When the timeout is reached without the device becoming ready,  =
omap_wait() returns with a status value with the NAND_STATUS_FAIL clear, =
but in many places where omap_wait() is called from only check for  =
NAND_STATUS_FAIL, and then go on to issue further commands to the device =
- which fail.  =20

This includes the code enabled by CONFIG_MTD_NAND_VERIFY_WRITE when then =
reads back garbage and fails.



Mark
---
Mark Olleson - Senior R&D Engineer
Technology Research & Development Group
Yamaha R&D Centre London
