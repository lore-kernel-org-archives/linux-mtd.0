Received: from mail-wg0-f45.google.com ([74.125.82.45])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T5VzD-0000cr-96
 for linux-mtd@lists.infradead.org; Sun, 26 Aug 2012 06:06:15 +0000
Received: by wgbdq12 with SMTP id dq12so2169225wgb.26
 for <linux-mtd@lists.infradead.org>; Sat, 25 Aug 2012 23:06:11 -0700 (PDT)
Date: Sun, 26 Aug 2012 09:06:03 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH v2] mtd: cmdlinepart: fix the wrong partitions number
 when truncating occurs
Message-ID: <20120826090603.6b833e54@pixies.home.jungo.com>
In-Reply-To: <CAMiH66HyfNEzEHGyZUcLJ_01PNVHqA44fjAqXsyM2c-HHms8hQ@mail.gmail.com>
References: <1345904767-23011-1-git-send-email-shijie8@gmail.com>
 <20120825120231.73577d6a@halley>
 <CAMiH66HyfNEzEHGyZUcLJ_01PNVHqA44fjAqXsyM2c-HHms8hQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Sat, 25 Aug 2012 05:26:51 -0400 Huang Shijie <shijie8@gmail.com> wrote:
> On Sat, Aug 25, 2012 at 5:02 AM, Shmulik Ladkani
> <shmulik.ladkani@gmail.com> wrote:
> > Your analysis seems right, but let me offer an alternative approach.
> >
> > I would simply:
> >
> > -                                       part->num_parts = i;
> your code does not wors in such kernel command line(also with the 1GB
> nand chip):
> #gpmi-nand:100m(root),100m(kernel),1g(rootfs),1g(user),-(rest)
> 

Can you please detail what do you mean by "not work"?

To my understanding, in this example, according to my suggestion, the
resulting partitions would be:

root	100m@0
kernel	100m@100m
rootfs	800m@200m (truncated)
user	0@1g (truncated)
rest	0@1g

Reasonable IMO, given the fact that the mtd device size is smaller than
the specified parts.

I saw you submitted a patch which sorts the cmdline parts; I don't
understand why this is necessary.
Also, sorting might not be desirable, as the user specified the unsorted
partitions might have _wanted_ them to appear in that order.

Now lets focus on your original suggestion and its consequences:

- Orignal code STOPPED parsing at the 1st truncated partition,
  this partition WAS NOT returned to the caller
- Your patch STOPS AFTER parsing the 1st truncated partition,
  this partiton IS returned to the caller (but partitions specified
  later are no longer parsed)
- My suggestion CONTINUES parsing all partitions.
  So later partitions (specified with the 'size' but *without* 'offset')
  will be truncated AND presented to the caller.
  AND, if later partitions are specified using the 'size@offset'
  explicit format, they are parsed normally.
  
Regards,
Shmulik
