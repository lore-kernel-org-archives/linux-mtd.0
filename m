Received: from smtp.fh-landshut.de ([193.175.141.50])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BGgnl-0004E8-3f
	for linux-mtd@lists.infradead.org; Thu, 22 Apr 2004 17:11:49 +0100
Message-ID: <4087EE53.2000608@fh-landshut.de>
Date: Thu, 22 Apr 2004 18:09:55 +0200
From: Oliver Korpilla <okorpil@fh-landshut.de>
MIME-Version: 1.0
To: Oliver Korpilla <okorpil@fh-landshut.de>
References: <4087DC65.7010703@fh-landshut.de>
In-Reply-To: <4087DC65.7010703@fh-landshut.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: (interleaved chips) cfi_cmdset_0002 -> Kernel Panic
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello

I patched a revision of MTD with version 1.93 (as suggested elsewhere) 
of this file (cfi_cmdset_0002.c) against the kernel. Configured fine, 
built fine (kernel.org 2.4.25), but did not autodetect the interleaved 
chip (as the newest snapshot fails to do as well).

So I guess if reverting would be an option, I still do not know where to 
revert to.

Any ideas?

Thanks in advance,
Oliver Korpilla
