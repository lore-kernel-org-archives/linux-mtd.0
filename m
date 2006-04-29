Received: from uproxy.gmail.com ([66.249.92.173])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FZpsI-0000sh-I7
	for linux-mtd@lists.infradead.org; Sat, 29 Apr 2006 09:52:47 -0400
Received: by uproxy.gmail.com with SMTP id j3so1888480ugf
	for <linux-mtd@lists.infradead.org>;
	Sat, 29 Apr 2006 06:52:35 -0700 (PDT)
Message-ID: <625fc13d0604290652q3cd325d2hfdd21b8933ad3ce5@mail.gmail.com>
Date: Sat, 29 Apr 2006 08:52:35 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Daniel Drake" <dsd@gentoo.org>
In-Reply-To: <20060429104144.4D7AC87EA56@zog.reactivated.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <20060429104144.4D7AC87EA56@zog.reactivated.net>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org, toralf.foerster@gmx.de
Subject: Re: [PATCH] mtd: SC520CDP should depend on MTD_CONCAT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/29/06, Daniel Drake <dsd@gentoo.org> wrote:
> Toralf F=F6rster found a compile error when CONFIG_MTD_SC520CDP=3Dy and
> CONFIG_MTD_CONCAT=3Dn:
>
> drivers/built-in.o: In function `init_sc520cdp':
> sc520cdp.c:(.init.text+0xb4de): undefined reference to `mtd_concat_create=
'
> drivers/built-in.o: In function `cleanup_sc520cdp':
> sc520cdp.c:(.exit.text+0x14bc): undefined reference to `mtd_concat_destro=
y'
>
> This patch fixes it.
>
> Signed-off-by: Daniel Drake <dsd@gentoo.org>

I added this in my tree.  Thanks!

josh
