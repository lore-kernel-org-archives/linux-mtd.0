Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P5aUD-0001UU-Px
	for linux-mtd@lists.infradead.org; Tue, 12 Oct 2010 08:45:30 +0000
Received: by ewy7 with SMTP id 7so779755ewy.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Oct 2010 01:45:27 -0700 (PDT)
Subject: Re: [PATCH] jffs2: Fix serious write stall due to erase
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
In-Reply-To: <1286467304-23370-1-git-send-email-Joakim.Tjernlund@transmode.se>
References: <1286467304-23370-1-git-send-email-Joakim.Tjernlund@transmode.se>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 12 Oct 2010 11:42:39 +0300
Message-ID: <1286872959.2164.5.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-10-07 at 18:01 +0200, Joakim Tjernlund wrote:
> Drop the alloc_sem before erasing flash in
> jffs2_garbage_collect_pass().
> Otherwise writes are put on hold until the erase
> has finised.
> 
> Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
> ---
> 
>  I am fairly sure it is safe to unlock the alloc_sem before
>  calling jffs2_erase_pending_blocks(). Extra confirmation
>  would be great though.
> 
>  This problem was introduced in 2.6.35

This looks safe for me as well, but I do not remember JFFS2 locking
rules anymore, so I'm not 100% sure. I've pushed your patch to my
l2-mtd-2.6.git.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
