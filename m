Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmHvf-0005zY-0B
 for linux-mtd@lists.infradead.org; Thu, 06 Nov 2014 07:56:27 +0000
Message-ID: <1415260542.958.161.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 03/35] UBI: Fastmap: Add self check to detect absent PEBs
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Thu, 06 Nov 2014 09:55:42 +0200
In-Reply-To: <545A4ACA.2070402@nod.at>
References: <1414586758-9972-1-git-send-email-richard@nod.at>
 <1414586758-9972-4-git-send-email-richard@nod.at>
 <1415201029.958.118.camel@sauron.fi.intel.com> <545A48BD.9010904@nod.at>
 <1415203295.958.133.camel@sauron.fi.intel.com> <545A4ACA.2070402@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 tlinder@codeaurora.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-11-05 at 17:05 +0100, Richard Weinberger wrote:
> Am 05.11.2014 um 17:01 schrieb Artem Bityutskiy:
> > On Wed, 2014-11-05 at 16:56 +0100, Richard Weinberger wrote:
> >>  I did that to have alloc and free balanced.
> >> I.e. to not have a naked kfree(). Always when I see a kfree()
> >> somewhere
> >> I'd like to see the k*alloc().
> > 
> > OK. Please, just make the comment simpler then. Say that you are freeing
> > the debugging buffer or something.
> 
> Will do!

I suggest you to prepare a short series of patches and send this out. I
think I can process them faster then. When you send 35 patches I tend to
postpone the review because it looks like a a lot of work which needs a
lot of time. Small series is easier to deal with.

So instead of re-sending 35 patches, just send 3 or for good patches,
I'll pick them much faster, I think.

Artem.
