Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UTEgw-0002iK-I5
 for linux-mtd@lists.infradead.org; Fri, 19 Apr 2013 17:01:43 +0000
Message-ID: <5171794F.8000501@am.sony.com>
Date: Fri, 19 Apr 2013 10:05:19 -0700
From: Tim Bird <tim.bird@am.sony.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [RFC/PATCH v2] ubi: Add ubiblock read-write driver
References: <1355314912-9321-1-git-send-email-elezegarcia@gmail.com>
 <201304182128.19518.vapier@gentoo.org>
 <20980858CB6D3A4BAE95CA194937D5E73E9AEC45@DBDE01.ent.ti.com>
 <201304190757.13688.vapier@gentoo.org>
 <1366374673.29520.125.camel@sauron.fi.intel.com>
In-Reply-To: <1366374673.29520.125.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Ezequiel Garcia <elezegarcia@gmail.com>, Mike Frysinger <vapier@gentoo.org>,
 "richard.weinberger@gmail.com" <richard.weinberger@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/19/2013 05:31 AM, Artem Bityutskiy wrote:
> We recently merged fastmap, which is a big chunk of code, and it looks
> like no one really needs it. There was a problem report, and Richard
> promised to look, but did not. I do not blame him, he is a busy guy. But
> this shows that this feature is not really needed, while adds
> maintenance burden.

Whoa there!  Just because it doesn't look like people are using fastmap
right now, don't think it won't get used in the future.   Really,
the people interested in fastmap are AFAIK mostly TV vendors, who are
just now migrating to 3.0 or 3.4 kernels.  I can assure you that fastmap
will get more attention when the major CE companies move to more
recent kernels (probably in about 1 to 2 years).

Likely, anyone who needs fastmap today has backported it, or plans
to backport it to their current product-facing kernel.  Unfortunately,
that means that bug reports and fixes usually don't show up on
public e-mail lists (due to version gap).

Richard (/Linutronix) was hired to do this work by the CE Workgroup.
If money is needed to get fastmap bugfixes and maintenance on his
priority list, please let us know and maybe we can do something.
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Workgroup of the Linux Foundation
Senior Staff Engineer, Sony Network Entertainment
=============================
