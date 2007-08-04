Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IHFXr-0002MI-NQ
	for linux-mtd@lists.infradead.org; Sat, 04 Aug 2007 05:03:37 -0400
Subject: Re: [PATCH 1/5] ubi-utils: introduction of libubi_common
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexander Schmidt <alexs@linux.vnet.ibm.com>
In-Reply-To: <200708021033.59483.alexs@linux.vnet.ibm.com>
References: <200707271723.38987.alexs@linux.vnet.ibm.com>
	<200707271728.48560.alexs@linux.vnet.ibm.com>
	<1185627090.26902.18.camel@sauron>
	<200708021033.59483.alexs@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Date: Sat, 04 Aug 2007 12:03:15 +0300
Message-Id: <1186218195.26902.42.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Frank Haverkamp <haver@linux.vnet.ibm.com>,
	Andreas Arnez <arnez@linux.vnet.ibm.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Alex,

On Thu, 2007-08-02 at 10:33 +0200, Alexander Schmidt wrote:
> On Saturday 28 July 2007, Artem Bityutskiy wrote:
> > Is it possible to make any patterns like this part of _utilities_?
> > UBI devices may have any names and it is defined by udev. The
> > library should not assume any UBI device name.
> >=20
> > Whole this file should be out of libubi,not part of it.
>=20
> I think this issue is caused by the command line interface we have at
> the moment, where only device numbers are specified and a path
> to a custom device cannot be specified.=20

Right, and I think it is trivial to add one more parameter to the
tools's cli - device node name.

> So even if we move this
> hardcoded path to the utils, the user is still not able to specify a
> custom device path in _any_ of the utils.

Just improve cli then or leave this hardcoded in the tools.

> What we have to do to resolve this issue IMO is to change the cli
> (while preserving the old one for legacy), which is a more intrusive

There is nothing intrusive actually, it is just simple parameter
addition. It is really easy.

>  However, even this change seems easier to me
> when the device path is hardcoded only in one place...

Alex, it is not really easier. And it is actually silly. Look at this
lububi_common.c, look at the functions. All functions are tiny wrappers
over a libc call:

Just look again at what you sent:

+int ubi_vol_open(int devn, int vol_id, int flags)
+{
+       char path[MAXPATH];
+       int fd;
+
+       snprintf(path, MAXPATH, DEFAULT_VOL_PATTERN, devn, vol_id);
+
+       fd =3D open(path, flags);
+
+       return fd;
+}
+
+int ubi_vol_close(int vol_fd)
+{
+       return close(vol_fd);
+}

And these are library calls. Users are able to call open() themselves.
And close() too. No need to wrap that at all. It does not worth it
to add library interfaces for these tiny things. Similar to other
functions in that file.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
