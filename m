Received: from smtp.newsguy.com ([74.209.136.69])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1REAUV-0000KL-MN
	for linux-mtd@lists.infradead.org; Thu, 13 Oct 2011 01:53:48 +0000
Received: from [192.168.10.105] (139.sub-166-250-7.myvzw.com [166.250.7.139])
	by smtp.newsguy.com (8.14.3/8.14.3) with ESMTP id p9D1riRM098297
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 Oct 2011 18:53:46 -0700 (PDT)
	(envelope-from mikedunn@newsguy.com)
Message-ID: <4E964481.6000008@newsguy.com>
Date: Wed, 12 Oct 2011 18:53:05 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Add driver for M-sys / Sandisk diskonchip G4 nand flash
References: <1318258091-12670-1-git-send-email-mikedunn@newsguy.com>
	<8762jtlx19.fsf@free.fr>
In-Reply-To: <8762jtlx19.fsf@free.fr>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/12/2011 02:28 PM, Robert Jarzmik wrote:
>
> Hi Mike,
>
> I had a look at your driver, to see how close it was to the docg3 I submitted
> before and if we could share some code.

Sent you an email earlier off the ML  I made many of the sme poiints.  We're in
agreement.  The devices are too dissimilar in operation.  Just some shared
registers.


> And I think the BCH algorithm is the same

Of this I'm sure.

> and I'm really
> interested in the outcome of your work with Ivan.

He just showed me how to avoid the need for any bch calculations altogether,
relying entirely on his in-kernel algorithm.  It's been tested.

> Therefore, I'll help review your driver as much as I can, so that you can merge
> it in mainline.

I appreciate that!

I'll parse your review in its entirety once I'm done with the cleanup of the ecc
handling.  Thanks for taking the time to go through the code.  I also want to go
through your G3 driver code in more detal.  I think we may have a lot of notes
to compare.  And I'm anxious to resume looking through my P3 test code and notes
from 18 months ago.  I should have some good info for you.  The G3 might just be
a P3 with double the capacity.  I already see that the addressing is the same.

Thanks,
Mike
