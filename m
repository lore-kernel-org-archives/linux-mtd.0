Received: from mail.artecdesign.ee ([62.65.32.9] helo=postikukk.artecdesign.ee)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HTdtx-0006oH-NO
	for linux-mtd@lists.infradead.org; Tue, 20 Mar 2007 08:57:23 -0400
From: Indrek Kruusa <indrek.kruusa@artecdesign.ee>
To: Michel Marti <mma@objectxp.com>
Subject: Re: JFFS2: Filesystem corruption after umount/mount
Date: Tue, 20 Mar 2007 14:56:58 +0200
References: <etoj9s$b84$1@sea.gmane.org>
In-Reply-To: <etoj9s$b84$1@sea.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200703201456.58663.indrek.kruusa@artecdesign.ee>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=DChel kenal p=E4eval (teisip=E4ev 20 m=E4rts 2007 2:15 pm) kirjutas Michel=
 Marti:
> Hello,
>
> I'm experiencing a strange problem with JFFS2 using Linux
> 2.6.21-rc4-g78157a82 from denx.de on PowerPC. After unmounting and
> remounting the filesystem, some directory entries are corrupt. See the
> transcript below.
>

 ...snip ...

>
> Any Hints?


As I remember I have seen such a thing with JFFS2 image built=20
without --no-cleanmarkers or if src_dir/ had hardlinks inside.
But I had NAND flash and you don't use pre-built FS image here. But you may=
=20
try to build one. Also try to mount it read-only.


Best regards,
Indrek
