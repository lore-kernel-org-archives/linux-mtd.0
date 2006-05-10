Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FdmmR-0005cY-A1
	for linux-mtd@lists.infradead.org; Wed, 10 May 2006 07:23:10 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1147259209.2794.178.camel@pmac.infradead.org>
References: <445C476A.2090506@ak.jp.nec.com>
	<1147255421.16853.28.camel@sauron.oktetlabs.ru>
	<1147259209.2794.178.camel@pmac.infradead.org>
Content-Type: text/plain
Date: Wed, 10 May 2006 15:22:25 +0400
Message-Id: <1147260146.16853.41.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, joern@wohnheim.fh-wedel.de,
	KaiGai Kohei <kaigai@ak.jp.nec.com>
Subject: Re: [PATCH] XATTR support on JFFS2 (version. 5)
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-05-10 at 12:06 +0100, David Woodhouse wrote:
> It's not even 'minor'. It's total bullshit. If you can't look at the
> function name "delete_XATTR_REF" and work out what 'ref' is in that
> context, then you really shouldn't be trying to read the code. Life is
> hard; let's go shopping.
It's not bullshit. The name of function has nothing to do here - there
are many places like that (1), the function name does not have to
correlate (2).

> I got annoyed with you when you started on stuff like this in JFFS2
> code. Don't start on the XATTR code too.
I remember - you prevented me from many clean-ups and tidy-ups.

> I do see your point to a _certain_ extent, but let's concentrate on
> things that actually matter instead, OK?
I also see your point. Sorry, but I do not agree with this strategy.
Many things which "don't matter" may start mattering sooner or later.

Thanks.
