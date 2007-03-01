Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HMpuB-0001Re-GQ
	for linux-mtd@lists.infradead.org; Thu, 01 Mar 2007 13:21:30 -0500
Subject: Re: JFFS2 file system slowly filling up for unknown reason ~20
	seconds after mount
From: Artem Bityutskiy <dedekind@infradead.org>
To: Josh Green <josh@resonance.org>
In-Reply-To: <1172774513.20708.40.camel@localhost>
References: <1172774513.20708.40.camel@localhost>
Content-Type: text/plain; charset=utf-8
Date: Thu, 01 Mar 2007 20:21:09 +0200
Message-Id: <1172773269.17031.42.camel@sauron>
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

Hi,

On Thu, 2007-03-01 at 18:41 +0000, Josh Green wrote:
> I'm currently working on a Linux project with a Philips LPC3180 based
> system.  The Linux support for this board seems to be under development
> by Philips and is not yet in the main Linux tree (we received support as
> a patch).  So this problem could very well be related to the drivers we
> received for this platform, but I wanted to check if anyone else has
> experienced similar behavior or have any pointers as to the cause.

I have never heard of such a really weird problem.

> Linux kernel 2.6.10 with patch from Philips

Ancient kernel, not a lot of people are interested in digging it.

> If anyone has any helpful information they could share in regards to
> this problem, I would appreciate it.  This could very well be a jffs2
> specific problem, but the jffs list seems rather dead, and there is a
> lot related to jffs2 on this list.  Please let me know if I'm posting to
> the wrong list though.

It's the right list.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
