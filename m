Subject: Re: [PATCH] [MTD] [NOR] cfi_cmdset_0002.c: Add Macronix CFI V1.0
	TopBottom detection
From: David Woodhouse <dwmw2@infradead.org>
To: Christopher Moore <moore@free.fr>
In-Reply-To: <1224214342759-git-send-email-moore@free.fr>
References: <48F7FAFF.7040902@free.fr>
	<1224214342759-git-send-email-moore@free.fr>
Content-Type: text/plain
Date: Sat, 18 Oct 2008 12:42:19 +0100
Message-Id: <1224330139.6770.1352.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-10-17 at 05:32 +0200, Christopher Moore wrote:
> It does not detect the following correctly:-
> MX28F640C3B B
> MX29LV002C  T
> MX29LV002NC T
> MX29LV004C  B
> MX29SL400C  T/B
> MX29SL402C  T/B
> 
> If desired I could supply a more complicated patch to handle these as
> well.

If you could, that would be very much appreciated. Thanks.

I've applied the first patch.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
