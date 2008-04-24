Subject: Re: [PATCH][JFFS2] Fix garbage collector block search
From: David Woodhouse <dwmw2@infradead.org>
To: Alexander Belyakov <abelyako@googlemail.com>
In-Reply-To: <fe810cf0804240017v7069d6fdx6e7d03459d7d5503@mail.gmail.com>
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
	<fe810cf0804240017v7069d6fdx6e7d03459d7d5503@mail.gmail.com>
Content-Type: text/plain
Date: Thu, 24 Apr 2008 08:28:57 +0100
Message-Id: <1209022137.9212.942.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Alexander Belyakov <abelyako@mail.ru>,
	=?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
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

On Thu, 2008-04-24 at 11:17 +0400, Alexander Belyakov wrote:
> Hm... This script was just the easiest way to reproduce gc bug, but
> not the only. Are you sure this leak won't appear in other sane cases?

I don't believe there's really a leak; certainly not without XATTR.
My own original suspicion was based on a quick glance at debug output
and not seeing blocks getting refiled onto the erase_pending_wbuf list.
But grep shows my initial impression there was wrong.

If the only other evidence of a leak is that jffs2_statfs() reports
fluctuating values, then I'm no more likely to take it seriously than if
you tell me "a pixie told me" :)

Really, we make shit up in jffs2_statfs().

Or do you have other reasons to believe there's a leak? Other than the
one I fixed in commit 014b164e, that is. Although that's only on NOR.

-- 
dwmw2
