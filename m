Message-ID: <48A91AEB.2060503@nokia.com>
Date: Mon, 18 Aug 2008 09:47:07 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [RFC] [PATCH] [MTD] [OneNAND] Add write-while-program operation
References: <48A43E19.7090706@nokia.com>
	<9c9fda240808151825u2693ab3h3d7524e90a6d24af@mail.gmail.com>
In-Reply-To: <9c9fda240808151825u2693ab3h3d7524e90a6d24af@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Kyungmin Park wrote:
> Before comment the patch, I first wonder which mtd user can use this feature?

Well, UBI does large writes when it moves PEBs (for wear leveling or in response
to bit-flips), or for atomic LEB change, or when it updates volumes.

> To work correctly, the upper layer sends more than 2 pages write size.
> umm just override the write buffer in omap2. maybe assume mtdblock?

I am not sure what you mean here.
