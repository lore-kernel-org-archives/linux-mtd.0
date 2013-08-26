Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VDw7m-00068c-Aq
 for linux-mtd@lists.infradead.org; Mon, 26 Aug 2013 12:42:26 +0000
Date: Mon, 26 Aug 2013 14:41:53 +0200
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v3 00/10] About the SLC/MLC
Message-ID: <20130826144153.568f2b1c@skate>
In-Reply-To: <1377509808-29363-1-git-send-email-b32955@freescale.com>
References: <1377509808-29363-1-git-send-email-b32955@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Huang Shijie,

On Mon, 26 Aug 2013 17:36:38 +0800, Huang Shijie wrote:
> In current mtd code, the MTD_NANDFLASH is used to represent both the
> SLC nand MLC(including the TLC). But we already have the MTD_MLCNANDFLASH
> to stand for the MLC. What is worse is that the JFFS2 may run on the MLC
> nand with current code. For the reason of READ/WRITE disturbance, the JFFS2
> should runs on the SLC only,

Pardon the probably very silly question, but would you mind giving more
details about why JFFS2 is not appropriate on MLC flashes? Is there
anything that UBI/UBIFS does that JFFS2 isn't doing to take into
account read/write disturbance?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
