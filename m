Received: from [217.111.56.18] (helo=spring.sncag.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BiOe5-00057X-6a
	for linux-mtd@lists.infradead.org; Wed, 07 Jul 2004 22:28:22 -0400
To: Marius Groeger <mgroeger@sysgo.com>
In-Reply-To: <Pine.LNX.4.56.0407071646170.19011@mag.sysgo.com> (Marius
	Groeger's message of "Wed, 7 Jul 2004 16:51:54 +0200 (CEST)")
References: <87fz85eidc.fsf@farside.sncag.com>
	<8765909olf.fsf@farside.sncag.com>
	<Pine.LNX.4.56.0407071646170.19011@mag.sysgo.com>
From: Rainer Weikusat <rainer.weikusat@sncag.com>
Date: Thu, 08 Jul 2004 10:28:12 +0800
Message-ID: <87isczcjwj.fsf@farside.sncag.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org
Subject: Re: cmdlineparts.c [PATCH]
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Marius Groeger <mgroeger@sysgo.com> writes:
> On Wed, 7 Jul 2004, Rainer Weikusat wrote:
>> And I don't really have an idea about what to do with the 'author'
>> and 'copyright' parts, either,
>
> You should claim the MODULE_AUTHOR() tag for yourself. OTOH, it is
> good practice to just leave the existing copyright notices in the head
> and add yours to the list. Is it OK for you to use this hunk?
>
> --- cmdlinepart.c.org   2004-07-07 16:48:53.000000000 +0200
> +++ cmdlinepart.c       2004-07-07 16:49:50.000000000 +0200
> @@ -3,7 +3,8 @@
>   *
>   * Read flash partition table from command line
>   *
> - * Copyright 2002 SYSGO Real-Time Solutions GmbH
> + * Copyright 2002 SYSGO AG
> + * Copyright 2004 SNC AG
>   *
>   * The format for the command line is as follows:
>   *
>

Certainly.
