Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9Pj7-0002Yy-Fw
	for linux-mtd@lists.infradead.org; Mon, 11 Apr 2011 22:36:58 +0000
Received: by pzk5 with SMTP id 5so2601276pzk.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 11 Apr 2011 15:36:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTinYULpjO3RxJmptX4Fix5TP-sxqUg@mail.gmail.com>
References: <1302558659-29472-1-git-send-email-maksim.rayskiy@gmail.com>
	<BANLkTinYULpjO3RxJmptX4Fix5TP-sxqUg@mail.gmail.com>
Date: Mon, 11 Apr 2011 15:36:55 -0700
Message-ID: <BANLkTik6SR5CbT+1R8T+ucwR7K7XCcky+g@mail.gmail.com>
Subject: Re: [PATCH] Fix gcc-4.5.2 "statement with no effect" warnings in UBIFS
From: Maksim Rayskiy <maksim.rayskiy@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
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

On Mon, Apr 11, 2011 at 3:08 PM, Mike Frysinger <vapier.adi@gmail.com> wrot=
e:
> On Mon, Apr 11, 2011 at 17:50, =A0<maksim.rayskiy@gmail.com> wrote:
>> From: Maksim Rayskiy <maksim.rayskiy@gmail.com>
>>
>> When compiling UBIFS with CONFIG_UBIFS_FS_DEBUG not set,
>> gcc-4.5.2 generates a slew of "warning: statement with no effect"
>> on references to non-void functions defined as 0.
>> To avoid these warnings, change appropriate definitions from
>> =A0#define dbg_xxx(a) =A0 =A0 0
>> to
>> =A0#define dbg_xxx(a) =A0 =A0 ({0; })
>
> we probably want to make these inline funcs. =A0otherwise we get
> misbehavior if someone does something like:
> =A0 =A0dbg_dump_index(c++);
> -mike
>

I agree that would be a problem, but if such calls existed, we would
be dealing not with compiler warnings but with completely broken code.
I think it is bad style to have side-effects in debug functions.

Thanks,
Maksim.
