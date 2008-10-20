Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Krqyj-0004Ue-0L
	for linux-mtd@lists.infradead.org; Mon, 20 Oct 2008 09:23:09 +0000
Subject: Re: [RFC] ubi: tmp hack for lstat
From: Artem Bityutskiy <dedekind@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
In-Reply-To: <20081020091100.GA1324@www.tglx.de>
References: <20081019132122.GA20282@www.tglx.de>
	<1224479637.4466.55.camel@sauron> <20081020091100.GA1324@www.tglx.de>
Content-Type: text/plain; charset=utf-8
Date: Mon, 20 Oct 2008 12:21:11 +0300
Message-Id: <1224494471.4466.90.camel@sauron>
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

On Mon, 2008-10-20 at 11:11 +0200, Sebastian Andrzej Siewior wrote:
> I'm actually not sure what the expected behavior is. stat() returns
> information about a file and ubi isn't a regular file it is a character
> node. So it would be probably better to leave everything as it and
> change userspace instead.

In my understanding, stat() should return how many bytes of data inode
contains. Stat on a character device should return amount of bytes the
character device inode contain. In ext3 major/minor are stored as
meta-data, so it returns 0.

Yes, I also think it is better if you amend your user-space application.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
