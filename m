Received: from tac.ki.iif.hu ([2001:738:0:401:20c:6eff:fe71:b2db])
	by casper.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NuOld-00070D-NV
	for linux-mtd@lists.infradead.org; Wed, 24 Mar 2010 11:28:58 +0000
From: Ferenc Wagner <wferi@niif.hu>
To: Peter Korsgaard <jacmet@sunsite.dk>
Subject: Re: RFC: direct MTD support for SquashFS
References: <87vdcwv139.fsf@tac.ki.iif.hu>
	<87ljdsibqe.fsf@macbook.be.48ers.dk> <87r5nhziss.fsf@tac.ki.iif.hu>
	<bffbecbb1003181440kc78f4dbvd25d4e2ea17b52e5@mail.gmail.com>
	<8739zqpxxw.fsf@tac.ki.iif.hu> <4BA9A1BB.4000105@lougher.demon.co.uk>
	<87y6hii5wq.fsf@macbook.be.48ers.dk>
Date: Wed, 24 Mar 2010 12:28:43 +0100
In-Reply-To: <87y6hii5wq.fsf@macbook.be.48ers.dk> (Peter Korsgaard's message
	of "Wed, 24 Mar 2010 07:35:01 +0100")
Message-ID: <871vfam00k.fsf@tac.ki.iif.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Peter Korsgaard <jacmet@sunsite.dk> writes:

>>>>>> "Phillip" == Phillip Lougher <phillip@lougher.demon.co.uk> writes:
>
>  Phillip> BTW as a comparison, I have added MTD support to Squashfs
>  Phillip> twice in the past, *with* bad block support.  The latest has a
>  Phillip> diff patch of ~500 lines, with far less complexity and code
>  Phillip> changes necessary.
>
> Again, what kind of size reduction can we expect from getting rid of
> the block layer?

My size-optimized OpenWRT vmlinux shrank ~170 kB after disabling
CONFIG_BLOCK.  Similarly for the memory consumption.
-- 
Regards,
Feri.
