Received: from mail-yi0-f49.google.com ([209.85.218.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9PIE-0002Gm-3K
	for linux-mtd@lists.infradead.org; Mon, 11 Apr 2011 22:09:10 +0000
Received: by yic15 with SMTP id 15so2557262yic.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 11 Apr 2011 15:09:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1302558659-29472-1-git-send-email-maksim.rayskiy@gmail.com>
References: <1302558659-29472-1-git-send-email-maksim.rayskiy@gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Mon, 11 Apr 2011 18:08:48 -0400
Message-ID: <BANLkTinYULpjO3RxJmptX4Fix5TP-sxqUg@mail.gmail.com>
Subject: Re: [PATCH] Fix gcc-4.5.2 "statement with no effect" warnings in UBIFS
To: maksim.rayskiy@gmail.com
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

On Mon, Apr 11, 2011 at 17:50,  <maksim.rayskiy@gmail.com> wrote:
> From: Maksim Rayskiy <maksim.rayskiy@gmail.com>
>
> When compiling UBIFS with CONFIG_UBIFS_FS_DEBUG not set,
> gcc-4.5.2 generates a slew of "warning: statement with no effect"
> on references to non-void functions defined as 0.
> To avoid these warnings, change appropriate definitions from
> =C2=A0#define dbg_xxx(a) =C2=A0 =C2=A0 0
> to
> =C2=A0#define dbg_xxx(a) =C2=A0 =C2=A0 ({0; })

we probably want to make these inline funcs.  otherwise we get
misbehavior if someone does something like:
    dbg_dump_index(c++);
-mike
