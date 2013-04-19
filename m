Received: from mail.free-electrons.com ([94.23.35.102])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UTCpL-0008Ha-1V
 for linux-mtd@lists.infradead.org; Fri, 19 Apr 2013 15:02:16 +0000
Date: Fri, 19 Apr 2013 12:02:10 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [RFC/PATCH v2] ubi: Add ubiblock read-write driver
Message-ID: <20130419150209.GA2555@localhost>
References: <1355314912-9321-1-git-send-email-elezegarcia@gmail.com>
 <201304182128.19518.vapier@gentoo.org>
 <20980858CB6D3A4BAE95CA194937D5E73E9AEC45@DBDE01.ent.ti.com>
 <201304190757.13688.vapier@gentoo.org>
 <1366374673.29520.125.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1366374673.29520.125.camel@sauron.fi.intel.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Ezequiel Garcia <elezegarcia@gmail.com>, Mike Frysinger <vapier@gentoo.org>,
 "richard.weinberger@gmail.com" <richard.weinberger@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, Tim Bird <tim.bird@am.sony.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Fri, Apr 19, 2013 at 03:31:13PM +0300, Artem Bityutskiy wrote:
> On Fri, 2013-04-19 at 07:57 -0400, Mike Frysinger wrote:
> > the reason we're talking about not allowing write support at the
> > *block* layer 
> > is because it's questionable how many people actually want this, the 
> > performance isn't good (compared to native flash filesystems), and
> > because the 
> > write/wear characteristics are unknown.
> 
> My opinion that unless people demonstrate that they need this, e.g. in a
> product, etc, we should not merge this stuff.
> 
> We recently merged fastmap, which is a big chunk of code, and it looks
> like no one really needs it. There was a problem report, and Richard
> promised to look, but did not. I do not blame him, he is a busy guy. But
> this shoes that this feature is not really needed, while adds
> maintenance burden.
> 
> To put it differently, I do recommend to merge more UBI-related code
> without a solid user-base.
>

(I know you meant don't)

Of course, I agree that we shouldn't merge stuff just for the sake of it.
I'm always against adding churn.

However, IMHO, fastmap and ubiblock are not comparable **at all**:

  1. Ubiblock is *extremely* simple and *completely* independent from mtd/ubi
     stack.

  2. Fastmap is a cool UBI feature, that's pretty tightly integrated
     with the UBI core and -at least to me- not very easy to understand
     and follow.

-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
