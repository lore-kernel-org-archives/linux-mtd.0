Received: from va3ehsobe001.messaging.microsoft.com ([216.32.180.11]
	helo=VA3EHSOBE008.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QeEck-0003xv-0C
	for linux-mtd@lists.infradead.org; Tue, 05 Jul 2011 23:01:46 +0000
Date: Tue, 5 Jul 2011 18:01:38 -0500
From: Scott Wood <scottwood@freescale.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
Subject: Re: [PATCH v2] mtd: eLBC NAND: remove elbc_fcm_ctrl->oob_poi
Message-ID: <20110705180138.469f34d1@schlenkerla.am.freescale.net>
In-Reply-To: <1309905302-1990-1-git-send-email-mlcreech@gmail.com>
References: <20110705151525.438e87dc@schlenkerla.am.freescale.net>
	<1309905302-1990-1-git-send-email-mlcreech@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@lists.ozlabs.org, linux-mtd@lists.infradead.org,
	rick22@wi.rr.com, mhench@elutions.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 5 Jul 2011 18:35:02 -0400
"Matthew L. Creech" <mlcreech@gmail.com> wrote:

> From: Mike Hench <mhench@elutions.com>
> 
> The eLBC NAND driver currently follows up each program/write operation with a
> read-back of the page, in order to [ostensibly] fill in ECC data for the
> caller. However, the page address used for this read is always -1, so the read
> will never work correctly.  Remove this useless (and potentially problematic)
> block of code.
> 
> v2: elbc_fcm_ctrl->oob_poi is removed entirely, since this code block was the
> only place it was actually used.

Just noticed, full_page can come out as well.

Otherwise, ACK

-Scott
