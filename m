Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17L0zz-0007rw-00
	for <linux-mtd@lists.infradead.org>; Thu, 20 Jun 2002 13:25:16 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <541025071C7AC24C84E9F82296BB9B950805E2@OPTEX1.optex.local> 
References: <541025071C7AC24C84E9F82296BB9B950805E2@OPTEX1.optex.local> 
To: "John Hall" <John.Hall@optionexist.co.uk>
Cc: joakim.tjernlund@lumentis.se, linux-mtd@lists.infradead.org
Subject: Re: [Fwd: cfi_cmdset_0001.c: do_write_buffer bug] 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 20 Jun 2002 13:25:03 +0100
Message-ID: <20794.1024575903@redhat.com>
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

John.Hall@optionexist.co.uk said:
>  Not yet. We've spoken to Intel and they acknowledge there might be a
> problem, but we're waiting for them to get back to us.

OK, I suspect what we want to do is something like...

 Send WriteToBuffer command.
 Poll for a little while for chips to become ready.
 If neither chip is ready, repeat.
 If only one chip is ready, abort the WriteToBuffer. Send a zero-length 
	(or one-byte) buffer and then something other than a WriteConfirm
	command, to abort the write. Clear the resulting 'Invalid Command/
	Sequence' error bits which will get set, and start again.

--
dwmw2
