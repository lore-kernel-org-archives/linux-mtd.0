Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P7EFm-0006By-EI
	for linux-mtd@lists.infradead.org; Sat, 16 Oct 2010 21:25:23 +0000
Received: by wyi11 with SMTP id 11so2120757wyi.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 16 Oct 2010 14:25:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1287262445-19654-1-git-send-email-computersforpeace@gmail.com>
References: <1287262445-19654-1-git-send-email-computersforpeace@gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Sat, 16 Oct 2010 17:24:58 -0400
Message-ID: <AANLkTimJZUjGCN18pn64hf263bKvQ27HAfUUiq1hOKrf@mail.gmail.com>
Subject: Re: [PATCH] mtd-utils: flash_erase: Fix output of offsets
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, Kevin Cernekee <cernekee@gmail.com>,
	linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Oct 16, 2010 at 16:54, Brian Norris wrote:
> Also, we should not add an extra eraseblock for the final status
> message; this gives misleading output when, for example, the
> following statement is executed:
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0$ flash_erase /dev/mtd0 0 1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Erasing 512 Kibyte @ 80000 -- 100 % complete
>
> We aren't erasing at offset 0x80000; it should display offset 0.

yeah, this was to fix the display not getting to 100%, but then i
fixed it another way and forgot to undo this line

Acked-by: Mike Frysinger <vapier@gentoo.org>
-mike
