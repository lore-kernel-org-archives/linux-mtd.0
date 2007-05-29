Received: from 3a.49.1343.static.theplanet.com ([67.19.73.58]
	helo=pug.o-hand.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Ht0vv-0008MK-GP
	for linux-mtd@lists.infradead.org; Tue, 29 May 2007 08:36:32 -0400
Received: from max.rpnet.com (tim.rpsys.net [194.106.48.114])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by pug.o-hand.com (Postfix) with ESMTP id D471410CDE0A
	for <linux-mtd@lists.infradead.org>;
	Tue, 29 May 2007 08:41:57 -0400 (EDT)
Subject: Re: [PATCH/RFC] oops and panic message logging to MTD
From: Richard Purdie <richard@openedhand.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
In-Reply-To: <1180441903.5822.53.camel@localhost.localdomain>
References: <1180441903.5822.53.camel@localhost.localdomain>
Content-Type: text/plain
Date: Tue, 29 May 2007 13:35:06 +0100
Message-Id: <1180442106.5822.58.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-05-29 at 13:32 +0100, Richard Purdie wrote:
> Kernel oops and panic messages are invaluable when debugging crashes.
> These messages often don't make it to flash based logging methods (say a
> syslog on jffs2) due to the overheads involved in writing to flash.
> 
> This patch allows you to turn an MTD partition into a circular log
> buffer where kernel oops and panic messages are written to. The messages
> are obtained by registering a console driver and checking
> oops_in_progress. Erases are performed in advance to maximise the
> chances of a saving messages.
> 
> To activate it, add console=ttyMTDx to the kernel commandline (where x
> is the mtd device number to use).
> 
> Signed-off-by: Richard Purdie <rpurdie@openedhand.com>

I meant to add, http://folks.o-hand.com/richard/oopslog.c is an example
of extracting this information in userspace. It will work with an
mtdblock device or a dump of the mtd partition.

Cheers,

Richard
