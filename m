Subject: Re: [PATCH] UBI: Don't exit from ubi_thread until
	kthread_should_stop() is true
From: Artem Bityutskiy <dedekind@infradead.org>
To: Vitaliy Gusev <vgusev@openvz.org>
In-Reply-To: <200811051827.19164.vgusev@openvz.org>
References: <200811051827.19164.vgusev@openvz.org>
Content-Type: text/plain; charset=utf-8
Date: Thu, 06 Nov 2008 09:22:36 +0200
Message-Id: <1225956156.26460.22.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-11-05 at 18:27 +0300, Vitaliy Gusev wrote:
> If ubi_thread() exits but kthread_should_stop() is not true
> then kthread_stop() will never return and cleanup thread
> will forever stay in "D" state.
>=20
> Signed-off-by: Vitaliy Gusev <vgusev@openvz.org>

Thanks, I'll push your patch.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
