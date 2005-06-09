Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DgP7g-0002re-OF
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2005 11:39:13 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Domenico DI TULLIO <domenico.di-tullio@st.com>
In-Reply-To: <002d01c56cff$b4d056a0$443682a4@nap.st.com>
References: <002d01c56cff$b4d056a0$443682a4@nap.st.com>
Content-Type: text/plain
Date: Thu, 09 Jun 2005 17:39:49 +0200
Message-Id: <1118331589.13312.32.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Request by STMicroelectronics to add NAND chip
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Domenico,

On Thu, 2005-06-09 at 16:29 +0200, Domenico DI TULLIO wrote:

> Dear Thomas Gleixner,
> 
> I am an application engineer of the STMicroelectronics,
> and I work in NAND Flash & Storage Media Division.
> 
> Now, I am working under Linux, in particular I am testing
> ours NAND device with JFFS2 and YAFFS file system.
> I have noted that, in the chiplist present in the file "nand_ids.h",
> miss some STMicro NAND chip supported from your code, and I would add it.

Can you please add the entries, test if the chips are correctly detected
and then send me a patch against the current MTD CVS code ?


Thanks

tglx
