Received: from mail-wi0-f182.google.com ([209.85.212.182])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZoWso-0002xl-Db
 for linux-mtd@lists.infradead.org; Tue, 20 Oct 2015 13:23:19 +0000
Received: by wijp11 with SMTP id p11so47265310wij.0
 for <linux-mtd@lists.infradead.org>; Tue, 20 Oct 2015 06:22:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20151013001153.GS107187@google.com>
References: <1427984026-31100-1-git-send-email-richard@nod.at>
 <20150402160451.GF32500@ld-irv-0074> <551D6BDA.6000606@nod.at>
 <20150412213120.0414fee5@bbrezillon>
 <20151013001153.GS107187@google.com>
Date: Tue, 20 Oct 2015 10:22:56 -0300
Message-ID: <CAAEAJfBm-b3GrzJEQGYeJT53gk9HqrJFD--4EF6qbNk7dK9ewA@mail.gmail.com>
Subject: Re: [PATCH] mtd: Add simple read disturb test
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On 12 October 2015 at 21:11, Brian Norris <computersforpeace@gmail.com> wro=
te:
> Resurrecting this old thread, since it was mentioned at ELCE.
>
> On Sun, Apr 12, 2015 at 09:31:20PM +0200, Boris Brezillon wrote:
>> On Thu, 02 Apr 2015 18:18:34 +0200
>> Richard Weinberger <richard@nod.at> wrote:
>> > Am 02.04.2015 um 18:04 schrieb Brian Norris:
>> > > On Thu, Apr 02, 2015 at 04:13:46PM +0200, Richard Weinberger wrote:
>> > >> This simple MTD tests allows the user to see when read disturb happ=
ens.
>> > >> By reading blocks over and over it reports flipped bits.
>> > >> Currently it reports only flipped bits of the worst page of a block=
.
>> > >> If within block X page P1 has 3 bit flips and P6 4, it will report =
4.
>> > >> By default every 50th block is read.
>> > >
>> > > Didn't read through this much yet, but why do we need another in-ker=
nel
>> > > test that coul (AFAICT) be easily replicated in userspace? The same =
goes
>> > > for several of the other tests, I think, actually. But at least with
>> > > those, we have a history of keeping them around, so it's not too muc=
h
>> > > burden [1].
>> >
>> > I've added the test to drivers/mtd/tests/ because it fits into.
>> > As simple as that.
>> >
>> > > Brian
>> > >
>> > > [1] Although there are some latent issues in these tests that are st=
ill
>> > > getting get worked out (e.g., bad handling of 64-bit casting; too la=
rge
>> > > of stacks; uninterruptibility). The latter two would not even exist =
if
>> > > we were in user space.
>> >
>> > uninterruptibility got solved by my "[PATCH] mtd: Make MTD tests cance=
lable" patch.
>> >
>> > But if we want to kill drivers/mtd/tests/ I'll happily help out.
>>
>> I'd vote for that solution too.
>> I've looked at in-kernel mtd tests, and I'm pretty sure they can all be
>> done in userland.
>> This would prevent any kernel crash caused by buggy test modules.
>>
>> > Where shall we move these tests into? mtd-utils?
>>
>> I guess so, but I'll let Brian answer that one.
>> How about dispatching them in mtd-utils' tests/ directory (some of them
>> are NAND related tests, so creating a tests/nand would make sense,
>> and others are more generic).
>

... and the converse also applies. The 'nandtest' tool is not that
NAND-specific,
and I've used it as a quick test on other types of flash devices.

> mtd-utils makes sense to me. If we're going to do this, let's make it a
> policy to not add more to drivers/mtd/tests/ then. For instance, this
> one [1]. Also, would we drop the in-kernel tests completely?
>
> If we make the move, we'd need to make sure to update the documentation
> (mtd-www.git).
>

+1 for improving mtd-utils and dropping in-kernel tests.

--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
