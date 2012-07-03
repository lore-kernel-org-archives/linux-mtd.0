Received: from mail-wi0-f171.google.com ([209.85.212.171])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sm2fX-0001Zw-Ar
 for linux-mtd@lists.infradead.org; Tue, 03 Jul 2012 12:57:38 +0000
Received: by wibhq4 with SMTP id hq4so3258809wib.0
 for <linux-mtd@lists.infradead.org>; Tue, 03 Jul 2012 05:57:19 -0700 (PDT)
Date: Tue, 3 Jul 2012 15:57:15 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: dedekind1@gmail.com
Subject: Re: [Q] ubi->beb_rsvd_pebs calculations
Message-ID: <20120703155715.595697e7@pixies.home.jungo.com>
In-Reply-To: <1341319344.2979.62.camel@sauron.fi.intel.com>
References: <20120701195230.0f141288@pixies.home.jungo.com>
 <1341312827.2979.53.camel@sauron.fi.intel.com>
 <20120703153314.15948c90@pixies.home.jungo.com>
 <1341319344.2979.62.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 03 Jul 2012 15:42:24 +0300 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Tue, 2012-07-03 at 15:33 +0300, Shmulik Ladkani wrote:
> > However, the attempt refilling the 'beb_rsvd_pebs' after volume
> > remove/shrink will still exist.
> 
> Ah, right, it is needed in case you had smaller %, but then changed the
> config/attch option and increased it.

Yep.
All being taken care of, hopefully :)
