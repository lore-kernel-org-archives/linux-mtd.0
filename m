Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkHus-0006PF-4H
 for linux-mtd@lists.infradead.org; Wed, 14 Sep 2016 21:40:28 +0000
Subject: Re: UBIFS - strange behaviour after enabling chk_index
To: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <AM4PR0701MB213063EE7BE9DDE08ADAB177FEF10@AM4PR0701MB2130.eurprd07.prod.outlook.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <adef444f-b333-4b2c-49d1-1bc08697a587@nod.at>
Date: Wed, 14 Sep 2016 23:39:21 +0200
MIME-Version: 1.0
In-Reply-To: <AM4PR0701MB213063EE7BE9DDE08ADAB177FEF10@AM4PR0701MB2130.eurprd07.prod.outlook.com>
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

Marcin,

On 14.09.2016 10:28, Krzeminski, Marcin (Nokia - PL/Wroclaw) wrote:
> (Plain text now)
> 
> Hi Richard, list
> 
> During some power-cut tests I accidently came across strange case.
> The test script is here (I could attach it this in thread later).
> 
> http://pastebin.com/daNrf6yG
> 
> Result of running this on HW and Qemu is the same, and it ends like below (logs from Qemu).
> 
> It does not reproduce if I use flash with 256KiB sectors (both Qemu and HW),
> or do not enable index integrity checks.
> Could it be real life case?

Is this the SPI-NOR device you talked about on IRC?
Maybe the check is broken, maybe it uncovers a hard to hit issue
on your flash. Both could be.

Do you emulate exactly the same device in qemu?

Thanks,
//richard
