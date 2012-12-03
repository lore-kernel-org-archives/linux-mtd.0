Received: from mail-ea0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TfdAa-00052O-CI
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2012 21:03:17 +0000
Received: by mail-ea0-f177.google.com with SMTP id c10so1325261eaa.36
 for <linux-mtd@lists.infradead.org>; Mon, 03 Dec 2012 13:03:14 -0800 (PST)
Date: Mon, 3 Dec 2012 23:03:05 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Ezequiel Garcia <elezegarcia@gmail.com>
Subject: Re: [RFC/PATCH 0/1] ubi: Add ubiblock driver
Message-ID: <20121203230305.7be51ad2.shmulik.ladkani@gmail.com>
In-Reply-To: <CALF0-+Vab6HZX-yRh0N6HxRSu4GavNXTpzrF6Ry7sDFwAXMHeg@mail.gmail.com>
References: <CALF0-+WuaUn5b=2XrzqW7pvM=N1MfQf=sFwLFOrokTkHbOXh3w@mail.gmail.com>
 <alpine.DEB.2.00.1211210626110.357@lnxricardw.se.axis.com>
 <20121121105636.4c8687e0@skate>
 <alpine.DEB.2.00.1211211059540.21683@lnxricardw.se.axis.com>
 <20121121110518.3147bd34@skate>
 <CALF0-+W-Ont1bhn_Go4YRBEpEk46=cXWGJPckAeKPgqwy+QUFw@mail.gmail.com>
 <20121125093621.47f9cb25@pixies.home.jungo.com>
 <1354274647.30168.99.camel@sauron.fi.intel.com>
 <20121202193954.2dd3ea8f@pixies.home.jungo.com>
 <CALF0-+WLGSq6tNBExt9PFJccAeKwj0BpVb7vVwQit39xbFiq4A@mail.gmail.com>
 <CALF0-+Vab6HZX-yRh0N6HxRSu4GavNXTpzrF6Ry7sDFwAXMHeg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>, dedekind1@gmail.com,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Tim Bird <tim.bird@am.sony.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel,

On Mon, 3 Dec 2012 16:33:01 -0300 Ezequiel Garcia <elezegarcia@gmail.com> wrote:
> Hope this helps,

Helps indeed, thanks.

So basically you need ubiblock to state it supports flushing caches, and
properly handle REQ_FLUSH in its request_fn.

Regards,
Shmulik
