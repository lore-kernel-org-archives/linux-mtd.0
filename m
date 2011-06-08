Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUEeF-0006rL-36
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 09:01:59 +0000
Received: by fxm14 with SMTP id 14so228361fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 02:01:57 -0700 (PDT)
Subject: Re: [PATCH 01/44] mtd: add new API for handling MTD registration
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <BANLkTimzBiuJd+rupHi=ka0UB3MaxqZ2zw@mail.gmail.com>
References: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
	<1307453803-31950-2-git-send-email-dbaryshkov@gmail.com>
	<20110607134429.GE21174@pulham.picochip.com>
	<4DEE36D6.2070009@gmail.com> <1307522251.31223.10.camel@localhost>
	<BANLkTimzBiuJd+rupHi=ka0UB3MaxqZ2zw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 08 Jun 2011 11:57:40 +0300
Message-ID: <1307523460.31223.29.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jamie Iles <jamie@jamieiles.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-06-08 at 12:57 +0400, Dmitry Eremin-Solenikov wrote:
> On 6/8/11, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Tue, 2011-06-07 at 18:33 +0400, Dmitry Eremin-Solenikov wrote:
> >> >  Also some kernel-doc to describe the search order would be nice.
> >>
> >> Search order is mainly detailed either by defaults specified in
> >> mtdpart.c or by probe types which user specifies.
> >
> > I look at the functions and they are difficult to understand. We need to
> > start with good kerneldoc comment for 'parse_mtd_partitions()'. The
> > default behavior has to be well-documented. I'd like to apply this
> > patch, how does it look to you?
> 
> Looks good.

OK, pushed to l2-mtd-2.6.git.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
