Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HlLMz-0006M2-Kb
	for linux-mtd@lists.infradead.org; Tue, 08 May 2007 04:48:31 -0400
Subject: Re: MLC NAND support in JFFS2
From: Artem Bityutskiy <dedekind@infradead.org>
To: Stanley Cai <stanley.w.cai@gmail.com>
In-Reply-To: <dd2695e90705080132h234b7389x37762c4884047cb0@mail.gmail.com>
References: <dd2695e90705080020u576249aah71121e245f659bd3@mail.gmail.com>
	<1178609947.3708.17.camel@sauron>
	<dd2695e90705080132h234b7389x37762c4884047cb0@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 08 May 2007 11:48:17 +0300
Message-Id: <1178614097.3708.21.camel@sauron>
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

On Tue, 2007-05-08 at 16:32 +0800, Stanley Cai wrote:
> hi
>   I find that some vendor's MLC NAND such as Samsung require the user
> programs the pages in the same block in sequence from least
> significant page to most significant page. i think current JFSS2 can
> not do this now.
Please, no private mails.

This was a requirement for SLC flashes as well, at least Toshiba's data
sheets noted this. JFFS2 satisfies this requirement.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
