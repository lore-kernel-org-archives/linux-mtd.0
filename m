Received: from nf-out-0910.google.com ([64.233.182.189])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H7iZp-0003Sx-Bx
	for linux-mtd@lists.infradead.org; Thu, 18 Jan 2007 20:29:59 -0500
Received: by nf-out-0910.google.com with SMTP id i2so341080nfe
	for <linux-mtd@lists.infradead.org>;
	Thu, 18 Jan 2007 17:29:35 -0800 (PST)
Message-ID: <625fc13d0701181729u1a2b25cbwe3310a965ce4c297@mail.gmail.com>
Date: Thu, 18 Jan 2007 19:29:34 -0600
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Lennert Buytenhek" <buytenh@wantstofly.org>
Subject: Re: [PATCH] [MTD] physmap: Add support for 64 bit resources on PPC44x
In-Reply-To: <20070118235900.GA23974@xi.wantstofly.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <200701181808.11143.ml@stefan-roese.de>
	<20070118235900.GA23974@xi.wantstofly.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 1/18/07, Lennert Buytenhek <buytenh@wantstofly.org> wrote:
> Why can't you fix ioremap() to take >= 4G addresses instead?

That might be something worth looking at.  We could fix it to not do
the big address fixup if CONFIG_RESOURCES_64BIT is enabled.

4xx is in a bit of disrepair and needs some attention.  It also needs
to get merged to arch/powerpc, which is a bit larger change.  I'm
hoping to have some time soon to focus on things like this.

josh
