Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ethFN-0004kB-87
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2018 22:09:18 +0000
Received: by mail-wr0-x242.google.com with SMTP id w77so3722907wrc.6
 for <linux-mtd@lists.infradead.org>; Wed, 07 Mar 2018 14:09:06 -0800 (PST)
MIME-Version: 1.0
Sender: steve.derosier@gmail.com
In-Reply-To: <20180307214342.GA9852@amd>
References: <20180303104554.5958-1-richard@nod.at> <20180306231805.GA28183@amd>
 <6772577.AmT7QaWTNU@blindfold> <20180307214342.GA9852@amd>
From: Steve deRosier <derosier@gmail.com>
Date: Wed, 7 Mar 2018 14:08:24 -0800
Message-ID: <CALLGbRK4w9Yhznt6+aqr8jptQjsp7FmbjQMPtvhh2h354n2G0A@mail.gmail.com>
Subject: Re: [PATCH] ubi: Reject MLC NAND
To: Pavel Machek <pavel@ucw.cz>
Cc: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 dedekind1@gmail.com, tharvey@gateworks.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 cyrille.pitchen@wedev4u.fr, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Pavel,

On Wed, Mar 7, 2018 at 1:43 PM, Pavel Machek <pavel@ucw.cz> wrote:
> On Wed 2018-03-07 09:01:16, Richard Weinberger wrote:
>> Pavel,
>>
>> Am Mittwoch, 7. M=C3=A4rz 2018, 00:18:05 CET schrieb Pavel Machek:
>> > On Sat 2018-03-03 11:45:54, Richard Weinberger wrote:
>> > > While UBI and UBIFS seem to work at first sight with MLC NAND, you w=
ill
>> > > most likely lose all your data upon a power-cut or due to read/write
>> > > disturb.
>> > > In order to protect users from bad surprises, refuse to attach to ML=
C
>> > > NAND.
>> > >
>> > > Cc: stable@vger.kernel.org
>> >
>> > That sounds like _really_ bad idea for stable. All it does is it
>> > removes support for hardware that somehow works.
>>
>> MLC is not supported and does not work. Full stop.
>> If someone manages to get it somehow work, either with hardware or softw=
are
>> hacks they are on their own.
>> Having it in stable is the only chance we have to get it into vendor
>> kernels.
>
> Can you show how it meets the stable kernel criteria? They are
> documented in tree. This should not be in stable.
>
> And I'd like to see changelog improved. Real reason MLC is not
> supported is upper/lower page parts on MLC. And real fix to work with
> bigger pages in UBI.
>

To clarify one thing: the reason for this is MLC has actually never
been supported, nor worked properly. The fact that it kinda worked was
incidental and the cause of major problems for people due to that not
being clear. This patch only makes it explicit and avoids people
mistakenly trying to use UBIFS on MLC flash and risking their data and
products. To me, that's what's important.

This is an important patch, even if all it does is keep people from
loosing data. It also changes the conversation from "I have a
corrupted UBIFS device, BTW it's on MLC..." to "What can we do to get
UBIFS to work on MLC".

I don't know what the stable criteria is with re: to this patch. But
what I do know is if it doesn't go back into the various stables,
there will be manufacturers who will continue to try to use UBIFS on
MLC in ignorance for the next several years until the current stable
kernels EOL, despite there being a known patch that would make it
immediately obvious they shouldn't.

Thanks,
- Steve
