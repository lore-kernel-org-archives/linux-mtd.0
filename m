Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17h3cy-0005Z0-00
	for <linux-mtd@lists.infradead.org>; Tue, 20 Aug 2002 08:40:36 +0100
Date: Tue, 20 Aug 2002 09:40:27 +0200 (CEST)
From: Marius Groeger <mag@sysgo.de>
To: Michael Palme <m.palme@goepel.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: newbie: dynamic partition creation possible
In-Reply-To: <3D61C1DE.7010202@goepel.com>
Message-ID: <Pine.LNX.4.40.0208200931340.17964-100000@mag.devdep.sysgo.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Tue, 20 Aug 2002, Michael Palme wrote:

> the flash devices (no filesystem etc.). i need different "partitions" on
> the flash and i dont want to hardcode that --
> i have seen in cmdline.c that this is possible via kernel parameters.
> i'm not absolutely sure what kernel options are needed and what are
> unnecessary.

What is unclear with it? cmdline.c contains examples how to use it. Actually
it can be very simple. For instance, the following term will give you two
partitions, one with 1 MiB and another with all the rest. Both will be
read-write and will receive standard labels:

   mtdparts=my-mtd-id:1m,-

However, you may have to adapt the mapping driver to use the cmdline
partitioning. Here's how:

   int num_mtd_parts, result;
   struct mtd_partition *mtd_parts;
   struct mtd_info mtd;

   num_mtd_parts = parse_cmdline_partitions(&mtd, &mtd_parts, "my-mtd-id");
   result = add_mtd_partitions (&mtd, mtd_parts, num_mtd_parts);

As an aside: it is good (but rare) practice to use the various CONFIG_
options for partitioning features.

Regards,
Marius

-----------------------------------------------------------------------------
Marius Groeger           SYSGO Real-Time Solutions GmbH     mgroeger@sysgo.de
Software Engineering     Embedded and Real-Time Software    www.sysgo.de
Voice: +49-6136-9948-0   Am Pfaffenstein 14                 www.osek.de
FAX:   +49-6136-9948-10  55270 Klein-Winternheim, Germany   www.elinos.com
