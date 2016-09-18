Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1blYI5-00047N-IN
 for linux-mtd@lists.infradead.org; Sun, 18 Sep 2016 09:21:39 +0000
Subject: Re: [PATCH 1/2] mtd: nand: mxc: Test CONFIG_OF instead of
 CONFIG_OF_MTD
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
References: <1474135031-29443-1-git-send-email-boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <557344ed-0e70-0be5-641e-9d62d36d0e4d@nod.at>
Date: Sun, 18 Sep 2016 11:20:24 +0200
MIME-Version: 1.0
In-Reply-To: <1474135031-29443-1-git-send-email-boris.brezillon@free-electrons.com>
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

On 17.09.2016 19:57, Boris Brezillon wrote:
> We are about to drop the OF_MTD Kconfig option. Test CONFIG_OF
> activation instead of CONFIG_OF_MTD.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Reviewed-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
