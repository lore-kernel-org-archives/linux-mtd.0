Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QrXMR-0001lu-CO
	for linux-mtd@lists.infradead.org; Thu, 11 Aug 2011 15:39:55 +0000
Received: by bke17 with SMTP id 17so1257229bke.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 11 Aug 2011 08:39:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <EBEBA6C3BD40EF4B8C0A5B8AD5A28F993B6C6EB71A@GVW0547EXC.americas.hpqcorp.net>
References: <EBEBA6C3BD40EF4B8C0A5B8AD5A28F993B6C6EB71A@GVW0547EXC.americas.hpqcorp.net>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Thu, 11 Aug 2011 11:39:33 -0400
Message-ID: <CAMjpGUc4SMSvU3mHjeZ6oq=2K8tvuYVcEOjpE9vPfYnL7DZByA@mail.gmail.com>
Subject: Re: [BUG] mtd-utils: nandwrite: invalid erase after page write failure
To: "Fryar, Jeff" <jeff.fryar@hp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 11, 2011 at 11:30, Fryar, Jeff wrote:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (mtd_erase(mtd_desc, &mtd, fd, (i/mtd=
.eb_size))) {

we dont need to conserve whitespace.  please use spaces around "/" operator=
s.
-mike
