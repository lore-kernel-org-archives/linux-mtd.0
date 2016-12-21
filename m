Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cJpQ0-0006CG-FX
 for linux-mtd@lists.infradead.org; Wed, 21 Dec 2016 22:31:29 +0000
Subject: Re: [PATCH] mtd-utils: Add configure switches to disable jffsX or
 ubifs tools
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
 linux-mtd@lists.infradead.org
References: <20161221155412.29706-1-david.oberhollenzer@sigma-star.at>
From: Richard Weinberger <richard@nod.at>
Message-ID: <5cd37f73-12b5-8e5f-cdaa-29cc6ea1da0c@nod.at>
Date: Wed, 21 Dec 2016 23:30:57 +0100
MIME-Version: 1.0
In-Reply-To: <20161221155412.29706-1-david.oberhollenzer@sigma-star.at>
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

On 21.12.2016 16:54, David Oberhollenzer wrote:
> For some applications, like building a root filesystem for an embedded
> device, it may be desireable to only build and install a subset of the
> mtd-utils. This can be done throught the targets of the generated
> Makefile and hand picking executables, however the jffsX and ubifs
> utilities have external build dependencies that may not be needed.
> 
> This patch adds configure switches to disable building the jffsX and
> ubifs utilities. Their respective build dependencies (zlib, lzo, uuid)
> are only requested if the tools are being built.
> 
> Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>

Reviewed-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
