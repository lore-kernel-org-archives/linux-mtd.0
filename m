Received: from [64.170.22.142] (helo=mail.spewey.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Rtxa-0006UC-00
	for <linux-mtd@lists.infradead.org>; Wed, 01 Aug 2001 12:14:42 +0100
Message-Id: <5.1.0.14.0.20010801063242.00a67f20@mail.spewey.com>
Date: Wed, 01 Aug 2001 06:33:33 -0500
To: Juan Ramon Jimenez Garcia <juan@hispafuentes.com>,
 linux-mtd@lists.infradead.org,olea@hispafuentes.com
From: Vipin Malik <vipin@embeddedlinuxworks.com>
Subject: Re: Problems compiling kernel 2.2.17
In-Reply-To: <3B67E336.B7925626@hispafuentes.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

At 01:08 PM 8/1/2001 +0200, Juan Ramon Jimenez Garcia wrote:

>
>but now we got another link error with an undefined reference to
>'init_nftl'

Don't link in nftl. What do you need this for? You don't need this for 
either DOC OR NOR flash.

Vipin
