Received: from mail-qy0-f177.google.com ([209.85.216.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P1UfW-0005bp-4z
	for linux-mtd@lists.infradead.org; Fri, 01 Oct 2010 01:44:14 +0000
Received: by qyk31 with SMTP id 31so846968qyk.15
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Sep 2010 18:44:13 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <1285826499.11684.24.camel@localhost>
References: <1285803024-13572-1-git-send-email-vapier@gentoo.org>
	<1285822785.11684.11.camel@localhost>
	<AANLkTimzVA06P8GR4Gy_2PSFDXKnzTOHPj2qr+_X__zw@mail.gmail.com>
	<1285825735.11684.22.camel@localhost>
	<AANLkTi=E6qy2sBq1thXMUWfxSbCuNZDUOmmGT8o0j0hW@mail.gmail.com>
	<1285826499.11684.24.camel@localhost>
From: Mike Frysinger <vapier@gentoo.org>
Date: Thu, 30 Sep 2010 21:43:53 -0400
Message-ID: <AANLkTim1Nzkfbp80j2x8TrN8dqyvmV3NMfU1rmV23mQR@mail.gmail.com>
Subject: Re: [PATCH 1/3] mtd-utils: new memory wrappers
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 30, 2010 at 02:01, Artem Bityutskiy wrote:
> On Thu, 2010-09-30 at 01:59 -0400, Mike Frysinger wrote:
>> On Thu, Sep 30, 2010 at 01:48, Artem Bityutskiy wrote:
>> > On Thu, 2010-09-30 at 01:15 -0400, Mike Frysinger wrote:
>> >> as i'm sure you noticed, i didnt make these up. =C2=A0i simply moved =
them
>> >> from existing mtd-utils code.
>> >
>> > Actually no, I did not notice!
>>
>> np ... only one or two utils uses this, and easy enough to convert
>> them. =C2=A0before i go further though, a question on direction ...
>>
>> mkfs.jffs2 has a lot of helpers that can be moved to common.h. =C2=A0but=
 it
>> implements things using C functions & va_args. =C2=A0the common.h header
>> takes the CPP approach of expanding the variable args. =C2=A0which way t=
o
>> go to ultimately unify the code base !?
>
> I have not strong opinion, how about creating common.c ?

ok, i played a bit with a common.c.  ultimately, i could not get it to
be smaller than a CPP approach on my x86_64 system.  so i'll stick
with the CPP stuff.
-mike
