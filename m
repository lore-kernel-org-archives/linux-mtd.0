Received: from mail-yw0-f49.google.com ([209.85.213.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T1j3d-0006MZ-G7
 for linux-mtd@lists.infradead.org; Wed, 15 Aug 2012 19:15:10 +0000
Received: by yhjj52 with SMTP id j52so2294555yhj.36
 for <linux-mtd@lists.infradead.org>; Wed, 15 Aug 2012 12:15:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1345029870.3393.128.camel@sauron.fi.intel.com>
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
 <1340408145-24531-3-git-send-email-computersforpeace@gmail.com>
 <1345029870.3393.128.camel@sauron.fi.intel.com>
Date: Wed, 15 Aug 2012 12:15:07 -0700
Message-ID: <CAN8TOE9wC6_NQ=DMX70ovWzP4JuFZKsORgn53Jq9ZNSGcFiCig@mail.gmail.com>
Subject: Re: [PATCH 2/8] mtd: check for max_bitflips in mtd_read_oob()
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, Mike Dunn <mikedunn@newsguy.com>,
 linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 15, 2012 at 4:24 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> Pushed this patch to l2-mtd.git, thanks. I've amended the commentary as
> Smulik requested, and also removed "(see above)", because "above" is (a)
> unclear, and (b) if it means 'mtd_read()', we'd need to make sure
> 'mtd_read()' is always above 'mtd_read_oob()'.

Good idea, removing "(see above)". Readers should be smart enough to
locate mtd_read() and its accompanying comments themselves anyway.

Note that there was a v2 of this patch, although the difference was
very minor (the comments and the Reviewed-by's). The end result is
almost the same as your amendments.

Thanks,
Brian
