Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUGig-0000tM-Bs
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 11:14:43 +0000
Received: by bwz1 with SMTP id 1so416789bwz.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 04:14:40 -0700 (PDT)
Subject: Re: [PATCH 2/6] mtdinfo: send help/version info to stdout
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <BANLkTikQzMtE6A=zNBU9ADjPKdOeTUzgtg@mail.gmail.com>
References: <1307427548-29306-1-git-send-email-vapier@gentoo.org>
	<1307427548-29306-2-git-send-email-vapier@gentoo.org>
	<1307428609.11104.39.camel@localhost>
	<BANLkTikQzMtE6A=zNBU9ADjPKdOeTUzgtg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 08 Jun 2011 14:10:22 +0300
Message-ID: <1307531422.31223.49.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-06-07 at 11:00 -0400, Mike Frysinger wrote:
> On Tue, Jun 7, 2011 at 02:36, Artem Bityutskiy wrote:
> > On Tue, 2011-06-07 at 02:19 -0400, Mike Frysinger wrote:
> >> Usage/version information should go to stdout when it is expected behavior
> >> (i.e. the user requested it explicitly).  This info should go to stderr
> >> only when the usage info is being shown as a result of incorrect options.
> >
> > This is fine, but all other ubi utils need this change then as well. I
> > think this piece of code was copypasted in all ubi-utils, so you should
> > easily find it and change.
> 
> you just like making me work :p

It is difficult to not like this - you are doing very good job! :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
