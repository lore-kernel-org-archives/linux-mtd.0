Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTxll-0004s0-8y
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 15:00:37 +0000
Received: by fxm14 with SMTP id 14so4590708fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 08:00:33 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <1307428609.11104.39.camel@localhost>
References: <1307427548-29306-1-git-send-email-vapier@gentoo.org>
	<1307427548-29306-2-git-send-email-vapier@gentoo.org>
	<1307428609.11104.39.camel@localhost>
From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 7 Jun 2011 11:00:13 -0400
Message-ID: <BANLkTikQzMtE6A=zNBU9ADjPKdOeTUzgtg@mail.gmail.com>
Subject: Re: [PATCH 2/6] mtdinfo: send help/version info to stdout
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

On Tue, Jun 7, 2011 at 02:36, Artem Bityutskiy wrote:
> On Tue, 2011-06-07 at 02:19 -0400, Mike Frysinger wrote:
>> Usage/version information should go to stdout when it is expected behavi=
or
>> (i.e. the user requested it explicitly). =C2=A0This info should go to st=
derr
>> only when the usage info is being shown as a result of incorrect options=
.
>
> This is fine, but all other ubi utils need this change then as well. I
> think this piece of code was copypasted in all ubi-utils, so you should
> easily find it and change.

you just like making me work :p
-mike
