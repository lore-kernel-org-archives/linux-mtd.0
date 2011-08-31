Received: from mail-yi0-f49.google.com ([209.85.218.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QykEX-0004I9-AG
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2011 12:49:34 +0000
Received: by yic13 with SMTP id 13so566621yic.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 31 Aug 2011 05:49:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20110831074902.GA26382@logfs.org>
References: <20110809145812.GR26160@logfs.org>
	<CAMjNe_f_364ir1iNgFFgh71GP-T_6vroMHFC1R7eazkhcR8c2g@mail.gmail.com>
	<20110812093429.GS26160@logfs.org>
	<CAMjNe_eCqe1kVH-GLb6uo1gVCkH2r49w2Xdws6=jFMOaQRU=mw@mail.gmail.com>
	<20110816171707.GU26160@logfs.org>
	<CAMjNe_f9RT0qmO5EeUxhA80ruB+uz7Ng7jCVZriaUcgmk_H1HQ@mail.gmail.com>
	<20110826194910.GE22411@logfs.org>
	<CAMjNe_euj5t9+Jph0Uy-j7+SRMe1oSzihGCaiuQ1Dcd7dz6cuw@mail.gmail.com>
	<20110831055854.GA12713@logfs.org>
	<CAMjNe_d2pOC9+2nSy2PA=2aigF95vZv3_A-jPyWyTXteW3mqFw@mail.gmail.com>
	<20110831074902.GA26382@logfs.org>
Date: Wed, 31 Aug 2011 18:19:30 +0530
Message-ID: <CAMjNe_csYHWCRFXt6sW1FpMaS_RFGLM6z1ML6_-3xb-5x7DZtg@mail.gmail.com>
Subject: Re: logfs unmount bug
From: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 31, 2011 at 1:19 PM, J=F6rn Engel <joern@logfs.org> wrote:


> Can you set LOGFS_DEBUG to 0, both to cut down the noise and in the
> hope that the log output doesn't get corrupted like this again?

It doesn't crash, so nothing much is printed in kern.log if LOGFS_DEBUG=3D0=
.
I produced the log with LOGFS_DEBUG=3D0xDFF, (without LOGFS_DEBUG_ALIASES)
Its a 60MB log file "kern_LOGFS_DEBUG=3D0xDFF.log" shared in the following =
link:

https://docs.google.com/leaf?id=3D0BycgLWCW61phNjY0ZDg4ZjUtYzAyMy00YTgwLWFl=
MmItNjlmZWIzMWFlNGUy&hl=3Den_US

Thanks,
mugunthan
