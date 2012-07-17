Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sr28L-0002LM-V2
 for linux-mtd@lists.infradead.org; Tue, 17 Jul 2012 07:23:52 +0000
Received: by weyr3 with SMTP id r3so68249wey.36
 for <linux-mtd@lists.infradead.org>; Tue, 17 Jul 2012 00:23:44 -0700 (PDT)
Date: Tue, 17 Jul 2012 10:23:33 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: dedekind1@gmail.com
Subject: Re: [PATCH 0/5] ubi: Fix bad PEBs reserve caclulation
Message-ID: <20120717102333.26cb10fb@pixies.home.jungo.com>
In-Reply-To: <1342452837.7270.15.camel@brekeke>
References: <1341389164-24409-1-git-send-email-shmulik.ladkani@gmail.com>
 <1342452837.7270.15.camel@brekeke>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Richard Genoud <richard.genoud@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Mon, 16 Jul 2012 18:33:57 +0300 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> But one more think is the mtd web-site. I've grepped for '1%' and there
> are plenty of them. I've changed them all to 2% more or less
> mechanically - only cleaned up one section by removing out-of-date
> information. Would you please grep for '2%' and review if the
> information there is reasonable? Also, would you please add some more
> info to this FAQ entry:
> 
> http://linux-mtd.infradead.org/faq/ubi.html#L_bad_blocks_exceeded
> 
> Or even better if you could write a separate section for this stuff in
> the documentation, then you could remove that FAQ entry completely.

Sure, I'll try to do it as well.

But it would only make sense after accepting Richard's patchset as well,
which suggests configuring per-ubi-device beb limit via the attach ioctl.

I didn't had the time to properly review it yet, but IMO it looks more
controversial.
http://lists.infradead.org/pipermail/linux-mtd/2012-July/042803.html

Regards,
Shmulik
