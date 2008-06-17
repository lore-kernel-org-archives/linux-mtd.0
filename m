Received: from co203.xi-lite.net ([149.6.83.203] helo=toronto.xi-lite.net)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K8WJW-0005BY-Cw
	for linux-mtd@lists.infradead.org; Tue, 17 Jun 2008 08:13:15 +0000
Message-ID: <48577212.9070004@parrot.com>
Date: Tue, 17 Jun 2008 10:13:06 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Iwo Mergler <iwo@call-direct.com.au>
Subject: Re: [BUG] JFFS2 power loss recovery issues on NAND
References: <alpine.LFD.1.10.0806101438520.27550@casper.infradead.org>
	<48570D5A.1050906@call-direct.com.au>
In-Reply-To: <48570D5A.1050906@call-direct.com.au>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, joern@logfs.org, linux-mtd@lists.infradead.org,
	Alexey Korolev <akorolev@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Iwo Mergler wrote:
> Alexey Korolev wrote:
>>   
> Alexey,
> 
> I know of at least one hardware ECC implementation which can flag
> errors within the ECC bytes separately. In other words, not all 
> implementations
> will detect/correct bit errors in the case of a ECC write error.
> 
> About how to fix it - what about making the reading without ECC the default
> and only re-reading with ECC if JFFS2 finds an invalid checksum?
> 
But what happen if a but flip happen ?
If we do this, ecc won't correct it, the error can happen everywhere not 
only in checksum, for example wrong nodetype.

If only we could put a marker after the ecc data, we could detect such 
case. But linux put ecc at the end of oob.

Matthieu
