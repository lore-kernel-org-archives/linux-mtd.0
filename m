Received: from fw.wantstofly.org ([80.101.37.227] helo=mail.wantstofly.org)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RFZkn-0000I9-Iz
	for linux-mtd@lists.infradead.org; Sun, 16 Oct 2011 23:04:26 +0000
Date: Mon, 17 Oct 2011 01:04:18 +0200
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: Kevin Paul Herbert <kevin.herbert@meraki.net>
Subject: Re: Re: [PATCH] mtd m25p80: add support for Macronix MX25L12805D
Message-ID: <20111016230418.GF18227@wantstofly.org>
References: <63A7EBF6-2A5D-4607-AA5C-CC8F3ED0C29B@meraki.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63A7EBF6-2A5D-4607-AA5C-CC8F3ED0C29B@meraki.net>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Oct 15, 2011 at 05:32:42PM -0700, Kevin Paul Herbert wrote:

> Is there a reason that you did not include SECT_4K for the MX25L12805D?
> The chips that I have support it, and its in the data sheet. Was this
> an oversight or is there a problem with some chips?

An oversight.  If SECT_4K works for you (I don't have hardware to test
with anymore), go ahead and submit a patch.
