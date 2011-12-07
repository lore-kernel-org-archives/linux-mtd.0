Received: from bitbox.plus.com ([81.174.226.42] helo=bitbox.co.uk)
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RYE1U-0002JD-ED
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2011 09:42:45 +0000
Message-ID: <4EDF350D.9030104@bitbox.co.uk>
Date: Wed, 07 Dec 2011 09:42:37 +0000
From: Peter Horton <phorton@bitbox.co.uk>
MIME-Version: 1.0
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v2] MTD: modify mtd api to return bitflip info on read
 operations
References: <1322943640-11728-1-git-send-email-mikedunn@newsguy.com>
 <4EDB3295.6040201@bitbox.co.uk> <4EDB7B1D.60603@newsguy.com>
 <1323009827.9400.75.camel@sauron.fi.intel.com> <4EDB89E9.6070306@newsguy.com>
 <1323065234.2316.2.camel@koala> <4EDCF840.7050107@newsguy.com>
 <4EDCFAAC.90709@bitbox.co.uk> <4EDD142B.6090303@newsguy.com>
 <87hb1de5b6.fsf@free.fr>
In-Reply-To: <87hb1de5b6.fsf@free.fr>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Mike Dunn <mikedunn@newsguy.com>,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/12/2011 21:52, Robert Jarzmik wrote:
> Mike Dunn<mikedunn@newsguy.com>  writes:
>> On 12/05/2011 09:09 AM, Peter Horton wrote:
>>> Surely the check for "do we need to scrub ?" should be done lower down
>>> otherwise all users of the mtd NAND interface (UBI / JFFS2 etc) are going to
>>> have to re-implement those sysfs files and the corresponding checks.
>> Well, anything higher up that wants to avail itself of this api change will need
>> some rework regardless.  Currently the only info passed up from the driver is
>> that at least one bitflip occurred somewhere during the read.  The plan is to
>> eventually make some changes to UBI so that the decision to scrub is made more
>> intelligently.
>
> I'd like to second Mike's proposition here.
>
> Policy should not be put into drivers code whenever possible. The question "do
> we need to scrub" is to be answered in upper layers IMHO. Moreover, upper layer
> would then have the choice to trigger scrubbing on their own policy. This policy
> could rely on the information provided by the driver :
>   - how much bitflips the ECC can fix
>

It's not policy, it's a property of the NAND device.
