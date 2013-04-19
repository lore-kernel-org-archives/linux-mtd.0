Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UTARN-0004sr-Ig
 for linux-mtd@lists.infradead.org; Fri, 19 Apr 2013 12:29:23 +0000
Message-ID: <1366374673.29520.125.camel@sauron.fi.intel.com>
Subject: Re: [RFC/PATCH v2] ubi: Add ubiblock read-write driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
Date: Fri, 19 Apr 2013 15:31:13 +0300
In-Reply-To: <201304190757.13688.vapier@gentoo.org>
References: <1355314912-9321-1-git-send-email-elezegarcia@gmail.com>
 <201304182128.19518.vapier@gentoo.org>
 <20980858CB6D3A4BAE95CA194937D5E73E9AEC45@DBDE01.ent.ti.com>
 <201304190757.13688.vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Ezequiel Garcia <elezegarcia@gmail.com>,
 "richard.weinberger@gmail.com" <richard.weinberger@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Tim Bird <tim.bird@am.sony.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2013-04-19 at 07:57 -0400, Mike Frysinger wrote:
> the reason we're talking about not allowing write support at the
> *block* layer 
> is because it's questionable how many people actually want this, the 
> performance isn't good (compared to native flash filesystems), and
> because the 
> write/wear characteristics are unknown.

My opinion that unless people demonstrate that they need this, e.g. in a
product, etc, we should not merge this stuff.

We recently merged fastmap, which is a big chunk of code, and it looks
like no one really needs it. There was a problem report, and Richard
promised to look, but did not. I do not blame him, he is a busy guy. But
this shoes that this feature is not really needed, while adds
maintenance burden.

To put it differently, I do recommend to merge more UBI-related code
without a solid user-base.

-- 
Best Regards,
Artem Bityutskiy
