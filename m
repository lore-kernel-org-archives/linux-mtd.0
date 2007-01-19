Received: from mo-p07-ob.rzone.de ([81.169.146.188])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H7oHl-0004OR-BE
	for linux-mtd@lists.infradead.org; Fri, 19 Jan 2007 02:35:45 -0500
Date: Fri, 19 Jan 2007 08:35:18 +0100 (MET)
From: Stefan Roese <ml@stefan-roese.de>
To: "Josh Boyer" <jwboyer@gmail.com>
Subject: Re: [PATCH] [MTD] physmap: Add support for 64 bit resources on PPC44x
References: <200701181808.11143.ml@stefan-roese.de>
	<20070118235900.GA23974@xi.wantstofly.org>
	<625fc13d0701181729u1a2b25cbwe3310a965ce4c297@mail.gmail.com>
In-Reply-To: <625fc13d0701181729u1a2b25cbwe3310a965ce4c297@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200701190835.40327.ml@stefan-roese.de>
Cc: linux-mtd@lists.infradead.org, Lennert Buytenhek <buytenh@wantstofly.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Josh,

On Friday 19 January 2007 02:29, Josh Boyer wrote:
> On 1/18/07, Lennert Buytenhek <buytenh@wantstofly.org> wrote:
> > Why can't you fix ioremap() to take >= 4G addresses instead?
>
> That might be something worth looking at.  We could fix it to not do
> the big address fixup if CONFIG_RESOURCES_64BIT is enabled.

Yes, good idea. I'll send a patch to the ppc list.

The only change needed now is 64bit support in the 'phys' field's. I'll send 
another path for this.

So please drop this patch completely.

Best regards,
Stefan
