Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZJXL-0003dh-Ev
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 09:15:52 +0000
Received: by pwi3 with SMTP id 3so545217pwi.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Jun 2011 02:15:47 -0700 (PDT)
Subject: Re: [PATCH 01/18] mtd: abstract last MTD partition parser argument
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Wed, 22 Jun 2011 12:16:29 +0300
In-Reply-To: <BANLkTimFJsAv+u7i_csaBrQpsORze1uWOw@mail.gmail.com>
References: <1307833922-21602-1-git-send-email-dbaryshkov@gmail.com>
	<1307833922-21602-2-git-send-email-dbaryshkov@gmail.com>
	<1308716496.18119.8.camel@sauron>
	<BANLkTimc-syC35X8Tej2w3owyXZttU0wKw@mail.gmail.com>
	<1308732940.18119.55.camel@sauron>
	<BANLkTimFJsAv+u7i_csaBrQpsORze1uWOw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1308734194.18119.56.camel@sauron>
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-06-22 at 13:05 +0400, Dmitry Eremin-Solenikov wrote:
> >> No, no and no. This data is passed to all parsers, so it should be valid
> >> for all
> >> of them. Either we have to add a way to specify, what exactly we have
> >> provided,
> >> or we have to leave data as separate struct fields.
> >
> > I do not see why we should waste memory - union will work well. This is
> > parser-specific object and the parser should know which fields belong to
> > him. And this object is not shared between parsers so they cannot screw
> > each other. Yes, this is not the most beautiful way to go, but it is
> > simple enough and suits this situation, I think.
> 
> It _is_ shared between parsers. See: driver creates one mtd_part_parser_data
> instance, populates it and passes to parse_mtd_partitions (directly or
> indirectly).
> Then each parser uses the same object to get data. Consider what will happen
> when ixp4xx driver (which currently uses origin for RedBoot) will also gain
> OF support (as it's expected for all ARM-related things). It will set both
> origin (for RedBoot) and of_node (for ofpart).

Agree, please, ignore that part of my feedback.

-- 
Best Regards,
Artem Bityutskiy
