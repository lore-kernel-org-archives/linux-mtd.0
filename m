Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IW9VM-0002vu-PE
	for linux-mtd@lists.infradead.org; Fri, 14 Sep 2007 07:38:39 -0400
Subject: Re: Increasing read request size in JFFS2
From: Artem Bityutskiy <dedekind@infradead.org>
To: payagond@aol.com
In-Reply-To: <8C9C4D8EE8B6B02-F08-232@webmail-mf13.sysops.aol.com>
References: <8C9C4D8EE8B6B02-F08-232@webmail-mf13.sysops.aol.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 14 Sep 2007 14:38:27 +0300
Message-Id: <1189769907.14370.140.camel@sauron>
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

On Fri, 2007-09-14 at 07:24 -0400, payagond@aol.com wrote:
> Hi,
> I want to know, whether, we can exploit the fast sequential read=20
> (multiple pages at one go) feature of a nand flash device by existing=20
> JFFS2 code.
> read_pages in readahead decides to call either=20
> mapping->a_ops->readpages or mapping->a_ops->readpage
> can I implement jffs2_readpages to do so?
> The problem I feel is (if I have understood correctly)
> To read more pages at one shot, we need to anyway read the=20
> jffs2_raw_inode header first and then calculate the lenth to read, will=20
> it give me more performance than what is existing?
> regards
> payagond

JFFS2 reads maximum 3 2K NAND pages at a time, although very rarely.
Mostly it reads one page if compression is enabled.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
