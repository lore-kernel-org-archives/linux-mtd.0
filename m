Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IQ3I7-0002zu-FA
	for linux-mtd@lists.infradead.org; Tue, 28 Aug 2007 11:48:37 -0400
Subject: Re: [PATCH] MTD: nandsim: avoid deadlocking FS
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1188315941.3741.33.camel@sauron>
References: <1188315941.3741.33.camel@sauron>
Content-Type: text/plain; charset=utf-8
Date: Tue, 28 Aug 2007 18:47:13 +0300
Message-Id: <1188316033.3741.35.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-08-28 at 18:45 +0300, Artem Bityutskiy wrote:
> Make nandsim use GFP_NOFS when allocating memory, because it might
> be used by a file-system (e.g. UBIFS2) which means, if we are short

Oh sorry, it is UBIFS, we do not have plans for UBIFS2 yet. Uhh, nasty
typo!

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
