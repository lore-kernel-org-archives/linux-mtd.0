Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PMykh-0005Aj-0x
	for linux-mtd@lists.infradead.org; Mon, 29 Nov 2010 08:06:24 +0000
Received: by wyf22 with SMTP id 22so4193106wyf.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 29 Nov 2010 00:06:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1291017722-23985-7-git-send-email-computersforpeace@gmail.com>
References: <1291017722-23985-1-git-send-email-computersforpeace@gmail.com>
	<1291017722-23985-7-git-send-email-computersforpeace@gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Mon, 29 Nov 2010 03:05:59 -0500
Message-ID: <AANLkTi==NGjgX38mUKfziKQAknmOJyZmB4Db3WPEh5MJ@mail.gmail.com>
Subject: Re: [PATCH 7/8] nandwrite: add check for negative blockalign
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 29, 2010 at 03:02, Brian Norris wrote:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errmsg_die("Can't spec=
ify a negative blockalign '%d'",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 blockalign);

personally, i'd avoid quotes on non-string types.  maybe also mention
the command line option that is "blockalign" ?

otherwise, these changes all look fine to me
-mike
