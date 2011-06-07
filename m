Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTqGv-00038C-Dq
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 07:00:18 +0000
Received: by fxm14 with SMTP id 14so4227005fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 00:00:14 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <1307428482.11104.38.camel@localhost>
References: <1307427548-29306-1-git-send-email-vapier@gentoo.org>
	<1307428482.11104.38.camel@localhost>
From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 7 Jun 2011 02:59:54 -0400
Message-ID: <BANLkTi=A_TjJ4JwRQLjgTz217ZhR0eCHVQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] jffs2: make lzo optional at build time
To: dedekind1@gmail.com
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

On Tue, Jun 7, 2011 at 02:34, Artem Bityutskiy wrote:
> On Tue, 2011-06-07 at 02:19 -0400, Mike Frysinger wrote:
>> The external lzo dep can be a pain to deal with when cross-compiling,
>> so make it optional for jffs2. =C2=A0This is useful if people aren't eve=
n
>> using the functionality, or for quicker development.
>
> How about mkfs.ubifs - it requires lzo as well. And then mkfs.jffs2
> wants libacl which might be the same PITA.

libacl already has a knob.  i didnt bother with mkfs.ubifs because it
additionally requires libuuid which comes from util-linux.  also, it
seemed like lzo is the only compression supported by UBI, so making it
optional didnt seem like it'd result in anything useful.  at least
jffs2 can operate without it by using other compression schemes.
-mike
