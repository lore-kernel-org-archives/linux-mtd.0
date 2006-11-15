Received: from mgw-ext11.nokia.com ([131.228.20.170])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GkO6c-0007x2-Gk
	for linux-mtd@lists.infradead.org; Wed, 15 Nov 2006 11:59:26 -0500
Subject: Re: JFFS2 tools
From: Artem Bityutskiy <dedekind@infradead.org>
To: Elias <dilu666@gmail.com>
In-Reply-To: <3aad55d90611150529v4ad67c51gf5ae36280c727005@mail.gmail.com>
References: <3aad55d90611150529v4ad67c51gf5ae36280c727005@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 15 Nov 2006 17:01:46 +0200
Message-Id: <1163602907.5597.4.camel@sauron>
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

On Wed, 2006-11-15 at 15:29 +0200, Elias wrote:
> I wonder if there are any tools for the jffs2 that can report various
> information about the file system and flash chip that it resides on,
> such as the structure of the dirty,clean and free blocks, the total
> data structure of the flash chip, as well as the physical allocation
> of data on the chip. Are there any?

Yeah, it would be nice to have such a debugging/analysis tool, but I am
not aware of any. There is JFFS2 dump which can dump the FS and you may
write a script which will provide you the needed information by means of
parsing its output. But beware the tool may be outdated. I am not sure
if it understands summary and xattr stuff which went to JFFS2 rather
recently.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
