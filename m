Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L7X7y-00046f-MI
	for linux-mtd@lists.infradead.org; Tue, 02 Dec 2008 15:25:31 +0000
Subject: Re: jffs2 scan utility?
From: Artem Bityutskiy <dedekind@infradead.org>
To: Andrew Xiang <andrewxiang@gmail.com>
In-Reply-To: <ecdd5ced0812020720p47bc8fdcw5589f6a5c6f4e95c@mail.gmail.com>
References: <ecdd5ced0812020720p47bc8fdcw5589f6a5c6f4e95c@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 02 Dec 2008 17:22:59 +0200
Message-Id: <1228231379.13686.11.camel@sauron>
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

On Tue, 2008-12-02 at 10:20 -0500, Andrew Xiang wrote:
> Is there an utility that I can run to scan a JFFS2 partition and
> report back all error in the partition?
> I encountered a corruption case where mount did not pick up. But a
> file was corrupted and it would not allow me to copy the file.
> A power failure occurred during the GC activity.

I do not think there is such utility, at least publically available.
--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
