Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Diqfy-0007AG-Cs
	for linux-mtd@lists.infradead.org; Thu, 16 Jun 2005 05:28:43 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: zhao <forrest.zhao@intel.com>
In-Reply-To: <42B14245.7070500@intel.com>
References: <8126E4F969BA254AB43EA03C59F44E840263CEAE@pdsmsx404>
	<1118827313.22181.52.camel@hades.cambridge.redhat.com>
	<42B11054.4020509@intel.com> <42B12463.4060106@yandex.ru>
	<42B14245.7070500@intel.com>
Content-Type: text/plain
Date: Thu, 16 Jun 2005 13:28:05 +0400
Message-Id: <1118914085.29691.20.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: jffs2 corrupt rarely, how to fix it?
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-06-16 at 17:11 +0800, zhao wrote:
> In fact, we were using JFFS2 on kernel 2.4.10.......
> And we encountered some problems(e.g. jffs2 corrupt rarely), it seems 
> that I need to
> back-port JFFS2 in latest 2.4 kernel(2.4.31, right?) to 2.4.10 :( if 
> they are not willing
> to upgrade to latest 2.4 kernel in the product.

Well, poor you. :-)

I'm not sure to which kernel you should better port, probably yes, the
latest 2.4, but I consider using old kernels as very bad approach, even
silly in some respects. 

Hundreds of bugs were fixed since 2.4.10. VFS also had many bugs, and
the dependency of JFFS2 on VFS is obvious. So, if you meet a problem,
nobody will assist you finding bugs which were already fixed several
years ago. Will you find them yourself? - no problems, but digging such
an old code can't be interesting, it will barely increase your skills or
bring any professional satisfaction. Its much better searching bugs in
modern kernels. That's your choice - I'd better change the employer :-)

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
