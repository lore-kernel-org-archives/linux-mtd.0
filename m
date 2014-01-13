Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W2h6E-0006Gw-Ln
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2014 12:58:39 +0000
Message-ID: <1389617894.2259.270.camel@sauron.fi.intel.com>
Subject: Re: UBIFS seeing corrupt blank pages when image flashed via u-boot
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Calvin Johnson <linux.cj@gmail.com>
Date: Mon, 13 Jan 2014 14:58:14 +0200
In-Reply-To: <CAEhpT-W-aBkackmUb860vex2LxGzkBQ6hu1KGvUzjmTWTeQgxg@mail.gmail.com>
References: <20980858CB6D3A4BAE95CA194937D5E73EA5DBFA@DBDE04.ent.ti.com>
 <1388753970.25123.124.camel@sauron.fi.intel.com>
 <CAEhpT-W-aBkackmUb860vex2LxGzkBQ6hu1KGvUzjmTWTeQgxg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-01-13 at 17:49 +0530, Calvin Johnson wrote:
> If the 4th to last-page are left blank and not covered with ECC, what
> will happen in case of bit flips on the blank pages? There was an
> issue reported some time back.
> http://lists.infradead.org/pipermail/linux-mtd/2012-January/039256.html
> 
> Does UBI/UBIFS take care of this now?

No. UBIFS still assumes that blank pages are ECC-protected by the
driver. No one stepped in and took care of changing this yet.

-- 
Best Regards,
Artem Bityutskiy
