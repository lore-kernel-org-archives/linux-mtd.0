Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HN6cj-0003e6-66
	for linux-mtd@lists.infradead.org; Fri, 02 Mar 2007 07:12:35 -0500
Subject: Re: [RFC] [PATCH take 2] UBI: dispose of background.c
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexander Schmidt <alexs@linux.vnet.ibm.com>
In-Reply-To: <200703021132.43263.alexs@linux.vnet.ibm.com>
References: <200703021132.43263.alexs@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 02 Mar 2007 14:07:06 +0200
Message-Id: <1172837226.17031.51.camel@sauron>
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

On Fri, 2007-03-02 at 11:32 +0100, Alexander Schmidt wrote:
> this patch moves the background unit code to the wear-leveling unit. The
> kthread api is now used for handling the background thread.

Thank, applies.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
