Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SfEAA-0004p9-F2
 for linux-mtd@lists.infradead.org; Thu, 14 Jun 2012 17:48:55 +0000
Received: by lbbgg6 with SMTP id gg6so2375274lbb.36
 for <linux-mtd@lists.infradead.org>; Thu, 14 Jun 2012 10:48:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1338898670.2507.48.camel@sauron.fi.intel.com>
References: <4FC76039.6020701@sirius-es.it> <4FC771EC.4090500@intel.com>
 <4FC78012.5010704@sirius-es.it> <4FC8601C.5070708@intel.com>
 <Pine.LNX.4.64.1206010837100.4247@lnxricardw.se.axis.com>
 <4FC87D62.6020402@st.com>
 <1338540121.2536.150.camel@sauron.fi.intel.com>
 <20120601140445.346e322e@halley> <4FC8CBA7.6000702@st.com>
 <20120601175407.7c39a8fb@halley>
 <1338898670.2507.48.camel@sauron.fi.intel.com>
Date: Thu, 14 Jun 2012 10:48:49 -0700
Message-ID: <CAN8TOE_47JHHakwHYApZhOgb72dQxk7f1bxMoN5kb6NaxnqZBg@mail.gmail.com>
Subject: Re: mtd nand erase and bad block
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org, Angus CLARK <angus.clark@st.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: dwmw2@infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, Jun 5, 2012 at 5:17 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Fri, 2012-06-01 at 17:54 +0300, Shmulik Ladkani wrote:
>>
>> My personal preference would be:
>> 1. A new ioctl (MEMSCRUB?)
>> 2. debugfs flag, PER MTD PART (slightly safer than your global flag)
>> 3. global debugfs flag
>>
> Yes, I guess option 1 is the best I think. Option 2 needs too much work.

Just to put my 2 cents in and revive this thread: I'm also interested
in this kind of feature. I personally recompile to disable bad block
tables temporarily whenever I need to reset a flash-based BBT or
unmark a "bad block." But this isn't always so easy for others I deal
with, so I'm all for a feature that can be used by a
relatively-inexperienced user to reset bad block tables, erase bad
block markers, etc.

I like the idea of an ioctl (option 1), since that does not require
recompilation (even in the event that debugfs wasn't enabled) and can
be built into a user-space tool, with appropriate warnings and
prompting for the user, of course. The debugfs ideas seem a little bit
too manual to be useful for anyone but a true driver/kernel developer
and also a little bit too unsafe (a user may want to target a specific
block without disabling bad block checking for all chips or even for
the entire partition).

FWIW, a similar topic was brought up a long time back, with little result:
http://lists.infradead.org/pipermail/linux-mtd/2010-October/032577.html

So Angus, are you going to code this?

Brian
