Received: from anchor-post-33.mail.demon.net ([194.217.242.91])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Avdxl-0003Mq-3i
	for linux-mtd@lists.infradead.org; Tue, 24 Feb 2004 14:55:09 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Simon Haynes <simon@baydel.com>
To: David Woodhouse <dwmw2@infradead.org>
Date: Tue, 24 Feb 2004 14:25:17 +0000
References: <4034E8ED.5757.55A2D9@localhost> <69481CB84E71@baydel.com>
	<1077632578.7826.415.camel@hades.cambridge.redhat.com>
In-Reply-To: <1077632578.7826.415.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <6971771D4E8E@baydel.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Corruption.
Reply-To: simon@baydel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 24 Feb 2004 2:22 pm, David Woodhouse wrote:
> On Tue, 2004-02-24 at 13:40 +0000, Simon Haynes wrote:
> > I don't understand. I changed the kernel to use the read only device. I
> > expected this to work rw without caching but it does not.
>
> You can't use flash RW without caching. It _has_ to
> read/modify/erase/writeback to write to flash.
>
> But for JFFS2, you _don't_ use flash RW through mtdblock. It operates
> directly and should work fine. What failure mode do you observe?


The problem is when I mount the erased partition using

mount -t jffs2 /dev/mtdblock1 /smc

/smc is mounted read only and I cannot write to it.

surely this is the same as not remounting root read write ?

Cheers Simon.
