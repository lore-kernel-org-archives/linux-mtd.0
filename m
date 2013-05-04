Received: from mail-pa0-f54.google.com ([209.85.220.54])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UYh8y-0001aa-RI
 for linux-mtd@lists.infradead.org; Sat, 04 May 2013 18:25:13 +0000
Received: by mail-pa0-f54.google.com with SMTP id kx1so1423298pab.13
 for <linux-mtd@lists.infradead.org>; Sat, 04 May 2013 11:24:49 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
Subject: Re: UBI fastmap used PEB search
From: Brian Pomerantz <bapper@gmail.com>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E9C09DB@DBDE04.ent.ti.com>
Date: Sat, 4 May 2013 11:24:46 -0700
Content-Transfer-Encoding: quoted-printable
Message-Id: <F80CE295-24D3-4739-824F-C37A48286AF4@gmail.com>
References: <6C00A5CD-15B0-41F3-9505-276081572E77@gmail.com>
 <CAFLxGvwavoqqi6CTrNq+ASS-tch7sWou7z3QfmbMe6RKiFxSDQ@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9C09DB@DBDE04.ent.ti.com>
To: "Gupta, Pekon" <pekon@ti.com>
Cc: richard -rw- weinberger <richard.weinberger@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On May 1, 2013, at 10:26 PM, "Gupta, Pekon" <pekon@ti.com> wrote:

> Hi,
>=20
>> The current fastmap implementation is more or less a prove of concept
>> implementation,
>> I'm sure there is potential to gain more performance.
>> Patches are very welcome!
>>=20
> [Pekon]: As I hope, you are actively working on reducing the UBI boot
> time, Will it be possible for you to test following patches ?
> http://lists.infradead.org/pipermail/linux-mtd/2013-April/046680.html
> http://lists.infradead.org/pipermail/linux-mtd/2013-April/046678.html
>=20
> The patch description should help you understand it.
>=20

I'll see if I can give those patches a try next week.  I went on to =
implement the used list in ubi_attach_fastmap() as a RB tree and knocked =
off 100ms from my attach time with a nearly full flash and 4 volumes.  =
I'll post a patch later this weekend when I get more time.  My attach =
time is now 57ms with my current setup, I may stop looking for more =
speedups for a bit with that change, I have some other higher priority =
tasks to work on.


--Brian
