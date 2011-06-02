Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSGZW-0004ZH-9c
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2011 22:40:58 +0000
Received: by wwb39 with SMTP id 39so849281wwb.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Jun 2011 15:40:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTim3uCTqGav2PkJ6D2DfZBjKRg2gcw@mail.gmail.com>
References: <1307038511-5968-1-git-send-email-computersforpeace@gmail.com>
	<BANLkTim3uCTqGav2PkJ6D2DfZBjKRg2gcw@mail.gmail.com>
Date: Thu, 2 Jun 2011 15:40:56 -0700
Message-ID: <BANLkTinzWH1XFzW-q+gWK0A0XC_DppE9eQ@mail.gmail.com>
Subject: Re: [RFC] nanddump: skip bad blocks, print full length with --omitbad
From: Brian Norris <computersforpeace@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
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

On Thu, Jun 2, 2011 at 11:51 AM, Mike Frysinger <vapier.adi@gmail.com> wrot=
e:
> pretty sure the opt operates as i intended. =A0sounds like you want to
> add --skipbad.

OK, thanks for the info. I might add a new "skipbad" option and try to
clarify the differences between the various "omit" and "skip" options.

BTW, is there good history for mtd-utils pre-April 2006? Git doesn't
have history for this option, as it was part of the "initial commit."

Thanks,
Brian
