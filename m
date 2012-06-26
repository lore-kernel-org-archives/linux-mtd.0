Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sjdxn-0004wn-Ix
 for linux-mtd@lists.infradead.org; Tue, 26 Jun 2012 22:10:24 +0000
Received: by pbbrq13 with SMTP id rq13so706183pbb.36
 for <linux-mtd@lists.infradead.org>; Tue, 26 Jun 2012 15:10:21 -0700 (PDT)
Message-ID: <4FEA3349.3090701@gmail.com>
Date: Tue, 26 Jun 2012 15:10:17 -0700
From: Tomer Barletz <barletz@gmail.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: mtd nand erase and bad block
References: <4FC76039.6020701@sirius-es.it> <4FC771EC.4090500@intel.com>
 <4FC78012.5010704@sirius-es.it> <4FC8601C.5070708@intel.com>
 <Pine.LNX.4.64.1206010837100.4247@lnxricardw.se.axis.com>
 <4FC87D62.6020402@st.com> <1338540121.2536.150.camel@sauron.fi.intel.com>
 <20120601140445.346e322e@halley> <4FC8CBA7.6000702@st.com>
 <20120601175407.7c39a8fb@halley>
 <1338898670.2507.48.camel@sauron.fi.intel.com>
 <CAN8TOE_47JHHakwHYApZhOgb72dQxk7f1bxMoN5kb6NaxnqZBg@mail.gmail.com>
In-Reply-To: <CAN8TOE_47JHHakwHYApZhOgb72dQxk7f1bxMoN5kb6NaxnqZBg@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Angus CLARK <angus.clark@st.com>, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/14/2012 10:48 AM, Brian Norris wrote:
> Hi,
>
> On Tue, Jun 5, 2012 at 5:17 AM, Artem Bityutskiy<dedekind1@gmail.com>  wrote:
>> On Fri, 2012-06-01 at 17:54 +0300, Shmulik Ladkani wrote:
>>>
>>> My personal preference would be:
>>> 1. A new ioctl (MEMSCRUB?)
>>> 2. debugfs flag, PER MTD PART (slightly safer than your global flag)
>>> 3. global debugfs flag
>>>
>> Yes, I guess option 1 is the best I think. Option 2 needs too much work.
>
> Just to put my 2 cents in and revive this thread: I'm also interested
> in this kind of feature. I personally recompile to disable bad block
> tables temporarily whenever I need to reset a flash-based BBT or
> unmark a "bad block." But this isn't always so easy for others I deal
> with, so I'm all for a feature that can be used by a
> relatively-inexperienced user to reset bad block tables, erase bad
> block markers, etc.
>
> I like the idea of an ioctl (option 1), since that does not require
> recompilation (even in the event that debugfs wasn't enabled) and can
> be built into a user-space tool, with appropriate warnings and
> prompting for the user, of course. The debugfs ideas seem a little bit
> too manual to be useful for anyone but a true driver/kernel developer
> and also a little bit too unsafe (a user may want to target a specific
> block without disabling bad block checking for all chips or even for
> the entire partition).
>
> FWIW, a similar topic was brought up a long time back, with little result:
> http://lists.infradead.org/pipermail/linux-mtd/2010-October/032577.html
>
> So Angus, are you going to code this?
>

Isn't Jon's patch match option number 1?

--Tomer
