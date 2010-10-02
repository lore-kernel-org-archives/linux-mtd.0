Received: from mail-qw0-f49.google.com ([209.85.216.49])
	by casper.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P25uZ-0007O8-0n
	for linux-mtd@lists.infradead.org; Sat, 02 Oct 2010 17:30:15 +0000
Received: by qwe4 with SMTP id 4so72626qwe.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 02 Oct 2010 10:30:13 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <1286029198.32172.23.camel@brekeke>
References: <1285953190-19669-1-git-send-email-vapier@gentoo.org>
	<1286029198.32172.23.camel@brekeke>
From: Mike Frysinger <vapier@gentoo.org>
Date: Sat, 2 Oct 2010 13:29:52 -0400
Message-ID: <AANLkTim8DMm6dYpW6Ot4yrR+m4XaywyTrk1m_n6k6ovX@mail.gmail.com>
Subject: Re: [PATCH] libmtd: make malloc failures fatal
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

On Sat, Oct 2, 2010 at 10:19, Artem Bityutskiy wrote:
> On Fri, 2010-10-01 at 13:13 -0400, Mike Frysinger wrote:
>> This converts libmtd to the common xalloc helpers and in doing so, makes
>> memory allocation failures fatal rather than returning an error to the
>> caller. =C2=A0I think this is acceptable behavior.
>>
>> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
>> ---
>> =C2=A0lib/libmtd.c =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 26 ++++++--------=
------------
>> =C2=A0lib/libmtd_legacy.c | =C2=A0 =C2=A08 +-------
>> =C2=A02 files changed, 7 insertions(+), 27 deletions(-)
>
> I am not 100% sure this is a good idea, but probably for allocations it
> is ok - they are so unlikely to fail, and if they do, we are screwed
> anyway. But for other situation we should return errors, I think.

right, i'm only thinking of OOM errors should we simply die.  all
other errors should return.
-mike
