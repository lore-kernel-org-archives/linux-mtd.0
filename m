Received: from zproxy.gmail.com ([64.233.162.194])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EpTpx-0005AW-Vm
	for linux-mtd@lists.infradead.org; Thu, 22 Dec 2005 12:02:49 -0500
Received: by zproxy.gmail.com with SMTP id i11so163189nzi
	for <linux-mtd@lists.infradead.org>;
	Thu, 22 Dec 2005 09:02:40 -0800 (PST)
Message-ID: <625fc13d0512220902t5031dcb8w5a0af9c6f75c90bf@mail.gmail.com>
Date: Thu, 22 Dec 2005 11:02:40 -0600
From: Josh Boyer <jwboyer@gmail.com>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
In-Reply-To: <43AAD478.4050205@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <twig.1135265899.51714@cdac.in> <43AAD478.4050205@yandex.ru>
Cc: linux-mtd@lists.infradead.org, Nikhil <nikhils@cdac.in>
Subject: Re: CLEANMARKER!!
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/22/05, Artem B. Bityutskiy <dedekind@yandex.ru> wrote:
> Nikhil wrote:
>
> > jffs2dump of an image shows the presence of cleanmarker at the beginnin=
g
> > of all the eraseblocks (even if the block contains some valid data). wh=
y
> > is there a need to write cleanmarker in each erase block while creating
> > image using mkfs.jffs2?
> There is no real need. mkfs.jffs2 just implemented that way. It just
> tries to be the same as if the same image would be created by means of
> copying files t oa mounted JFFS2, then dumping /dev/mtdX...

It's an optimization of mkfs.jffs2.  If it didn't write those
cleanmarkers in the image, JFFS2 would scan flash, find free
eraseblocks, and go erase them again since the cleanmarker is missing.
 With the cleanmarkers there, the erase of already erased blocks is
omitted.

josh
