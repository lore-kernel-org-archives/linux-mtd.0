Received: from aa001msb.fastweb.it ([85.18.95.80])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N3UWa-0004qa-KP
	for linux-mtd@lists.infradead.org; Thu, 29 Oct 2009 12:54:49 +0000
Message-ID: <4AE9908D.5090307@evidence.eu.com>
Date: Thu, 29 Oct 2009 13:54:37 +0100
From: Claudio Scordino <claudio@evidence.eu.com>
MIME-Version: 1.0
To: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Subject: Re: [PATCH] atmel_nand: silence compiler warning by removing unused
	variable
References: <1256817893-16413-1-git-send-email-hans-christian.egtvedt@atmel.com>
In-Reply-To: <1256817893-16413-1-git-send-email-hans-christian.egtvedt@atmel.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hans-Christian Egtvedt ha scritto:
> This patch removes the eccpos variable from the atmel_nand_calculate function,
> thus silencing a compiler warning about unused variable.
>   
Hi,

   I already sent this patch to this list on October 7th.

See:

http://lists.infradead.org/pipermail/linux-mtd/2009-October/027498.html

Best regards,

            Claudio
