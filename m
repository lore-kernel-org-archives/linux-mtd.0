Received: from eu1sys200aog114.obsmtp.com ([207.126.144.137])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sm4g7-0003Ny-OI
 for linux-mtd@lists.infradead.org; Tue, 03 Jul 2012 15:06:13 +0000
Message-ID: <4FF30A22.8040500@st.com>
Date: Tue, 03 Jul 2012 16:05:06 +0100
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
 <1338898670.2507.48.camel@sauron.fi.intel.com> <4FDEF60A.7010607@st.com>	
 <1340790846.29342.19.camel@sauron.fi.intel.com> <4FEAFE73.2040303@st.com>	
 <1340965897.3070.144.camel@sauron.fi.intel.com> <4FF14A5E.2060301@st.com>
 <1341318170.2979.61.camel@sauron.fi.intel.com>
In-Reply-To: <1341318170.2979.61.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
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

On 07/03/2012 01:22 PM, Artem Bityutskiy wrote:
> On Mon, 2012-07-02 at 08:14 +0100, Angus CLARK wrote:
>> On 06/29/2012 11:31 AM, Artem Bityutskiy wrote:
>>> On Wed, 2012-06-27 at 13:37 +0100, Angus CLARK wrote:
>>>> However, for case 2, I just want to force the erase operation so I can wipe the
>>>> BBTs and return the device as close as possible to its original state.  We could
>>>> put some logic in the kernel, "if 'MEMBBSCRUB" on BBT blocks, do not
>>>> update/rewrite BBTs", but I think this "policy" decision would be better handled
>>>> in userspace.
>>>
>>> Sounds like you need 2 separate ioctls:
>>> 1. MEMBBSCRUB
>>
>> There are occasions when it is useful to unmark a bad block, but without erasing
>> first.  Therefore, I guess my preference would be to split this further:
>> 'erase-bad-block' and 'mark-block-as-good'.
> 
> I can smell over-engineering 

Indeed.  The solution I shared at the start of this thread involved a 3-line
patch to add a debugfs entry!  This meets our own requirements for
debug/development, although I admit it is a little unsafe when used
inappropriately ;-)

> - any good example? 

One example would to be regain access to blocks that were incorrectly identified
as bad during the creation of the BBTs.  This can happen when the NAND device is
pre-programmed with a boot-loader or test-software, but the process used to
perform the pre-programming does not write the BBTs.  If the ECC data is such
that it clashes with the OOB BBM, then linux will detect these as bad blocks on
first boot.  Of course, the problem lies with the pre-programmer, but it is
helpful to get access to the blocks in linux without erasing the data first.

> Note, you will leave
> unused bytes in the ioctl data structure an make it extandable in the
> future.

So, are you suggesting that I implement a MEMBBSCRUB ioctl, with a flag to
indicate whether or not the BBTs should be updated (and some extra padding for
future-proofing)?  Might have think about what happens when called on blocks
reserved for the BBTs...

Cheers,

Angus
