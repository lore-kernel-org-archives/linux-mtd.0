Received: from fish.redhat.com ([213.86.99.237]
	helo=executor.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A6Wdc-0006sA-ES
	for <linux-mtd@lists.infradead.org>; Mon, 06 Oct 2003 15:47:04 +0100
From: David Woodhouse <dwmw2@redhat.com>
To: Felipe W Damasio <felipewd@terra.com.br>
In-Reply-To: <3F81800A.5000500@terra.com.br>
References: <3F81800A.5000500@terra.com.br>
Message-Id: <1065451568.22491.215.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 06 Oct 2003 15:46:09 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Memory leak in mtd/chips/cfi_cmdset_0020
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-10-06 at 11:45 -0300, Felipe W Damasio wrote:
> 	Hi David,
> 
> 	Patch against 2.6.0-test6.
> 
> 	- Frees a previous allocated kmalloced variable before returning NULL;
> 
> 	Found by smatch.

Applied; thanks. It'll be in the next update sent to Linus, when I get a
few spare moments for merging and testing.

Out of interest, why didn't smatch also find the same error 25 lines
further down?

-- 
dwmw2
