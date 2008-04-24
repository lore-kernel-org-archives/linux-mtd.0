Received: from fg-out-1718.google.com ([72.14.220.156])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JozVe-00060t-Ee
	for linux-mtd@lists.infradead.org; Thu, 24 Apr 2008 11:21:02 +0000
Received: by fg-out-1718.google.com with SMTP id 22so2926844fge.26
	for <linux-mtd@lists.infradead.org>;
	Thu, 24 Apr 2008 04:21:01 -0700 (PDT)
Message-ID: <fe810cf0804240421m5ca024f6xa0e03c1bd4f796f7@mail.gmail.com>
Date: Thu, 24 Apr 2008 15:21:01 +0400
From: "Alexander Belyakov" <abelyako@googlemail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [PATCH][JFFS2] Fix garbage collector block search
In-Reply-To: <1209035103.9212.1051.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <E1J2Trs-000IFE-00.abelyako-mail-ru@f65.mail.ru>
	<1208964656.9212.811.camel@pmac.infradead.org>
	<fe810cf0804240017v7069d6fdx6e7d03459d7d5503@mail.gmail.com>
	<1209022137.9212.942.camel@pmac.infradead.org>
	<fe810cf0804240048w783fbdc0sa701fc7c59b3d06f@mail.gmail.com>
	<1209023484.9212.960.camel@pmac.infradead.org>
	<fe810cf0804240314w70364639nb2ba38cd10cd7b46@mail.gmail.com>
	<1209033162.9212.1031.camel@pmac.infradead.org>
	<fe810cf0804240342r35d0ecf8s9ee159a2980a83c3@mail.gmail.com>
	<1209035103.9212.1051.camel@pmac.infradead.org>
Cc: Alexander Belyakov <abelyako@mail.ru>,
	=?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	KaiGai Kohei <kaigai@ak.jp.nec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 24, 2008 at 3:05 PM, David Woodhouse <dwmw2@infradead.org> wrote:
> On Thu, 2008-04-24 at 14:42 +0400, Alexander Belyakov wrote:
>  > I was checking this on Sibley-like parts, not NAND. Sorry for
>  > confusion.
>
>  Oh, so you have an inline cleanmarker? That makes sense. You'll lose
>  c->cleanmarker_size from c->free_size for every block you erase.
>

So you are speaking about "Fix free space leak with in-band
cleanmarkers" patch. Right? It seems I've overlooked it. Now I see
what was happening there - thank you.

Alexander
