From: dwmw2@infradead.org (David Woodhouse)
Date: 05 Feb 2003 14:43:17 +0000
Subject: Is JFFS2 position independent or not?
In-Reply-To: <oprj4lj2kp7bj7b7@cbnsitar.cbnco.com>
References: <oprj4lj2kp7bj7b7@cbnsitar.cbnco.com>
Message-ID: <1044456197.2222.51.camel@passion.cambridge.redhat.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Wed, 2003-02-05 at 14:37, Vladimir Doukhanine wrote:
> Hi,
> =20
> I=E2=80=99m just wandering if JFFS2 file system is position independent o=
r not?

Yes, it is. You can copy images from one device to another without
problems. What you can _not_ do, however, is move an image from one
device to a device with a _smaller_ eraseblock size. Other than that,
you should be fine.

--=20
dwmw2
