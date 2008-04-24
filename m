Received: from fg-out-1718.google.com ([72.14.220.159])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JowBZ-0002GJ-Bw
	for linux-mtd@lists.infradead.org; Thu, 24 Apr 2008 07:48:06 +0000
Received: by fg-out-1718.google.com with SMTP id 22so2860947fge.26
	for <linux-mtd@lists.infradead.org>;
	Thu, 24 Apr 2008 00:48:04 -0700 (PDT)
Message-ID: <fe810cf0804240048w783fbdc0sa701fc7c59b3d06f@mail.gmail.com>
Date: Thu, 24 Apr 2008 11:48:04 +0400
From: "Alexander Belyakov" <abelyako@googlemail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [PATCH][JFFS2] Fix garbage collector block search
In-Reply-To: <1209022137.9212.942.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <E1J2Trs-000IFE-00.abelyako-mail-ru@f65.mail.ru>
	<fe810cf0804230431m2bf80e83h4fa71bd5887b7587@mail.gmail.com>
	<1208950350.9212.791.camel@pmac.infradead.org>
	<fe810cf0804230608t1183dbf4l99b168476875bfc0@mail.gmail.com>
	<1208959286.9212.799.camel@pmac.infradead.org>
	<1208961030.9212.806.camel@pmac.infradead.org>
	<fe810cf0804230825n21944ae3p4174512c2c0f9589@mail.gmail.com>
	<1208964656.9212.811.camel@pmac.infradead.org>
	<fe810cf0804240017v7069d6fdx6e7d03459d7d5503@mail.gmail.com>
	<1209022137.9212.942.camel@pmac.infradead.org>
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

On Thu, Apr 24, 2008 at 11:28 AM, David Woodhouse <dwmw2@infradead.org> wrote:
> On Thu, 2008-04-24 at 11:17 +0400, Alexander Belyakov wrote:
>  > Hm... This script was just the easiest way to reproduce gc bug, but
>  > not the only. Are you sure this leak won't appear in other sane cases?
>
>  If the only other evidence of a leak is that jffs2_statfs() reports
>  fluctuating values, then I'm no more likely to take it seriously than if
>  you tell me "a pixie told me" :)
>

Values are not fluctuating. After about 40 iterations I have no space
to write 2Mbytes file on 4MiB volume constantly getting "No space left
on device" until remount.

It might be not a real leak, but anyway pixie doesn't feel this is a
correct behavior. :)
