Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c5FQD-00037g-2F
 for linux-mtd@lists.infradead.org; Fri, 11 Nov 2016 17:15:26 +0000
Date: Fri, 11 Nov 2016 18:14:51 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Mason <slash.tmp@free.fr>
Cc: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>, linux-mtd
 <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>, DT
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Sebastian Frias <sf84@laposte.net>
Subject: Re: [PATCH v8] mtd: nand: add tango NAND flash controller support
Message-ID: <20161111181451.00b5ebfa@bbrezillon>
In-Reply-To: <5825EB70.4070406@free.fr>
References: <580F5AD2.9020909@sigmadesigns.com>
 <580F5B37.5090100@sigmadesigns.com>
 <580F8407.5070706@sigmadesigns.com>
 <20161106235812.0bcbbdc5@bbrezillon> <5825EB70.4070406@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marc,

On Fri, 11 Nov 2016 17:01:52 +0100
Mason <slash.tmp@free.fr> wrote:

> On 06/11/2016 23:58, Boris Brezillon wrote:
> 
> > Applied after fixing a few coding style issues to make checkpatch happy.  
> 
> First of all, I want to thank you for all the help you provided
> along the way.
> 
> I have to admit that I'm a bit frustrated by some of the changes you made
> to the patch.
> 
> Specifically, changing
> 
> from:  if (ptr_expr == NULL)
>   to:  if (!ptr_expr)
> 
> I dislike the second form, because it "hides" what is being tested.
> I've even seen people use !count to mean count == 0, and I find that
> very unintuitive.

I just fixed checkpatch --strict complaints.

> 
> I also have a hard time discerning a '!' after a '('
> 
> 
> The other change is the chip->options initialization. I thought
> you said on IRC I could keep my preferred formatting.

Hm, I said that you could use one flag per line, and I kept that. I
just moved the 'or' operator which is, IMO, better placed at the end of
the line, and I aligned the following flags with the first one to make
checkpatch happy.

> 
> 
> In the end, these are tiny issues in the grand scheme of things,
> but it was important for me to point them out.

Some maintainers don't care much, but I think enforcing these rules is
what brings consistency in the kernel code, that's why I try to make
checkpatch happy when I submit new code and ask developers to do so
when they submit code to the NAND subsystem.

I know you often disagree with the Linux coding style rules, but you're
a contributor to this project, and as such, you should commit to
the defined rules (and this includes the coding style rules).
And it appears that, instead of complying to these rules when you're
asked to, you keep arguing endlessly that your own coding style is
better. You'd better spend time on things that really matters.

Note that most of the time, when the contribution is looking good, but
a few coding style issue remain, I'm fixing those issues myself because
I know how annoying it can be to ask someone to post a new version to
fix such minor things.
But since you complain about that, next time I'll ask you to make
"checkpatch --strict" happy  before accepting your patch.

On a side note, as I already told you privately, you seem to be a smart
guy (the evolution of the tango NAND driver shows that you're able
to understand how things work, and take comments/reviews into account).
But you have the bad habit of consistently arguing when you're asked to
change something (and especially on minor things that are easy to fix).
This is really the kind of behavior that can upset maintainers (me
included). So please, try to work on that.

Regards,

Boris
