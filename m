Received: from mail-la0-f43.google.com ([209.85.215.43])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUkK3-0000aM-Tz
 for linux-mtd@lists.infradead.org; Mon, 31 Mar 2014 22:04:52 +0000
Received: by mail-la0-f43.google.com with SMTP id e16so6433037lan.30
 for <linux-mtd@lists.infradead.org>; Mon, 31 Mar 2014 15:04:24 -0700 (PDT)
Subject: Re: [PATCH] mtd: cfi_cmdset_0001 - fixup for PC28F512P33TFA
From: Christoph Fritz <chf.fritz@googlemail.com>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
In-Reply-To: <OFA78F5CB9.63C292B4-ONC1257CAC.006FBDC4-C1257CAC.0070B588@transmode.se>
References: <1396287151.4857.50.camel@mars>
 <OFA78F5CB9.63C292B4-ONC1257CAC.006FBDC4-C1257CAC.0070B588@transmode.se>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 01 Apr 2014 00:04:20 +0200
Message-ID: <1396303460.4857.111.camel@mars>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Marius Achilles <M.Achilles@phytec.de>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-03-31 at 22:31 +0200, Joakim Tjernlund wrote:
> No way, disabling erase suspend will cause severe latencies for read/write 
> ops.

Here on a mx35 it's not really severe.

> The document mentions other ways to get around this problem, I suggest you 
> explore
> these first.

Already tried the “0xFF” dummy write cycle suggestion, should have
mentioned that.

> Minus degrees is not a common environment either so perhaps any fix should 
> be selectable?

The NOR is specified for down to -40°C.

 Thanks
  -- Christoph
