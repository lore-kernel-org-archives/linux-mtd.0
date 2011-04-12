Received: from mail-gx0-f177.google.com ([209.85.161.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9Ro6-0003nK-UW
	for linux-mtd@lists.infradead.org; Tue, 12 Apr 2011 00:50:15 +0000
Received: by gxk2 with SMTP id 2so2601561gxk.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 11 Apr 2011 17:50:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTik6SR5CbT+1R8T+ucwR7K7XCcky+g@mail.gmail.com>
References: <1302558659-29472-1-git-send-email-maksim.rayskiy@gmail.com>
	<BANLkTinYULpjO3RxJmptX4Fix5TP-sxqUg@mail.gmail.com>
	<BANLkTik6SR5CbT+1R8T+ucwR7K7XCcky+g@mail.gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Mon, 11 Apr 2011 20:49:53 -0400
Message-ID: <BANLkTin3AonsdpJq+CQy+k9grzffomdk=w@mail.gmail.com>
Subject: Re: [PATCH] Fix gcc-4.5.2 "statement with no effect" warnings in UBIFS
To: Maksim Rayskiy <maksim.rayskiy@gmail.com>
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

On Mon, Apr 11, 2011 at 18:36, Maksim Rayskiy wrote:
> On Mon, Apr 11, 2011 at 3:08 PM, Mike Frysinger wrote:
>> On Mon, Apr 11, 2011 at 17:50, =C2=A0<maksim.rayskiy@gmail.com> wrote:
>>> From: Maksim Rayskiy <maksim.rayskiy@gmail.com>
>>>
>>> When compiling UBIFS with CONFIG_UBIFS_FS_DEBUG not set,
>>> gcc-4.5.2 generates a slew of "warning: statement with no effect"
>>> on references to non-void functions defined as 0.
>>> To avoid these warnings, change appropriate definitions from
>>> =C2=A0#define dbg_xxx(a) =C2=A0 =C2=A0 0
>>> to
>>> =C2=A0#define dbg_xxx(a) =C2=A0 =C2=A0 ({0; })
>>
>> we probably want to make these inline funcs. =C2=A0otherwise we get
>> misbehavior if someone does something like:
>> =C2=A0 =C2=A0dbg_dump_index(c++);
>
> I agree that would be a problem, but if such calls existed, we would
> be dealing not with compiler warnings but with completely broken code.
> I think it is bad style to have side-effects in debug functions.

we are dealing with broken code.  people should not have to know about
the implementation of functions in order to safely use them.
-mike
