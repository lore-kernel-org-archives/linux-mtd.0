Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUNPd-00028M-It
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 18:23:30 +0000
Received: by wyb28 with SMTP id 28so766852wyb.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 11:23:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1307544476.31223.119.camel@localhost>
References: <1307487717-25402-1-git-send-email-computersforpeace@gmail.com>
	<1307487717-25402-5-git-send-email-computersforpeace@gmail.com>
	<1307544476.31223.119.camel@localhost>
Date: Wed, 8 Jun 2011 11:23:25 -0700
Message-ID: <BANLkTi=7Xivud_V=uMadL1BA-1ZC7V9RYw@mail.gmail.com>
Subject: Re: [PATCH 4/4] mtd: nand: define pr_fmt() to include __func__ in
	debug output
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Igor Grinberg <grinberg@compulab.co.il>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 8, 2011 at 7:47 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> Compare:
>
> read_bbt: Error reading bad block table
> read_bbt: error reading bad block table
>
> isn't the second version more correct? Or this depends on the country? I
> prefer the latter, but as long as all messages are consistent, I do not
> care much. What do you think?

I'm not sure it's not so much language-related here, since these type
of messages are just fragments anyway. I think the lowercase version
is more consistent.

Brian
