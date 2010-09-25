Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OzaZK-0004Bm-Pb
	for linux-mtd@lists.infradead.org; Sat, 25 Sep 2010 19:37:59 +0000
Received: by wyb38 with SMTP id 38so4202103wyb.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 25 Sep 2010 12:37:55 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <1285443076.13050.12.camel@brekeke>
References: <1285293221-25028-3-git-send-email-vapier@gentoo.org>
	<1285394808-29795-1-git-send-email-vapier@gentoo.org>
	<1285412062.13050.5.camel@brekeke>
	<AANLkTi=q_WSfUGuYSm0andpmrUjD4gFaV9PJ_03zZZ0T@mail.gmail.com>
	<1285443076.13050.12.camel@brekeke>
From: Mike Frysinger <vapier@gentoo.org>
Date: Sat, 25 Sep 2010 15:37:35 -0400
Message-ID: <AANLkTikkS=iZJ5Y37YEeqp+P_5+HXH4DQsVrtOYXuYBu@mail.gmail.com>
Subject: Re: [PATCH 3/4 v2] mtd-utils: new strtoX helpers
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

On Sat, Sep 25, 2010 at 15:31, Artem Bityutskiy wrote:
> On Sat, 2010-09-25 at 14:59 -0400, Mike Frysinger wrote:
>> On Sat, Sep 25, 2010 at 06:54, Artem Bityutskiy wrote:
>> > On Sat, 2010-09-25 at 02:06 -0400, Mike Frysinger wrote:
>> >> Simply usage of converting strings to numbers by adding some wrappers
>> >> around the standard strtoX functions. =C2=A0These helpers support bot=
h hex
>> >> and dec numbers transparently, and the caller need only provide a ptr
>> >> to an error integer if they want to be notified of problems.
>> >
>> > Why do you need a separate file for this? common.h does not suit this?
>>
>> the expansion of PROGRAM_NAME causes build errors for programs that do
>> not define it but include common.h
>
> May be
>
> #ifndef PROGRAM_NAME
> #define PROGRAM_NAME "undefined"
> #endif

if we're going to go that route, i'd rather just go through the few
files not defining PROGRAM_NAME, add it, and then turn the comment in
common.h about people defining it into an error
-mike
