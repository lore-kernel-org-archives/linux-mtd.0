Received: from fg-out-1718.google.com ([72.14.220.152])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Joyu7-0002ZD-0M
	for linux-mtd@lists.infradead.org; Thu, 24 Apr 2008 10:42:15 +0000
Received: by fg-out-1718.google.com with SMTP id 22so2914783fge.26
	for <linux-mtd@lists.infradead.org>;
	Thu, 24 Apr 2008 03:42:12 -0700 (PDT)
Message-ID: <fe810cf0804240342r35d0ecf8s9ee159a2980a83c3@mail.gmail.com>
Date: Thu, 24 Apr 2008 14:42:12 +0400
From: "Alexander Belyakov" <abelyako@googlemail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [PATCH][JFFS2] Fix garbage collector block search
In-Reply-To: <1209033162.9212.1031.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <E1J2Trs-000IFE-00.abelyako-mail-ru@f65.mail.ru>
	<1208961030.9212.806.camel@pmac.infradead.org>
	<fe810cf0804230825n21944ae3p4174512c2c0f9589@mail.gmail.com>
	<1208964656.9212.811.camel@pmac.infradead.org>
	<fe810cf0804240017v7069d6fdx6e7d03459d7d5503@mail.gmail.com>
	<1209022137.9212.942.camel@pmac.infradead.org>
	<fe810cf0804240048w783fbdc0sa701fc7c59b3d06f@mail.gmail.com>
	<1209023484.9212.960.camel@pmac.infradead.org>
	<fe810cf0804240314w70364639nb2ba38cd10cd7b46@mail.gmail.com>
	<1209033162.9212.1031.camel@pmac.infradead.org>
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

On Thu, Apr 24, 2008 at 2:32 PM, David Woodhouse <dwmw2@infradead.org> wrote:
> On Thu, 2008-04-24 at 14:14 +0400, Alexander Belyakov wrote:
>  >
>  > Space comes back after remount.
>  >
>  > I'm able to reproduce problem with stable 2.6.25 kernel, but I see no
>  > such fails with the latest mtd-2.6.git snapshot. It seems changes in
>  > jffs2 since 2.6.25 merge address this issue somehow.
>
>  Hm, interesting. I don't see any change which should have caused that.
>  The cleanmarker thing shouldn't make any difference on NAND. And finally
>  dropping TEST_TOTLEN shouldn't have made any difference either.
>

I was checking this on Sibley-like parts, not NAND. Sorry for confusion.

-a
