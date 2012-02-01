Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsXIh-0001wC-9y
 for linux-mtd@lists.infradead.org; Wed, 01 Feb 2012 10:20:27 +0000
Received: by bke5 with SMTP id 5so1067108bke.36
 for <linux-mtd@lists.infradead.org>; Wed, 01 Feb 2012 02:20:24 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20120201100327.GB2524@pengutronix.de>
References: <1328004002-24646-1-git-send-email-Barry.Song@csr.com>
 <1328004002-24646-2-git-send-email-Barry.Song@csr.com>
 <20120131101734.GE2471@pengutronix.de>
 <CAGsJ_4wyJ6Wymy4AWoW1eHubZX=W7GT_Fbow9ofXoY1RrcHzgA@mail.gmail.com>
 <20120131113358.GM2471@pengutronix.de>
 <20120131203455.GG22611@ponder.secretlab.ca>
 <20120131211554.GA28105@pengutronix.de>
 <CAGsJ_4yJZYHUzr9YerdM5o8grGd6iP51ra4nJkMuOo5Khn95RQ@mail.gmail.com>
 <20120201100327.GB2524@pengutronix.de>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 1 Feb 2012 18:20:04 +0800
Message-ID: <CAGsJ_4z_08hNMuoLeNms-TKoyF8dzQipZ2B6jco6DKMDhgTg1w@mail.gmail.com>
Subject: Re: [PATCH 1/3] platform: add common resource requesting and mapping
 helper
To: Wolfram Sang <w.sang@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org,
 workgroup.linux@csr.com, Grant Likely <grant.likely@secretlab.ca>,
 linux-mtd@lists.infradead.org, Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
 Barry Song <Baohua.Song@csr.com>, David Woodhouse <dwmw2@infradead.org>,
 Erik Gilling <konkers@google.com>, Barry Song <Barry.Song@csr.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/2/1 Wolfram Sang <w.sang@pengutronix.de>:
>
>> i think it makes sense for us to have platform_devm_request_irq() and
>> similar things. i'll take care.
>
> I'll try, too. Then we can compare and learn from that.

well, thanks.

>
>> PS: =C2=A0as the man maintaining embedded systems of the i2c subsystem,
>> would you comment the CSR i2c driver which has been there waiting for
>> a long time?
>> http://www.spinics.net/lists/linux-i2c/msg07081.html
>
> Relax, you sent that only two days ago.

the v5 is sent two days ago with deleting only one line, v1-v4 has
been there 3 monthes :-)
i was not complaining you haven't sent comments for v5.

>
> --
> Pengutronix e.K. =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | Wolfram Sang =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|
> Industrial Linux Solutions =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | http://www.pengutronix.de/ =C2=A0|

-barry
