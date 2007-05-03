Received: from an-out-0708.google.com ([209.85.132.248])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HjXf4-0007pH-5Z
	for linux-mtd@lists.infradead.org; Thu, 03 May 2007 05:31:46 -0400
Received: by an-out-0708.google.com with SMTP id d40so1080046and
	for <linux-mtd@lists.infradead.org>;
	Thu, 03 May 2007 02:31:36 -0700 (PDT)
Message-ID: <fe810cf0705030231g790cb2fdh50b8d8d00ed45d8a@mail.gmail.com>
Date: Thu, 3 May 2007 13:31:35 +0400
From: "Alexander Belyakov" <abelyako@googlemail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [PATCH] [JFFS2] Non-contiguous write bug fix (Sibley)
In-Reply-To: <1178125804.11120.67.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <fe810cf0704170414r59900903rc8ed2e52d22eb833@mail.gmail.com>
	<1176908804.21611.37.camel@shinybook.infradead.org>
	<fe810cf0705020649t730abfb6t6da54e1b0701785c@mail.gmail.com>
	<1178114314.11120.12.camel@pmac.infradead.org>
	<fe810cf0705020753k22193b4eqa8a177aaae10f040@mail.gmail.com>
	<1178125804.11120.67.camel@pmac.infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/2/07, David Woodhouse <dwmw2@infradead.org> wrote:
>
> Ah, I understand. So this should fix it?
>
> diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
> index c556e85..91d1d0f 100644
> --- a/fs/jffs2/wbuf.c
> +++ b/fs/jffs2/wbuf.c
> @@ -637,7 +637,10 @@ static int __jffs2_flush_wbuf(struct jffs2_sb_info *c, int pad)
>
>         memset(c->wbuf,0xff,c->wbuf_pagesize);
>         /* adjust write buffer offset, else we get a non contiguous write bug */
> -       c->wbuf_ofs += c->wbuf_pagesize;
> +       if (SECTOR_ADDR(c->wbuf_ofs) == SECTOR_ADDR(c->wbuf_ofs+c->wbuf_pagesize))
> +               c->wbuf_ofs += c->wbuf_pagesize;
> +       else
> +               c->wbuf_ofs = 0xffffffff;
>         c->wbuf_len = 0;
>         return 0;
>  }
>

Yes, it helps.

Thanks,
Alexander
