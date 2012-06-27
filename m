Received: from eu1sys200aog117.obsmtp.com ([207.126.144.143])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SjrUx-0001Nj-Iy
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2012 12:37:32 +0000
Message-ID: <4FEAFE73.2040303@st.com>
Date: Wed, 27 Jun 2012 13:37:07 +0100
From: Angus CLARK <angus.clark@st.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: mtd nand erase and bad block
References: <4FC76039.6020701@sirius-es.it> <4FC771EC.4090500@intel.com>
 <4FC78012.5010704@sirius-es.it> <4FC8601C.5070708@intel.com>
 <Pine.LNX.4.64.1206010837100.4247@lnxricardw.se.axis.com>
 <4FC87D62.6020402@st.com> <1338540121.2536.150.camel@sauron.fi.intel.com>
 <20120601140445.346e322e@halley> <4FC8CBA7.6000702@st.com>
 <20120601175407.7c39a8fb@halley>
 <1338898670.2507.48.camel@sauron.fi.intel.com> <4FDEF60A.7010607@st.com>
 <1340790846.29342.19.camel@sauron.fi.intel.com>
In-Reply-To: <1340790846.29342.19.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/27/2012 10:54 AM, Artem Bityutskiy wrote:
> On Mon, 2012-06-18 at 10:34 +0100, Angus CLARK wrote:
>> On 06/05/2012 01:17 PM, Artem Bityutskiy wrote:
>>> On Fri, 2012-06-01 at 17:54 +0300, Shmulik Ladkani wrote:
>>>>
>>>> My personal preference would be:
>>>> 1. A new ioctl (MEMSCRUB?)
>>>> 2. debugfs flag, PER MTD PART (slightly safer than your global flag)
>>>> 3. global debugfs flag
>>>>
>>> Yes, I guess option 1 is the best I think. Option 2 needs too much work.
>>
>> Are you ok with the name MEMSCRUB?  I know previously you have objected to this
>> name, since it might get confused with UBI scrubbing
>> (http://lists.infradead.org/pipermail/linux-mtd/2010-September/032031.html).  In
>> fact, the conclusion of that thread was to add an extended erase IOCTL, with a
>> 'flags' parameter to capture options such as erase bad blocks.  Would this be
>> the preferred method (it didn't seem to go anywhere last time), or is 'MEMSCRUB'
>> with the existing erase_info_user64 structure acceptable?
> 
> I think Shmulik had a good point - scrubbing is not only about erasing,
> but also about changing the BBT. So a separate ioctl makes more sense.
> As for the name, we could name it MEMBBSCRUB, I guess?
> 

There may be others, but the two use-cases I have for erasing blocks marked as
bad are:

1. Restore the status of a block known to be good, but marked as bad.  The block
may have been marked bad deliberately, for test purposes, or it may have been
incorrectly identified as bad due to "alien" data from a previous driver/ECC
scheme clashing with the OOB BBM.

2. Erase the Flash-resident BBTs.  These blocks are reported as bad to prevent
accidental write or erase operations.  However, one might want to erase the
BBTs, either to test the OOB BBM scanning and BBT rebuild on next reboot, or
prior to changing driver and/or ECC scheme.

For case 1, it makes sense to update the BBTs at the same time.  At present, I
have to scrub the block in question, scrub the BBTs, and then reboot to force a
rescan/rebuild of the BBTs.  (This is fairly simple to do, but does risk loosing
information about blocks that have gone bad through wear, unless invoking the
"mtd: nand: write BBM to OOB even with flash-based BBT" patch.)

However, for case 2, I just want to force the erase operation so I can wipe the
BBTs and return the device as close as possible to its original state.  We could
put some logic in the kernel, "if 'MEMBBSCRUB" on BBT blocks, do not
update/rewrite BBTs", but I think this "policy" decision would be better handled
in userspace.

At the risk of repeating the discussion in
http://lists.infradead.org/pipermail/linux-mtd/2010-September/032031.html, how
about adding the MEMSCRUB IOCTL for erasing blocks marked as bad (I have the
kernel and mtd-utils patches available), and then adding 'MEMSETGOODBLOCK' for
updating the BBTs and/or OOB BBM?

Cheers,

Angus
