Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bazw0-0005wO-Tm
	for linux-mtd@lists.infradead.org; Thu, 17 Jun 2004 12:40:19 -0400
Message-ID: <40D1CA4D.1000604@inf.u-szeged.hu>
Date: Thu, 17 Jun 2004 18:43:57 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: andrea.tarani@gilbarco.com,  linux-mtd@lists.infradead.org
References: <OF77935382.F1EA090B-ONC1256EB6.00526020@logitron.it>
In-Reply-To: <OF77935382.F1EA090B-ONC1256EB6.00526020@logitron.it>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: Memory leak in compr.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

andrea.tarani@gilbarco.com wrote:

>If compression are enabled and the current block can't be compressed the
>allocated buffer
>aren't released.
>  
>
You're right, and this leak was present in mtd/util/compr.c, too.
Your patch was not exactly correct, but now it is fixed.

Thank you for your feedback.

Regards,
Ferenc
