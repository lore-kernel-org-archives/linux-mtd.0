Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JXVoH-0002Wk-PE
	for linux-mtd@lists.infradead.org; Fri, 07 Mar 2008 06:12:02 +0000
Subject: Re: Powerfail-tests and jffs2-sync-mount
From: Artem Bityutskiy <dedekind@infradead.org>
To: =?ISO-8859-1?Q?Schl=E4gl?= "Manfred jun." <manfred.schlaegl@gmx.at>
In-Reply-To: <1204821719.3426.33.camel@lisa.alm.archives.at>
References: <1204821719.3426.33.camel@lisa.alm.archives.at>
Content-Type: text/plain; charset=utf-8
Date: Fri, 07 Mar 2008 08:10:46 +0200
Message-Id: <1204870246.23706.53.camel@sauron>
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

On Thu, 2008-03-06 at 17:41 +0100, Schl=C3=A4gl Manfred jun. wrote:
> Hi!
>=20
> I did some powerfail-testing of jffs2.=20
>=20
> Short overview (Contact me for details):
> Arch: ARM926EJ-S with 40MB rw jffs2 part on Samsung NAND-Flash
> Kernel: linux-2.6.12 (a little bit out of date, i know ;-))
> Test:=20
>  * Target-Loop
>    * filesystem-consistency:
>      * create dir
>      * copy data(> eraseblock-size) to new file
>      * delete a file
>    * file-consistency:
>      * logfile on jffs-part (simply appending text with echo)
>  * External random-time reset:
>    * external uC
>    * generates reset every 120+rand(0..30) seconds
>  * Run until no more space on filesystem
> Results:
>  * test with sync-mounted jffs2 (mount -o sync):
>    * duration 4:40 hours
>    * 131 generated resets
>    * consistent FS
>    * consistent logfile
>  * test with async mounted jffs2:
>    * duration 4:10 hours
>    * 118 generated resets
>    * consistent FS
>    * corrupted logfile (bad-chars, etc.)
>=20
> Now my question: Are there any non-obvious disadvantages, mounting jffs2
> synchronal, except lower speed and a little(depends on usage) decreased
> flash-life-time (wear-out), or is this anyway the default approach?

My understanding of the things is that this should not really matter. I
thought if you have some corruption in asynchronous mode, you should
have them in synchronous too, may its worth trying more synchronous mode
testing?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
