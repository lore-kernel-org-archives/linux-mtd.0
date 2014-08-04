Received: from mail-lb0-f180.google.com ([209.85.217.180])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XEMar-0004zU-6r
 for linux-mtd@lists.infradead.org; Mon, 04 Aug 2014 18:02:45 +0000
Received: by mail-lb0-f180.google.com with SMTP id v6so5576899lbi.25
 for <linux-mtd@lists.infradead.org>; Mon, 04 Aug 2014 11:02:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140801191340.GN18016@ZenIV.linux.org.uk>
References: <1406909172-7219-1-git-send-email-jharris@westell.com>
 <20140801165607.GM18016@ZenIV.linux.org.uk>
 <CAGMfbUPOMKVkZuZtzoN-w5pTpjHMzYhrdaM2WuBdm7RSMsNYAw@mail.gmail.com>
 <20140801191340.GN18016@ZenIV.linux.org.uk>
Date: Mon, 4 Aug 2014 14:02:19 -0400
Message-ID: <CAGMfbUMua7uZR16G1-r4+DwoPP2k5C3TQDNQkvbCO4RFwRm-+A@mail.gmail.com>
Subject: Re: [PATCH] jffs2: Re-enable write-buffering after filesystem sync
From: Jeff Harris <jefftharris@gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, Jeff Harris <jharris@westell.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 1, 2014 at 3:13 PM, Al Viro <viro@zeniv.linux.org.uk> wrote:
> Why do we need ->wbuf_queued, anyway?  It's not as if queue_delayed_work()
> wouldn't do the right thing - if the sucker already has WORK_STRUCT_PENDING_BIT
> set it'll simply do nothing.  And it won't spend much time finding that
> out - in fact, it'll be cheaper than what we do right now.
>
> IOW, how about the following (completely untested):
>

I tested the patch against our 3.13 device, and it appears to resolve
the original
write-buffering after sync problem we were having.  I did not do any
other regression
testing, though.

Jeff
