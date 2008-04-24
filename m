Received: from fg-out-1718.google.com ([72.14.220.153])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JoviP-0004EQ-6a
	for linux-mtd@lists.infradead.org; Thu, 24 Apr 2008 07:17:57 +0000
Received: by fg-out-1718.google.com with SMTP id 22so2851255fge.26
	for <linux-mtd@lists.infradead.org>;
	Thu, 24 Apr 2008 00:17:55 -0700 (PDT)
Message-ID: <fe810cf0804240017v7069d6fdx6e7d03459d7d5503@mail.gmail.com>
Date: Thu, 24 Apr 2008 11:17:55 +0400
From: "Alexander Belyakov" <abelyako@googlemail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [PATCH][JFFS2] Fix garbage collector block search
In-Reply-To: <1208964656.9212.811.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <E1J2Trs-000IFE-00.abelyako-mail-ru@f65.mail.ru>
	<fe810cf0801180828g7a48b6a1u69e35f832185b5eb@mail.gmail.com>
	<1208882833.9212.629.camel@pmac.infradead.org>
	<fe810cf0804230431m2bf80e83h4fa71bd5887b7587@mail.gmail.com>
	<1208950350.9212.791.camel@pmac.infradead.org>
	<fe810cf0804230608t1183dbf4l99b168476875bfc0@mail.gmail.com>
	<1208959286.9212.799.camel@pmac.infradead.org>
	<1208961030.9212.806.camel@pmac.infradead.org>
	<fe810cf0804230825n21944ae3p4174512c2c0f9589@mail.gmail.com>
	<1208964656.9212.811.camel@pmac.infradead.org>
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

On Wed, Apr 23, 2008 at 7:30 PM, David Woodhouse <dwmw2@infradead.org> wrote:
> On Wed, 2008-04-23 at 19:25 +0400, Alexander Belyakov wrote:
>  >
>  > Continuously running script from my previous message, I've just
>  > noticed that space leak does exist. Available space (reported by df)
>  > decreases with each iteration. I've not investigated this in details
>  > yet, but it seems the behavior is the same for XATTR support enabled
>  > and disabled.
>
>  I wouldn't worry too much about what jffs2_statfs() says. We really do
>  make crap up there :)
>

Hm... This script was just the easiest way to reproduce gc bug, but
not the only. Are you sure this leak won't appear in other sane cases?

-a
