Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GvDPn-0001v2-2o
	for linux-mtd@lists.infradead.org; Fri, 15 Dec 2006 08:47:57 -0500
Subject: Re: [PATCH] [UBI] Resize of static volumes
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexander Schmidt <alexs@linux.vnet.ibm.com>
In-Reply-To: <45829D2E.4060008@linux.vnet.ibm.com>
References: <45829D2E.4060008@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 15 Dec 2006 15:41:47 +0200
Message-Id: <1166190107.18628.56.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Alexander,

On Fri, 2006-12-15 at 14:03 +0100, Alexander Schmidt wrote:
> I noticed that after resizing static volumes, the used_bytes value in the
> data table record is set to the new size of the volume. This is correct
> for dynamic volumes, but for static volumes, this value should not be
> changed.

Thanks for the patch!

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
