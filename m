Subject: Re: [PATCH][JFFS2] Fix garbage collector block search
From: David Woodhouse <dwmw2@infradead.org>
To: Alexander Belyakov <abelyako@googlemail.com>
In-Reply-To: <fe810cf0804240314w70364639nb2ba38cd10cd7b46@mail.gmail.com>
References: <E1J2Trs-000IFE-00.abelyako-mail-ru@f65.mail.ru>
	<fe810cf0804230608t1183dbf4l99b168476875bfc0@mail.gmail.com>
	<1208959286.9212.799.camel@pmac.infradead.org>
	<1208961030.9212.806.camel@pmac.infradead.org>
	<fe810cf0804230825n21944ae3p4174512c2c0f9589@mail.gmail.com>
	<1208964656.9212.811.camel@pmac.infradead.org>
	<fe810cf0804240017v7069d6fdx6e7d03459d7d5503@mail.gmail.com>
	<1209022137.9212.942.camel@pmac.infradead.org>
	<fe810cf0804240048w783fbdc0sa701fc7c59b3d06f@mail.gmail.com>
	<1209023484.9212.960.camel@pmac.infradead.org>
	<fe810cf0804240314w70364639nb2ba38cd10cd7b46@mail.gmail.com>
Content-Type: text/plain
Date: Thu, 24 Apr 2008 11:32:42 +0100
Message-Id: <1209033162.9212.1031.camel@pmac.infradead.org>
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

On Thu, 2008-04-24 at 14:14 +0400, Alexander Belyakov wrote:
> 
> Space comes back after remount.
> 
> I'm able to reproduce problem with stable 2.6.25 kernel, but I see no
> such fails with the latest mtd-2.6.git snapshot. It seems changes in
> jffs2 since 2.6.25 merge address this issue somehow.

Hm, interesting. I don't see any change which should have caused that.
The cleanmarker thing shouldn't make any difference on NAND. And finally
dropping TEST_TOTLEN shouldn't have made any difference either.

-- 
dwmw2
