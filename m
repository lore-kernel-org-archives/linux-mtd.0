Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rss3m-0002SG-5g
 for linux-mtd@lists.infradead.org; Thu, 02 Feb 2012 08:30:26 +0000
Received: by dakp5 with SMTP id p5so1977477dak.36
 for <linux-mtd@lists.infradead.org>; Thu, 02 Feb 2012 00:30:24 -0800 (PST)
Message-ID: <1328171541.28171.134.camel@sauron.fi.intel.com>
Subject: Re: Secure deletion for UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Thu, 02 Feb 2012 10:32:21 +0200
In-Reply-To: <alpine.DEB.2.00.1201241206570.30726@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1201241206570.30726@eristoteles.iwoars.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-ni4ORTaW5j+ff7QEbZ6S"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-ni4ORTaW5j+ff7QEbZ6S
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-01-24 at 12:31 +0100, Joel Reardon wrote:
> This patch provides efficient secure deletion for UBIFS. In short, every=
=20
> data node is stored encrypted on the flash memory, each with a different=
=20
> key. Encryption/decryption are handled in the compression/decompression=
=20

Hi Joel,

I think this idea is clever. Sorry for delays, I am realy swamped and
cannot do a detailed review. But let me provide a minimum feed back so
far to have this moving. I am looking forward to see your work upstream
and I hope you'll be persistent enough to make sure this happens. This
partially depends on me, but mostly on you, because I do not have time
to help you much :-)

Could you please stare with the following.

1. Inline the patch instead of attaching it. This way people will be
able to answer and cite the relevant bits.

2. Provide a bit more detailed design explanation.

3. CC LKML: linux-kernel@vger.kernel.org

4. CC the fs-devel mailing list: linux-fsdevel@vger.kernel.org

5. Provide information how you tested the patch

I also noticed that you changed on-flash data structures (struct
ubifs_branch) and make incompatible changes. This is a serious change
and at very least needs introduction of new format. UBIFS has only one
on-flash format, but it has some provisioned mechanisms for supporting
new formats. Also, this needs some testing: check that old formats
refuse mounting new ones, check that new UBIFS supports both formats,
etc.

--=20
Best Regards,
Artem Bityutskiy

--=-ni4ORTaW5j+ff7QEbZ6S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPKkoVAAoJECmIfjd9wqK0pBoP/2jxIhxYFq2OEBp6rLJG2wZI
pfKIG5hy0rFjNvNFlNL2uIJC0OvnNNvcYlEZPaXQ8zZ8bpDhl6ECXQPI4+QvvQRr
GjS3JQY2T2i0cgujglRkufixVkDN+QdJtwr6kYg8httQL0NR18knc687ot1AnGr8
6TusggOoENvj9DGQmG+KATgaOybWICWXhnsVUTDReo7WN08ygaTxv+5Yvak5FbKG
riCYoIgggtbiJDmMjAiOfroHNjwVtPJKmFaY+FCXEgMICq0kMS4imVvGlrY2zWe0
PjlgqPybFaTEJloaDQBP4UzYjrXOA1TaeMspi44nMpzN38DAyKiZtXngsEVrG6fI
Dkhc/Jc4CoCia6BPyQYXceN/C+lRlE71YX0VC1cmv6+sidTNg672ngh7KKJLn1mb
WkkIoRyGmVwuvhR4VkBeYXRig8yXU4BOnZ4YhD6GQ3tQ1ecYbx7Iw93rWgFqhmSk
oD2Xkf2Yn5bNsc7lGxeo75QcfGLi4JUppVNtfezrnBIWN6ZVJAnGWWj+yxUWCo28
v7ZON5q9z0G/r41Sm8XHRZhbttxsrDQIAOlfaBF3PPcvdl7nLOCx9OVlcHV+2q5L
NXxxOsc8ihUkoQoFSA+BamAYlHXPaYML64IpZoZjHh2dx8sHwrU0vmT6F9Y2Obld
mg1kQ4ms2m1hULU+myjN
=z8jb
-----END PGP SIGNATURE-----

--=-ni4ORTaW5j+ff7QEbZ6S--
