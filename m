Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cQhmU-0001oK-TR
 for linux-mtd@lists.infradead.org; Mon, 09 Jan 2017 21:47:09 +0000
Subject: Re: On-die ECC support
To: Peter Rosin <peda@axentia.se>, linux-mtd@lists.infradead.org
References: <45d6eb07-d6f0-1ac1-bd50-ef913a2826d8@axentia.se>
From: Richard Weinberger <richard@nod.at>
Message-ID: <a00bb5bf-abdb-ce5f-e644-492b54d348c5@nod.at>
Date: Mon, 9 Jan 2017 22:46:38 +0100
MIME-Version: 1.0
In-Reply-To: <45d6eb07-d6f0-1ac1-bd50-ef913a2826d8@axentia.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Peter,

Am 09.01.2017 um 22:37 schrieb Peter Rosin:
> Hi!
> 
> AFAICT, on-die ECC support [1] (continues in [2]) was never upstreamed
> and the patches no longer applies. I wonder if someone has done the
> work to forward port them to recent kernels?

Nope.

Supporting On-die ECC in a proper way is with the current MTD NAND code
not possible.
I stopped working on it since I have no longer access to working
On-die ECC hardware and On-die ECC is a dead horse.
It is slow and no longer available for recent NANDs.

Thanks,
//richard
