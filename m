Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cjnvv-0002k2-K6
 for linux-mtd@lists.infradead.org; Fri, 03 Mar 2017 14:11:50 +0000
Subject: Re: ubifs change to read-only
To: YUAN Linyu <Linyu.Yuan@alcatel-sbell.com.cn>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
References: <8729016553E3654398EA69218DA29EEF15A8569B@cnshjmbx02>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <3319dcfc-55fb-1e93-43e3-0a976d5c1924@nod.at>
Date: Fri, 3 Mar 2017 15:11:21 +0100
MIME-Version: 1.0
In-Reply-To: <8729016553E3654398EA69218DA29EEF15A8569B@cnshjmbx02>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

YUAN Linyu,

Am 03.03.2017 um 09:46 schrieb YUAN Linyu:
> Hi,
> 
> I got following two error report and ubifs on NAND flash become RO, but I can't reproduce it.
> 
> Linux version is 3.12.37.
> 
> could you have a look ? 
> 
> how it happen or if any patch can fix it ?

I'm afraid without more details we cannot help much without further detail.
Your kernel is also rather old, maybe you miss some fixes in the MTD stack.
Some area turned in 0xff bytes and UBIFS got confused.

Thanks,
//richard
