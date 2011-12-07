Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RY73u-0005Ec-Dl
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2011 02:16:47 +0000
Message-ID: <4EDECC7A.1080202@newsguy.com>
Date: Tue, 06 Dec 2011 18:16:26 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v2] MTD: modify mtd api to return bitflip info on read
 operations
References: <1322943640-11728-1-git-send-email-mikedunn@newsguy.com>	<4EDB3295.6040201@bitbox.co.uk>
 <4EDB7B1D.60603@newsguy.com>	<1323009827.9400.75.camel@sauron.fi.intel.com>	<4EDB89E9.6070306@newsguy.com>
 <1323065234.2316.2.camel@koala>	<4EDCF840.7050107@newsguy.com>
 <4EDCFAAC.90709@bitbox.co.uk>	<4EDD142B.6090303@newsguy.com>
 <87hb1de5b6.fsf@free.fr>
In-Reply-To: <87hb1de5b6.fsf@free.fr>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
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

On 12/06/2011 01:52 PM, Robert Jarzmik wrote:
> Mike Dunn <mikedunn@newsguy.com> writes:
>> On 12/05/2011 09:09 AM, Peter Horton wrote:
>>> Surely the check for "do we need to scrub ?" should be done lower down
>>> otherwise all users of the mtd NAND interface (UBI / JFFS2 etc) are going to
>>> have to re-implement those sysfs files and the corresponding checks.
>> Well, anything higher up that wants to avail itself of this api change will need
>> some rework regardless.  Currently the only info passed up from the driver is
>> that at least one bitflip occurred somewhere during the read.  The plan is to
>> eventually make some changes to UBI so that the decision to scrub is made more
>> intelligently.
> I'd like to second Mike's proposition here.
>
> Policy should not be put into drivers code whenever possible. The question "do
> we need to scrub" is to be answered in upper layers IMHO. Moreover, upper layer
> would then have the choice to trigger scrubbing on their own policy. This policy
> could rely on the information provided by the driver :
>  - how much bitflips the ECC can fix
>
> Even better, but I don't know how, the policy should be a userspace matter and
> not a kernel one, as I was told many times before :)
>
> Therefore, a upperlayer which strives at very high security level could scrub at
> 1 bitflip even if the ECC can fix 8. A "normal" upperlayer could go up to 8
> before scrubbing.


Yes, this flexibility is good, and why policy should not be set from below. 
Good point.  I just mentioned the "don't set policy" doctrine because I blindly
follow dogma :)


> Now for the "re-implement sysfs and checks", that's true. What could be done is
> in a first time, copycat the current behaviour, ie. UBI scrubs if nb_bitflips >
> 0, and the same for JFFS I suppose.
> Then in a second pass, add sysfs values for the trigger (whether in upperlayers
> or MTD). This needs a consensus from the list.


For UBI, the direction of the discussion was that the driver would indicate the
ecc strength of the device (via a new element in struct mtd_info), and this
would be the default UBI scrublevel.  A non-zero sysfs parameter would override
the default.

BTW, it is currently possible (and easy) to do what Peter suggests; i.e., to
avoid any UBI rework and make the decision to scrub in the driver.  All the
driver has to do is not return -EUCLEAN unless it thinks the block should be
scrubbed.  Of course this would be a lie if there were in fact corrected
bitflips.  For drivers using the mtd nand interface, the lie would be in the ecc
stats, since the nand infrastructure code returns -EUCLEAN (or 0) based on
that.  This is what we willl have to do in the diskonchip drivers in order to
get ubi/ubifs to work on them if we don't change the mtd api (and afterwards
make the changes to ubi).

Thanks,
Mike
