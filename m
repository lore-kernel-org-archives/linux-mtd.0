Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K20lx-0000Xo-U1
	for linux-mtd@lists.infradead.org; Fri, 30 May 2008 09:19:42 +0000
Subject: Re: UBIFS on-media format changed to version 3
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <20080530073025.GB20369@cloud.net.au>
References: <1212047442.31023.64.camel@sauron>
	<20080530073025.GB20369@cloud.net.au>
Content-Type: text/plain; charset=utf-8
Date: Fri, 30 May 2008 12:20:50 +0300
Message-Id: <1212139250.31023.114.camel@sauron>
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

On Fri, 2008-05-30 at 17:30 +1000, Hamish Moffatt wrote:
> What's the impact of the bug? Does it only affect particularly large
> volumes or directories with a particularly large number of files or
> something else?

Right. It is basically harmless, it's just that the hash function will
collide more often which may result in poorer performance in case of
large directories.

> As I understand your comments, the new source will currently work with=20
> existing file systems but you want to drop that ability?

Right. But we may keep the support if you need this of course.

> We're just about to deploy devices with 2.6.24 + ubifs from GIT a month
> or two back, though we're probably not going to upgrade the kernel on
> existing devices in the future anyway.

Oh. We fixed many bugs since that time :-) Of course you may never hit
them, everything depends on the use-case. But I would update the kernel.

Anyway, if you want, we may keep backward compatibility so that new
kernel will work fine with older (version 2) images.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
