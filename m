Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZIh6-0002K1-8s
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 08:21:52 +0000
Received: by vws8 with SMTP id 8so514562vws.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Jun 2011 01:21:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1308716496.18119.8.camel@sauron>
References: <1307833922-21602-1-git-send-email-dbaryshkov@gmail.com>
	<1307833922-21602-2-git-send-email-dbaryshkov@gmail.com>
	<1308716496.18119.8.camel@sauron>
Date: Wed, 22 Jun 2011 12:21:48 +0400
Message-ID: <BANLkTimc-syC35X8Tej2w3owyXZttU0wKw@mail.gmail.com>
Subject: Re: [PATCH 01/18] mtd: abstract last MTD partition parser argument
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/22/11, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> I see a lot of checkpatch.pl warnings, could you please take a look?
>
> Also, my gcc produces warnings with this patch because you have not
> fixed up MPT parsers, e.g., like this:

Sorry, I was also busy that time and forgot about this :)

BTW: the patches should be applicable clearly to the l2-mtd at the time
I've sent them.

I'll fix all of your comments except this one:

> Could you please embrace the origin field into an anonymous union - once
> we add the of_node field they do not have to be at separate addresses. I
> mean:
>
> struct mtd_part_parser_data {
> 	union {
> 		unsigned long origin;
> 		struct device_node *of_node;
> 	};
> };

No, no and no. This data is passed to all parsers, so it should be valid for all
of them. Either we have to add a way to specify, what exactly we have provided,
or we have to leave data as separate struct fields.

-- 
With best wishes
Dmitry
