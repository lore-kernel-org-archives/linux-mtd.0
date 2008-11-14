Subject: Re: [RFC] [PATCH] [MTD] Update internal API to support 64-bit
	device size
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <4912EE49.4070202@nokia.com>
References: <4912EE49.4070202@nokia.com>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Nov 2008 14:05:06 +0200
Message-Id: <1226664306.16925.96.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Adrian Hunter <ext-adrian.hunter@nokia.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2008-11-06 at 15:16 +0200, Adrian Hunter wrote:
> MTD internal API presently uses 32-bit values to represent
> device size.  This patch updates them to 64-bits but leaves
> the external API unchanged.  Extending the external API
> is a separate issue for several reasons.  First, no one
> needs it at the moment.  Secondly, whether the implementation
> is done with IOCTLs, sysfs or both is still debated.  Thirdly
> external API changes require the internal API to be accepted
> first.
>=20
> Note that although the MTD API will be able to support 64-bit
> device sizes, existing drivers do not and are not required
> to do so, although NAND base has been updated.
>=20
> In general, changing from 32-bit to 64-bit values cause little
> or no changes to the majority of the code with the following
> exceptions:
> 	- printk message formats
> 	- division and modulus of 64-bit values
> 	- NAND base support
> 	- 32-bit local variables used by mtdpart and mtdconcat
> 	- naughtily assuming one structure maps to another
> 	in MEMERASE ioctl
>=20
> Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>

Except of the minor issues (well, this is _RFC_), I support this patch.
I think it is a very good step towards 64-bit MTD support.

David, could you please look at this rather earlier than later, so we
would have time to fix and test this, because the patch touches
(slightly though) a lot of files.

I've included this and other nandsim patches to ubifs-2.6.git so that we
would test the patch more.

Adrian ran UBIFS on 8GiB nandsim device (backed to a file) and it works
fine.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
