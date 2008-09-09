Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kd24V-0007nG-Sr
	for linux-mtd@lists.infradead.org; Tue, 09 Sep 2008 12:11:52 +0000
Subject: Re: [PATCH] ubifs: create the name of the background thread in
	every case
From: Artem Bityutskiy <dedekind@infradead.org>
To: Sebastian Siewior <bigeasy@linutronix.de>
In-Reply-To: <20080909091729.GA18689@www.tglx.de>
References: <20080909091729.GA18689@www.tglx.de>
Content-Type: text/plain; charset=utf-8
Date: Tue, 09 Sep 2008 15:11:47 +0300
Message-Id: <1220962307.4036.54.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <ext-adrian.hunter@nokia.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-09-09 at 11:17 +0200, Sebastian Siewior wrote:
> If the ubifs partition is mounted RO and then remounted RW we end
> up with no thread name in ubifs_remount_rw() and the thread appears
> nameless.

Pushed to ubifs-2.6.git, thanks.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
