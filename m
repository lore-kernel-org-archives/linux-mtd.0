Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bGC0t-0008Ar-F3
 for linux-mtd@lists.infradead.org; Thu, 23 Jun 2016 21:18:16 +0000
Subject: Re: [PATCH] ubi: Make volume resize power cut aware
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1466703038-13044-1-git-send-email-richard@nod.at>
 <20160623224628.0495c565@bbrezillon>
Cc: linux-mtd@lists.infradead.org, stable@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <576C51FF.1070005@nod.at>
Date: Thu, 23 Jun 2016 23:17:51 +0200
MIME-Version: 1.0
In-Reply-To: <20160623224628.0495c565@bbrezillon>
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

Am 23.06.2016 um 22:46 schrieb Boris Brezillon:
>> Cc: <stable@vger.kernel.org>
>> Reported-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>> Signed-off-by: Richard Weinberger <richard@nod.at>
> 
> I hope this change won't uncover another bug in case some of the
> UBI logic rely on the 'write vtbl record, then unmap unused LEBs'
> sequence. But AFAICT it seems safe.

To test this patch I've instrumented the resize function and emulated
power cuts at various critical points.
No regressions happened.
Using the same technique I've also verified that the issue this patch
is resolving is real.

Thanks,
//richard
