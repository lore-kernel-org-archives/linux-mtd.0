Received: from fed1mtao02.cox.net ([68.6.19.243])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178Not-0003oW-00
	for <linux-mtd@lists.infradead.org>; Thu, 16 May 2002 17:09:35 +0100
Subject: Re: can't erase "sharp".
From: Russ Dill <Russ.Dill@asu.edu>
To: Takashi YOSHII <takasi-y@ops.dti.ne.jp>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <20020517.011732.74751668.takasi-y@ops.dti.ne.jp>
References: <20020517.011732.74751668.takasi-y@ops.dti.ne.jp>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 16 May 2002 09:12:43 -0700
Message-Id: <1021565563.13361.6.camel@russ>
Mime-Version: 1.0
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

On Thu, 2002-05-16 at 09:17, Takashi YOSHII wrote:
> I'm using drivers/mtd/chip/sharp.c (I know it's "obsolete", though).
> And, found "eraseall" command doesn't work upon it.
> The operation stops at 0%, and the command never exit.
> 
> I added few lines(see the patch below), and it works, perhaps...
> I'm not sure if it is correct (especially when signals received).
> 
> Could someone tell me the right answer, please?
> Regards,

is the first flash block locked?
