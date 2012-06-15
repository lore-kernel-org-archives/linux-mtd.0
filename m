Received: from eu1sys200aog117.obsmtp.com ([207.126.144.143])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SfQRs-00005X-Rj
 for linux-mtd@lists.infradead.org; Fri, 15 Jun 2012 06:56:01 +0000
Message-ID: <4FDADC62.2040407@st.com>
Date: Fri, 15 Jun 2012 07:55:30 +0100
From: Angus CLARK <angus.clark@st.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: mtd nand erase and bad block
References: <4FC76039.6020701@sirius-es.it>	<4FC771EC.4090500@intel.com>	<4FC78012.5010704@sirius-es.it>	<4FC8601C.5070708@intel.com>	<Pine.LNX.4.64.1206010837100.4247@lnxricardw.se.axis.com>	<4FC87D62.6020402@st.com>	<1338540121.2536.150.camel@sauron.fi.intel.com>	<20120601140445.346e322e@halley>	<4FC8CBA7.6000702@st.com>	<20120601175407.7c39a8fb@halley>	<1338898670.2507.48.camel@sauron.fi.intel.com>
 <CAN8TOE_47JHHakwHYApZhOgb72dQxk7f1bxMoN5kb6NaxnqZBg@mail.gmail.com>
In-Reply-To: <CAN8TOE_47JHHakwHYApZhOgb72dQxk7f1bxMoN5kb6NaxnqZBg@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On 06/14/2012 06:48 PM, Brian Norris wrote:
> On Tue, Jun 5, 2012 at 5:17 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>> On Fri, 2012-06-01 at 17:54 +0300, Shmulik Ladkani wrote:
>>>
>>> My personal preference would be:
>>> 1. A new ioctl (MEMSCRUB?)
>>> 2. debugfs flag, PER MTD PART (slightly safer than your global flag)
>>> 3. global debugfs flag
[snip]
> I like the idea of an ioctl (option 1), since that does not require
> recompilation (even in the event that debugfs wasn't enabled) and can
> be built into a user-space tool, with appropriate warnings and
> prompting for the user, of course. The debugfs ideas seem a little bit
> too manual to be useful for anyone but a true driver/kernel developer
> and also a little bit too unsafe (a user may want to target a specific
> block without disabling bad block checking for all chips or even for
> the entire partition).
> 

Yes, I agree, option 1 is looking good.  The main motivation behind option 3 was
to add support with minimal code changes, but option 1 is a cleaner solution.

> 
> So Angus, are you going to code this?
> 

Yes, I will have go later today or early next week...

Cheers,

Angus
