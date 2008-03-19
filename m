Received: from gv-out-0910.google.com ([216.239.58.188])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JbyRc-0000bF-3a
	for linux-mtd@lists.infradead.org; Wed, 19 Mar 2008 13:35:04 +0000
Received: by gv-out-0910.google.com with SMTP id e6so121516gvc.5
	for <linux-mtd@lists.infradead.org>;
	Wed, 19 Mar 2008 06:35:02 -0700 (PDT)
Message-ID: <79ac09b60803190635h6935e15aiebad0b2a45dc0ce4@mail.gmail.com>
Date: Wed, 19 Mar 2008 08:35:02 -0500
From: Duke <ezbonites@gmail.com>
To: "Jamie Lokier" <jamie@shareable.org>
Subject: Re: JFFS2 filesystem integrity issue
In-Reply-To: <20080319040244.GA11832@shareable.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <79ac09b60803182045i376f78deh289c6ee5d49d06ec@mail.gmail.com>
	<20080319040244.GA11832@shareable.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 18, 2008 at 11:02 PM, Jamie Lokier <jamie@shareable.org> wrote:
> Duke wrote:
>  > For some reason it either seem to read the file incorrectly or the
>  > file is corrupt some how. When this happens I don't loose the
>  > calibration altogether but it is intermittent and sporadic at times.
>  > Has anyone seen something similar? Does the cause seem realistic?
>  > Has anyone had a possible corruption like this?
>
>  I have seen similar, and it was due to borderline timing or signal
>  integrity issues, possibly affected by what else the CPU was doing at
>  the time.

Didn't adjusting the timing of the banks help you any?

>  It was fixed in our case by improving the PCB design.

I'm doing a rev of the board but as far as improving the design, I
have no reason to adjust my memory design.
Perhaps you have something I can look for?

Thanks,
-D
