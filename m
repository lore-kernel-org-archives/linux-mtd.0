Received: from smtp.fh-landshut.de ([193.175.141.50])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BICEK-0003Mr-5f
	for linux-mtd@lists.infradead.org; Mon, 26 Apr 2004 20:57:28 +0100
Message-ID: <408D69B2.8050906@fh-landshut.de>
Date: Mon, 26 Apr 2004 21:57:38 +0200
From: Oliver Korpilla <okorpil@fh-landshut.de>
MIME-Version: 1.0
To: Shawn Jin <xiaogeng_jin@agilent.com>
References: <3236F92B82933347807DFF6A8BA63280D74675@wcosmb04.cos.agilent.com>
	<408D4A58.7000402@agilent.com>
In-Reply-To: <408D4A58.7000402@agilent.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Newbie help! - Old AMD (cfi_cmdset_0002) interleaved flash
	problems
Reply-To: okorpil@fh-landshut.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Shawn Jin wrote:

> A general remark is that the current CVS code of cmdset_0002 may not 
> work on all interleaved chips. If I were you, I would try some older 
> version, e.g. the code coming with DENX distribution (v 1.62).
>
> -Shawn.
>
Thank you, Shawn.

If you mean v 1.62 if cfi_cmdset_0002.c, this is what actually comes
with Linux 2.4.25, and I tried that. On top of the timeouts I get a
kernel panic as well on a timeout with that version.

Did you mean that, or am I getting my versions wrong?

http://lists.infradead.org/pipermail/linux-mtd/2004-April/009660.html
http://lists.infradead.org/pipermail/linux-mtd/2004-April/009666.html

Both these references above are why I cannot actually go with that
release (I currently have tested 1.62, 1.93 and 1.98(current)).

Is this simply a too low timeout problem (which I guess it isn't -
timeout seems now to be longer, and it still doesn't help), or is it a
problem of the write failing (so a timeout will show in any case)? I'm
beginning to guess the 2nd one.

With kind regards,
Oliver Korpilla
