Received: from mail-gx0-f159.google.com ([209.85.217.159])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LypjS-0002VK-Ar
	for linux-mtd@lists.infradead.org; Tue, 28 Apr 2009 16:01:15 +0000
Received: by gxk3 with SMTP id 3so1159100gxk.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Apr 2009 08:59:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <49F70752.5030702@harris.com>
References: <49F61F32.3020003@harris.com>
	<8bd0f97a0904271426p30df3a97ke31af72dcf96531f@mail.gmail.com>
	<49F70752.5030702@harris.com>
Date: Tue, 28 Apr 2009 11:58:27 -0400
Message-ID: <8bd0f97a0904280858p7a08c061oc47f3e64b098c5d9@mail.gmail.com>
Subject: Re: [PATCH] Bug in m25p80.c during whole-chip erase
From: Mike Frysinger <vapier.adi@gmail.com>
To: "Steven A. Falco" <sfalco@harris.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 28, 2009 at 09:40, Steven A. Falco wrote:
> Mike Frysinger wrote:
>> On Mon, Apr 27, 2009 at 17:10, Steven A. Falco wrote:
>>> There is a logic error in "whole chip erase" for the m25p80 family. =C2=
=A0If
>>> the whole device is successfully erased, erase_chip() will return 0, an=
d
>>> the code will fall through to the "else" clause, and do sector-by-secto=
r
>>> erase in addition to the whole-chip erase. =C2=A0This patch corrects th=
at.
>>>
>>> Also, the MAX_READY_WAIT_COUNT is insufficient for an m25p16 connected
>>> to a 400 MHz powerpc. =C2=A0Increasing it allows me to successfully pro=
gram
>>> the device on my board.
>>
>> in general, trying to set timeouts "close" to the spec gains nothing
>> with spi flash devices. =C2=A0the timeout limit is hit only when an erro=
r
>> occurs, and errors should not occur during the normal run of things.
>> on the other side, having a timeout be wrongly hit when the device is
>> operating correctly is a much worse situation to be in.
>
> Right. =C2=A0This chip takes 13 seconds (typical) to bulk erase, accordin=
g to
> the Numonyx data sheet. =C2=A0So increasing the timeout to account for su=
ch
> a slow part is necessary, and allows me to successfully erase the part.
>
> Are there any changes you'd like to see in this patch, or is it ok as
> written?

changes look fine to me, but i'm not in any position to get things
merged for you ;)
-mike
