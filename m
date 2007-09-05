Received: from nf-out-0910.google.com ([64.233.182.184])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1ISwUb-0001Vq-H2
	for linux-mtd@lists.infradead.org; Wed, 05 Sep 2007 11:08:35 -0400
Received: by nf-out-0910.google.com with SMTP id h3so1925254nfh
	for <linux-mtd@lists.infradead.org>;
	Wed, 05 Sep 2007 08:08:32 -0700 (PDT)
Message-ID: <fe810cf0709050808x56ab7f28v6c79caa2d5c0b818@mail.gmail.com>
Date: Wed, 5 Sep 2007 19:08:31 +0400
From: "Alexander Belyakov" <abelyako@googlemail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [PATCH] [JFFS2] Sibley non-contiguous write bug fix
In-Reply-To: <1188988798.2745.8.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <fe810cf0709050235r47986ba4u2683917550169083@mail.gmail.com>
	<1188988798.2745.8.camel@shinybook.infradead.org>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 9/5/07, David Woodhouse <dwmw2@infradead.org> wrote:
>
> That looks sane enough, I suppose. But I wonder if instead we should
> just be setting c->wbuf_ofs = 0xffffffff in jffs2_find_nextblock()?
>

Probably, yes. I'm just not sure at the moment if it is an ultimate
solution eliminating non-contiguous write bug.

Anyway, I've tried to set c->wbuf_ofs = 0xffffffff before
jffs2_find_nexblock() exit and this made my previously failed test
case pass (as well as my jffs2_flash_writev() patch).

Thanks,
Alexander
