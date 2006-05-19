Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fh3db-0008Kp-KO
	for linux-mtd@lists.infradead.org; Fri, 19 May 2006 08:00:02 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1148039632.3875.131.camel@pmac.infradead.org>
References: <1147999465.13399.33.camel@shinybook.infradead.org>
	<1148000482.13399.42.camel@shinybook.infradead.org>
	<1148039632.3875.131.camel@pmac.infradead.org>
Content-Type: text/plain
Date: Fri, 19 May 2006 15:58:51 +0400
Message-Id: <1148039931.3199.12.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Duplication of dirent names in JFFS2 summary
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-05-19 at 12:53 +0100, David Woodhouse wrote:
> On Fri, 2006-05-19 at 02:01 +0100, David Woodhouse wrote:
> > And would we benefit by using a variable-length encoding of the integers
> > in the summary entries? We're far from being CPU-bound when we eat
> > these, surely?
> 
> Thinking of something vaguely like UTF-8, but more optimal. Each byte
> would convey seven bits of information, and the top bit would indicate
> whether there's a further byte to be added.
Why do you think it really worth it ?

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
