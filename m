Received: from eu1sys200aog111.obsmtp.com ([207.126.144.131])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SlaqR-00045z-Ke
 for linux-mtd@lists.infradead.org; Mon, 02 Jul 2012 07:14:53 +0000
Message-ID: <4FF14A5E.2060301@st.com>
Date: Mon, 02 Jul 2012 08:14:38 +0100
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
 <1340965897.3070.144.camel@sauron.fi.intel.com>
In-Reply-To: <1340965897.3070.144.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=ISO-8859-1
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

On 06/29/2012 11:31 AM, Artem Bityutskiy wrote:
> On Wed, 2012-06-27 at 13:37 +0100, Angus CLARK wrote:
>> However, for case 2, I just want to force the erase operation so I can wipe the
>> BBTs and return the device as close as possible to its original state.  We could
>> put some logic in the kernel, "if 'MEMBBSCRUB" on BBT blocks, do not
>> update/rewrite BBTs", but I think this "policy" decision would be better handled
>> in userspace.
> 
> Sounds like you need 2 separate ioctls:
> 1. MEMBBSCRUB

There are occasions when it is useful to unmark a bad block, but without erasing
first.  Therefore, I guess my preference would be to split this further:
'erase-bad-block' and 'mark-block-as-good'.

> 2. MEMBBTWIPE
> 

This could be a useful addition, since it avoids the need for the user to
calculate the offsets for the BBT blocks.

However, I just have a slight concern about adding the now three new ioctls for
what is essentially development and debugging purposes.  (Indeed, we would
probably want a way of disabling these features for production systems.)

Support for 'erase-bad-block' requires minimal updates, and this one ioctl can
be used to achieve the functionality of the other two, albeit with a little
expert knowledge!  Support for 'mark-block-as-good' and 'wipe-bbts' ioctls would
require more extensive updates (in particular, to nand_bbt.c which has been
updated heavily since the kernel version I have available for testing!).

I would probably edge towards adding just the 'erase-bad-block' option, although
I except my judgement might be slightly biased here, since I have been using a
variant of this for a year or so.  I am happy to implement either approach, but
I would be interested to learn others' views first.

Cheers,

Angus
