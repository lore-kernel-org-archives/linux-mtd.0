Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kka7A-0001oM-Ae
	for linux-mtd@lists.infradead.org; Tue, 30 Sep 2008 07:57:48 +0000
Subject: Re: What is in ubifs-2.6.git
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-fsdevel@vger.kernel.org
In-Reply-To: <1222766358-21886-1-git-send-email-dedekind@infradead.org>
References: <1222766358-21886-1-git-send-email-dedekind@infradead.org>
Content-Type: text/plain; charset=utf-8
Date: Tue, 30 Sep 2008 10:56:23 +0300
Message-Id: <1222761383.8051.5.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <ext-adrian.hunter@nokia.com>,
	linux-kernel@vger.kernel.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 2008-09-30 at 12:18 +0300, Artem Bityutskiy wrote:
> addresses. For example, if user-space asks to read page zero of a
> file, and page 0-4 are in consecutive flash addressed, UBIFS reads
> pages 0-4 and populates them to the Page Cache.

Actually this example is a little wrong, because UBIFS starts
doing bulk-read only if few pages were read sequentially before.
So, user would have to read pages 0-3 sequentially, then UBIFS
would start doing bulk-read for this inode.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
