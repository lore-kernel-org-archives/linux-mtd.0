Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QuU6Y-0004xP-Ew
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2011 18:47:43 +0000
Received: by wwj26 with SMTP id 26so707625wwj.0
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Aug 2011 11:47:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1313777581.2146.3.camel@koala>
References: <EBEBA6C3BD40EF4B8C0A5B8AD5A28F993B6C6EB71A@GVW0547EXC.americas.hpqcorp.net>
	<1313773387.6607.83.camel@sauron>
	<CAN8TOE-1eO-pihTwU6ZE=HZtXNwXg3-ft7qXipvm0Utj6RWBLQ@mail.gmail.com>
	<1313777581.2146.3.camel@koala>
Date: Fri, 19 Aug 2011 11:47:39 -0700
Message-ID: <CAN8TOE_d3zDS6w8qCKNsNXc89XT8NTm1yTGrbgW7KhGxtEzF=w@mail.gmail.com>
Subject: Re: [BUG] mtd-utils: nandwrite: invalid erase after page write failure
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: "Fryar, Jeff" <jeff.fryar@hp.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 19, 2011 at 11:13 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> Hi Brian,
>
> as always, sorry for long delays, I have very little time for hobby
> projects. I guess I'll end up disappearing from mtd at some point, but
> will see, the plan is to still help MTD moving forward.

Well, this last e-mail was no delay at all! But I understand the delay
when it happens.

What will happen if you disappear? :(

> Sure you have to base on the master branch. The tag was indeed a "fork"
> - I took tag v1.4.5 and put your patch on top. So v1.4.6 is not part of
> the master branch. I did so because I did not want to include whole
> bunch of changes which could add new regressions - I wanted to make just
> a "bugfix" release.

Right, makes sense. I should have figured.

Brian
