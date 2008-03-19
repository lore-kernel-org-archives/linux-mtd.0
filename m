Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JbpVn-0001vG-K2
	for linux-mtd@lists.infradead.org; Wed, 19 Mar 2008 04:02:48 +0000
Date: Wed, 19 Mar 2008 04:02:44 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Duke <ezbonites@gmail.com>
Subject: Re: JFFS2 filesystem integrity issue
Message-ID: <20080319040244.GA11832@shareable.org>
References: <79ac09b60803182045i376f78deh289c6ee5d49d06ec@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79ac09b60803182045i376f78deh289c6ee5d49d06ec@mail.gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Duke wrote:
> For some reason it either seem to read the file incorrectly or the
> file is corrupt some how. When this happens I don't loose the
> calibration altogether but it is intermittent and sporadic at times.
> Has anyone seen something similar? Does the cause seem realistic?
> Has anyone had a possible corruption like this?

I have seen similar, and it was due to borderline timing or signal
integrity issues, possibly affected by what else the CPU was doing at
the time.

It was fixed in our case by improving the PCB design.

-- Jamie
