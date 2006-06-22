Received: from nf-out-0910.google.com ([64.233.182.191])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FtNlK-0006pF-HT
	for linux-mtd@lists.infradead.org; Thu, 22 Jun 2006 07:54:45 -0400
Received: by nf-out-0910.google.com with SMTP id p48so249788nfa
	for <linux-mtd@lists.infradead.org>;
	Thu, 22 Jun 2006 04:54:16 -0700 (PDT)
Message-ID: <625fc13d0606220454o52d99efes74eb86ba3fe02bd7@mail.gmail.com>
Date: Thu, 22 Jun 2006 06:54:16 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: dedekind@infradead.org
Subject: Re: Current mtd tree is broken
In-Reply-To: <1150959173.4244.9.camel@sauron.oktetlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <625fc13d0606211535y2b85e229ubd235b3849c2013e@mail.gmail.com>
	<1150959173.4244.9.camel@sauron.oktetlabs.ru>
Cc: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/22/06, Artem B. Bityutskiy <dedekind@infradead.org> wrote:
> On Wed, 2006-06-21 at 17:35 -0500, Josh Boyer wrote:
> > As panto pointed out on IRC today, the current MTD git tree is
> > completely broken for quite a few chip types.  Anything older than
> > Intel Sibley or P30 is broken since writesize is not set to something
> > other than 0 in the other cases.  This causes a BUG to trigger in
> > add_mtd_device because someone decided writesize == 0 was not a sane
> > thing.
>
> How about this?
>
> writesize is a new feature and many drivers may not initialize it. It
> might be harmless, depending on the usage of the driver. So don't be
> that difficult and issue warning instead of getting into panic.

I don't like that very much.  It's laziness.  An interface was added
and working.  Someone changed the semantics of it, but didn't fix all
the things effected.

If it's just changed to a WARN, it will take a really long time for
everything to get fixed and it will quickly become an FAQ item.  "My
$random driver used to work and now it gets a warn on, what do I do?"
Just fix it now.

josh
