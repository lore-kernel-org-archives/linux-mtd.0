Received: from eu1sys200aog115.obsmtp.com ([207.126.144.139])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SgYLo-0007f3-2T
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2012 09:34:24 +0000
Message-ID: <4FDEF60A.7010607@st.com>
Date: Mon, 18 Jun 2012 10:34:02 +0100
From: Angus CLARK <angus.clark@st.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: mtd nand erase and bad block
References: <4FC76039.6020701@sirius-es.it> <4FC771EC.4090500@intel.com>
 <4FC78012.5010704@sirius-es.it> <4FC8601C.5070708@intel.com>
 <Pine.LNX.4.64.1206010837100.4247@lnxricardw.se.axis.com>
 <4FC87D62.6020402@st.com> <1338540121.2536.150.camel@sauron.fi.intel.com>
 <20120601140445.346e322e@halley> <4FC8CBA7.6000702@st.com>
 <20120601175407.7c39a8fb@halley>
 <1338898670.2507.48.camel@sauron.fi.intel.com>
In-Reply-To: <1338898670.2507.48.camel@sauron.fi.intel.com>
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

Hi Artem,

On 06/05/2012 01:17 PM, Artem Bityutskiy wrote:
> On Fri, 2012-06-01 at 17:54 +0300, Shmulik Ladkani wrote:
>>
>> My personal preference would be:
>> 1. A new ioctl (MEMSCRUB?)
>> 2. debugfs flag, PER MTD PART (slightly safer than your global flag)
>> 3. global debugfs flag
>>
> Yes, I guess option 1 is the best I think. Option 2 needs too much work.

Are you ok with the name MEMSCRUB?  I know previously you have objected to this
name, since it might get confused with UBI scrubbing
(http://lists.infradead.org/pipermail/linux-mtd/2010-September/032031.html).  In
fact, the conclusion of that thread was to add an extended erase IOCTL, with a
'flags' parameter to capture options such as erase bad blocks.  Would this be
the preferred method (it didn't seem to go anywhere last time), or is 'MEMSCRUB'
with the existing erase_info_user64 structure acceptable?

Cheers,

Angus
