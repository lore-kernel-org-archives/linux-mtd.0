Received: from mail-bl2ln0192.outbound.protection.outlook.com
 ([2a01:111:f400:7c09::192] helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYhnS-0005dS-Ha
 for linux-mtd@lists.infradead.org; Fri, 11 Apr 2014 20:11:35 +0000
Message-ID: <1397247023.20280.144.camel@snotra.buserror.net>
Subject: Re: [PATCH] mtd: nand: Disable subpage writes for drivers without
 ecc->hwctl
From: Scott Wood <scottwood@freescale.com>
To: "Gupta, Pekon" <pekon@ti.com>
Date: Fri, 11 Apr 2014 15:10:23 -0500
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAC2697@DBDE04.ent.ti.com>
References: <1397034804-27161-1-git-send-email-helmut.schaa@googlemail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAC1D46@DBDE04.ent.ti.com>
 <CAGXE3d8H=y3LeW54kwZg04-Edm-KkNbqXLCduNuPfAOrLymO+A@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAC1D89@DBDE04.ent.ti.com>
 <1397086473.20280.33.camel@snotra.buserror.net>
 <5dc1853e-694c-4add-bd62-e0c2a66f4c95@email.android.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAC2146@DBDE04.ent.ti.com>
 <CAGXE3d8892D5JjFvs0Yxz6bpMciudq_95zeaKogYQqi2yMV7Pg@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAC2697@DBDE04.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <David.Woodhouse@intel.com>, "Huang Shijie
 \(b32955@freescale.com\)" <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Helmut Schaa <helmut.schaa@googlemail.com>, Artem
 Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2014-04-11 at 06:35 +0000, Gupta, Pekon wrote:
> As per [1] and [2], If the subpage is _not_ supported then VID-header offset
> should be aligned to  PAGE_SIZE boundary. And it has implications on LEB size
> calculation too. I don't know how it was working earlier but if the earlier
> UBI images were using 512 as VID Header offset even without subpage
> Support then it's incorrect configuration.

I believe what was happening before was full page writes with only
subpage content (the rest left at 0xff).

> Now whether we still want backward compatibility for something which was
> incorrect, is something I leave it for Maintainers {Artem, Brian} to decide.

Why is it incorrect?  Subpage writes were happening -- if they weren't,
then we wouldn't have seen problems on IFC without that flag.

-Scott
