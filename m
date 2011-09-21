Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R6FwW-0002hq-DS
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2011 06:06:01 +0000
Received: by fxg7 with SMTP id 7so1652880fxg.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Sep 2011 23:05:57 -0700 (PDT)
Subject: Re: [PATCH V3] mtd: Add DiskOnChip G3 support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Wed, 21 Sep 2011 09:08:07 +0300
In-Reply-To: <87fwjrjk10.fsf@free.fr>
References: <1316454213-22559-1-git-send-email-robert.jarzmik@free.fr>
	<1316501205.4849.36.camel@sauron> <87fwjrjk10.fsf@free.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1316585325.4849.73.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-09-20 at 17:44 +0200, Robert Jarzmik wrote:
> Artem Bityutskiy <dedekind1@gmail.com> writes:
> 
> > I really feel unsure about merging this driver because no one reviewed
> > it. On the surface it does look neat, though. Could you please CC lkml
> > on next submission?
> OK, when we have covered your comments, I'll report a V4 to lkml as well.
> 
> > On Mon, 2011-09-19 at 19:43 +0200, Robert Jarzmik wrote:
> >> +static void doc_delay(struct docg3 *docg3, int nbNOPs)
> >> +{
> >> +	int i;
> >> +
> >> +	doc_dbg("NOP x %d\n", nbNOPs);
> >> +	for (i = 0; i < nbNOPs; i++)
> >> +		doc_writeb(0, DoC_NOP);
> >> +}
> >
> > Why you implement dalaying this way, instead of using udelay/mdelay?
> That's from observation, as I have no specification available.
> 
> From my understanding, the clock applied to the chip can be variable, but the
> memory bus writes ensure the necessary time, as the NOP write takes as much time
> as the DOCG3 decides it to last.

OK, would be nice to have this kind of comment in that function.

> >> +	};
> >
> > Hmm, looks like something which should be generic, not DoC-specific.
> True, but it's not available yet.
> And as it's not available, and I don't think debugfs will accept such a patch, I
> think I'll leave it here. And if you wish, I'll fill in a separate patch to
> debugfs, and *if* it's merged, I'll remove that part then.

Fine with me.

-- 
Best Regards,
Artem Bityutskiy
