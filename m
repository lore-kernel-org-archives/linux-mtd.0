Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I6kPN-0004KN-D3
	for linux-mtd@lists.infradead.org; Fri, 06 Jul 2007 05:47:28 -0400
Subject: Re: UBI Patch: Max Sequence no not updated in scan.c
From: Artem Bityutskiy <dedekind@infradead.org>
To: brijesh.singh@calsoftinc.com
In-Reply-To: <31331.172.16.0.34.1183712408.squirrel@webmail.calsoftinc.com>
References: <31331.172.16.0.34.1183712408.squirrel@webmail.calsoftinc.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 06 Jul 2007 12:46:54 +0300
Message-Id: <1183715214.3531.53.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-07-06 at 14:30 +0530, brijesh.singh@calsoftinc.com wrote:
> Hi,I came across problem of having two leb with same sequence no.This
> happens when we continuously write one block again and again and reboot
> machine before background thread erases those blocks.
> The problem here was,when we find two blocks with same sequence no,we tak=
e
> the higher one,but we were not updating max seq no,so next block may have
> the same seqnum.
> This patch solves this problem.

I've committed your patch (modified) and one more fix, please, try.

Thanks,
Artem.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
