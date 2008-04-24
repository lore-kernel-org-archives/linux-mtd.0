Subject: Re: [PATCH][JFFS2] Fix garbage collector block search
From: David Woodhouse <dwmw2@infradead.org>
To: Alexander Belyakov <abelyako@googlemail.com>
In-Reply-To: <fe810cf0804240048w783fbdc0sa701fc7c59b3d06f@mail.gmail.com>
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
	<fe810cf0804240048w783fbdc0sa701fc7c59b3d06f@mail.gmail.com>
Content-Type: text/plain
Date: Thu, 24 Apr 2008 08:51:24 +0100
Message-Id: <1209023484.9212.960.camel@pmac.infradead.org>
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

On Thu, 2008-04-24 at 11:48 +0400, Alexander Belyakov wrote:
> Values are not fluctuating. After about 40 iterations I have no space
> to write 2Mbytes file on 4MiB volume constantly getting "No space left
> on device" until remount.

With no existing files?

> It might be not a real leak, but anyway pixie doesn't feel this is a
> correct behavior. :)

Ah, OK -- that's definitely not what I was seeing here. I'll try harder
to reproduce.

Does the space come back when you remount? And are you running with the
new paranoia check I added in commit 85a62db6?

-- 
dwmw2
