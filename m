Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RY2wI-0002pb-T8
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2011 21:52:40 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH v2] MTD: modify mtd api to return bitflip info on read
 operations
References: <1322943640-11728-1-git-send-email-mikedunn@newsguy.com>
 <4EDB3295.6040201@bitbox.co.uk> <4EDB7B1D.60603@newsguy.com>
 <1323009827.9400.75.camel@sauron.fi.intel.com>
 <4EDB89E9.6070306@newsguy.com> <1323065234.2316.2.camel@koala>
 <4EDCF840.7050107@newsguy.com> <4EDCFAAC.90709@bitbox.co.uk>
 <4EDD142B.6090303@newsguy.com>
Date: Tue, 06 Dec 2011 22:52:29 +0100
In-Reply-To: <4EDD142B.6090303@newsguy.com> (Mike Dunn's message of "Mon, 05
 Dec 2011 10:57:47 -0800")
Message-ID: <87hb1de5b6.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Peter Horton <phorton@bitbox.co.uk>, linux-mtd@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mike Dunn <mikedunn@newsguy.com> writes:
> On 12/05/2011 09:09 AM, Peter Horton wrote:
>> Surely the check for "do we need to scrub ?" should be done lower down
>> otherwise all users of the mtd NAND interface (UBI / JFFS2 etc) are going to
>> have to re-implement those sysfs files and the corresponding checks.
> Well, anything higher up that wants to avail itself of this api change will need
> some rework regardless.  Currently the only info passed up from the driver is
> that at least one bitflip occurred somewhere during the read.  The plan is to
> eventually make some changes to UBI so that the decision to scrub is made more
> intelligently.

I'd like to second Mike's proposition here.

Policy should not be put into drivers code whenever possible. The question "do
we need to scrub" is to be answered in upper layers IMHO. Moreover, upper layer
would then have the choice to trigger scrubbing on their own policy. This policy
could rely on the information provided by the driver :
 - how much bitflips the ECC can fix

Even better, but I don't know how, the policy should be a userspace matter and
not a kernel one, as I was told many times before :)

Therefore, a upperlayer which strives at very high security level could scrub at
1 bitflip even if the ECC can fix 8. A "normal" upperlayer could go up to 8
before scrubbing.

Now for the "re-implement sysfs and checks", that's true. What could be done is
in a first time, copycat the current behaviour, ie. UBI scrubs if nb_bitflips >
0, and the same for JFFS I suppose.

Then in a second pass, add sysfs values for the trigger (whether in upperlayers
or MTD). This needs a consensus from the list.

Cheers.

-- 
Robert
