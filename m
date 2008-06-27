Message-ID: <4865079A.2020300@freescale.com>
Date: Fri, 27 Jun 2008 10:30:34 -0500
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: avorontsov@ru.mvista.com
Subject: Re: [PATCH] MTD: NAND: fsl_elbc_nand: implement support
	for	flash-based BBT
References: <20080626184156.GA2356@polina.dev.rtsoft.ru>
	<48648662.1050107@call-direct.com.au>
	<20080627145512.GA11372@polina.dev.rtsoft.ru>
In-Reply-To: <20080627145512.GA11372@polina.dev.rtsoft.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Iwo Mergler <iwo@call-direct.com.au>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Anton Vorontsov wrote:
> Just looked into x16 LP NAND spec, and it says that block should be
> considered as bad when the first _Word_ isn't 0xff. So we indeed should
> not ignore the second byte. Ouch.

The FCM doesn't support 16-bit devices.

> How about this patch?

ACK

-Scott
