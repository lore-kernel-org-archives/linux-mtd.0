Received: from mail-qw0-f49.google.com ([209.85.216.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P8sZz-0005p0-LP
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2010 10:41:04 +0000
Received: by qwi4 with SMTP id 4so216595qwi.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Oct 2010 03:41:02 -0700 (PDT)
MIME-Version: 1.0
Sender: foxcore@gmail.com
In-Reply-To: <1287233782-21319-1-git-send-email-w.sang@pengutronix.de>
References: <1287233782-21319-1-git-send-email-w.sang@pengutronix.de>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Thu, 21 Oct 2010 12:40:41 +0200
Message-ID: <AANLkTi=kX7aAbY-5XNF0dKngXmAPXL-UisGGfjOimKdo@mail.gmail.com>
Subject: Re: [PATCH] [MTD] cfi_cmdset_0002: code cleanups
To: Wolfram Sang <w.sang@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: yidong zhang <zhangyd6@gmail.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/10/16 Wolfram Sang <w.sang@pengutronix.de>:
> - remove disabled code (hasn't been touched since the beginning of git
> =C2=A0and should be reimplemented if really needed)
> - convert remaining c++-comments to plain c-style
>
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> Cc: yidong zhang <zhangyd6@gmail.com>
> Cc: Guillaume LECERF <glecerf@gmail.com>
> Cc: David Woodhouse <David.Woodhouse@intel.com>

Acked-by: Guillaume LECERF <glecerf@gmail.com>

--=20
Guillaume LECERF
GeeXboX developer - www.geexbox.org
