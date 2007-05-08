Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HlKI7-0004R7-Tu
	for linux-mtd@lists.infradead.org; Tue, 08 May 2007 03:39:26 -0400
Subject: Re: MLC NAND support in JFFS2
From: Artem Bityutskiy <dedekind@infradead.org>
To: Stanley Cai <stanley.w.cai@gmail.com>
In-Reply-To: <dd2695e90705080020u576249aah71121e245f659bd3@mail.gmail.com>
References: <dd2695e90705080020u576249aah71121e245f659bd3@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 08 May 2007 10:39:07 +0300
Message-Id: <1178609947.3708.17.camel@sauron>
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

On Tue, 2007-05-08 at 15:20 +0800, Stanley Cai wrote:
> hi
>   Does the current JFFS2 support MLC NAND? If not, is there any plan
> to support it?

I do not think there is a huge problem to support it. Just do not use
cleanmarker and everything will be fine. Or waste first NAND page for
cleanmarker. Both approaches have their drawbacks, but easy and should
work.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
