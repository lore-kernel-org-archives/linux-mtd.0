Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HE3ML-0002C6-FG
	for linux-mtd@lists.infradead.org; Mon, 05 Feb 2007 07:54:18 -0500
Subject: Re: [PATCH] [JFFS2] use MTD_OOB_AUTO - About "static const"
From: Artem Bityutskiy <dedekind@infradead.org>
To: kmpark@infradead.org
In-Reply-To: <000001c74911$788740b0$06100a3b@user001b2c71e3>
References: <000001c74911$788740b0$06100a3b@user001b2c71e3>
Content-Type: text/plain; charset=utf-8
Date: Mon, 05 Feb 2007 14:53:50 +0200
Message-Id: <1170680030.3628.91.camel@sauron>
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

Hi Kyungmin,

On Mon, 2007-02-05 at 19:36 +0900, Kyungmin Park wrote:
> About to send a new patch to make that 'static const' instead :)=E2=80=9D
> Finally, re-send the patch with =E2=80=9Cstatic const=E2=80=9D[3]
> 5. http://lkml.org/lkml/2005/11/13/125

I am convinced. Will fix. I won't re-send it because the fix is too
trivial - the fixed version will be at my git.

Thanks you!

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
