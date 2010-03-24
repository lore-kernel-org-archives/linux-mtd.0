Received: from ey-out-1920.google.com ([74.125.78.149])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NuOrs-0000N8-5d
	for linux-mtd@lists.infradead.org; Wed, 24 Mar 2010 11:35:28 +0000
Received: by ey-out-1920.google.com with SMTP id 4so623642eyg.26
	for <linux-mtd@lists.infradead.org>;
	Wed, 24 Mar 2010 04:35:22 -0700 (PDT)
Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <jacmet@sunsite.dk>
To: Ferenc Wagner <wferi@niif.hu>
Subject: Re: RFC: direct MTD support for SquashFS
References: <87vdcwv139.fsf@tac.ki.iif.hu>
	<87ljdsibqe.fsf@macbook.be.48ers.dk> <87r5nhziss.fsf@tac.ki.iif.hu>
	<bffbecbb1003181440kc78f4dbvd25d4e2ea17b52e5@mail.gmail.com>
	<8739zqpxxw.fsf@tac.ki.iif.hu> <4BA9A1BB.4000105@lougher.demon.co.uk>
	<87y6hii5wq.fsf@macbook.be.48ers.dk> <871vfam00k.fsf@tac.ki.iif.hu>
Date: Wed, 24 Mar 2010 12:35:21 +0100
In-Reply-To: <871vfam00k.fsf@tac.ki.iif.hu> (Ferenc Wagner's message of "Wed,
	24 Mar 2010 12:28:43 +0100")
Message-ID: <87ljdihs06.fsf@macbook.be.48ers.dk>
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

>>>>> "Ferenc" == Ferenc Wagner <wferi@niif.hu> writes:

Hi,

 >> Again, what kind of size reduction can we expect from getting rid of
 >> the block layer?

 Ferenc> My size-optimized OpenWRT vmlinux shrank ~170 kB after disabling
 Ferenc> CONFIG_BLOCK.  Similarly for the memory consumption.

Neat, thanks - That sounds worthwhile.

-- 
Bye, Peter Korsgaard
