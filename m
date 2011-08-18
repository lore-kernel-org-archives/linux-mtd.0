Received: from va3ehsobe002.messaging.microsoft.com ([216.32.180.12]
	helo=VA3EHSOBE002.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qu7JU-0000ob-6R
	for linux-mtd@lists.infradead.org; Thu, 18 Aug 2011 18:27:32 +0000
Message-ID: <4E4D5985.3080300@freescale.com>
Date: Thu, 18 Aug 2011 13:27:17 -0500
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: <b35362@freescale.com>
Subject: Re: [PATCH v3] mtd/nand : workaround for Freescale FCM to support
	large-page Nand chip
References: <1313634783-8855-1-git-send-email-b35362@freescale.com>
	<4E4D3CE0.7020602@freescale.com>
In-Reply-To: <4E4D3CE0.7020602@freescale.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/18/2011 11:25 AM, Scott Wood wrote:
> The NOP restrictions should be documented in the code itself, not just
> in the git changelog.  Maybe print it to the console when this hack is
> used, along with the NOP value read from the ID.  If it's less than 4
> for 4K or 8 for 8K, also print a message saying not to use jffs2 (does
> yaffs2 do similar things?).  If it's less than 2 for 4K or 4 for 8K, the
> probe should fail.

We should also warn the user about the need to prepare the NAND chip by
copying the bad block markers to the OOB of the new layout.

-Scott
