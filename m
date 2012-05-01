Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SP8T3-0006cp-TQ
 for linux-mtd@lists.infradead.org; Tue, 01 May 2012 08:29:54 +0000
Received: by lbbgg6 with SMTP id gg6so1145136lbb.36
 for <linux-mtd@lists.infradead.org>; Tue, 01 May 2012 01:29:49 -0700 (PDT)
Date: Tue, 1 May 2012 11:29:40 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 09/10] mtd: nand: utilize oob_required parameter
Message-ID: <20120501112940.3e3c4841@pixies.home.jungo.com>
In-Reply-To: <CAN8TOE-+4FP1rR82L2Kfg__MgmsmMQZuZ_BO_FCcvSZDasChNw@mail.gmail.com>
References: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
 <1335576594-25267-10-git-send-email-computersforpeace@gmail.com>
 <20120429154707.01c7be55@pixies.home.jungo.com>
 <CAN8TOE-+4FP1rR82L2Kfg__MgmsmMQZuZ_BO_FCcvSZDasChNw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Mon, 30 Apr 2012 12:59:52 -0700 Brian Norris <computersforpeace@gmail.com> wrote:
> On Sun, Apr 29, 2012 at 5:47 AM, Shmulik Ladkani
> <shmulik.ladkani@gmail.com> wrote:
> > On Fri, 27 Apr 2012 18:29:53 -0700 Brian Norris <computersforpeace@gmail.com> wrote:
> >> Don't read/write OOB if the caller doesn't requre it.
> >
> > Re-thinking this, I think this might be incorrect.
> > Sorry I havn't noticed this earlier.
> >
> > Suppose the nand chip is working in "sequential" (aka "incremental")
> > mode.
> > Meaning, a NAND_CMD_READ0 command is issued, and then adjacent pages are
> > read sequencially, without having to re-issue NAND_CMD_READ0.
> >
> > (see for example the loop within 'nand_do_read_ops', especially the
> > 'sndcmd' variable).
> >
> > In that case, we MUST read the 'oob', because the OOB bytes will always
> > arrive on the bus following the inband data.
> ...
> 
> I see. This is the kind of issue I was alluding to back in v2:
> 
> "For instance, is there any sort of hardware that expects the whole
> page + OOB to be read via chip->read_buf() for all reads..."

Yep. Charmed by the 'oob_required' idea, I sensed this potential trouble
too late :)

This is more delicate than I originally thought.

I completely agree with your statement "please do NOT accept any of
the patches 3-10 without an explicit ACK from someone who knows the driver".

I was querying regarging the adaptation of existing drivers since the
patchset looked "incomplete".

However if this attempt gets too complicated, I guess the compromise of
submitting just the infrastructure changes (patches 1 and 2) is probably
reasonable. Let the maintainers decide.

Regards,
Shmulik
