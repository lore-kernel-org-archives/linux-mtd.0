Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S7Wk5-0006np-VQ
 for linux-mtd@lists.infradead.org; Tue, 13 Mar 2012 18:46:43 +0000
Message-ID: <4F5F87E6.7010301@newsguy.com>
Date: Tue, 13 Mar 2012 10:46:14 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 0/4] MTD: Change meaning of -EUCLEAN return code on reads
References: <1331500873-9792-1-git-send-email-mikedunn@newsguy.com>
 <1331640228.3595.19.camel@sauron.fi.intel.com>
In-Reply-To: <1331640228.3595.19.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Ivan Djelic <ivan.djelic@parrot.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks for having a look Artem.

On 03/13/2012 05:03 AM, Artem Bityutskiy wrote:
>> (1) The element 'ecc_strength' is added to struct mtd_info, which will store the
>>     maximum number of bit errors that can be corrected in one writesize region.
> 
> I think this attribute should be exported via sysfs as R/O.


Do you think bitflip_threshold and/or ecc_strength should be accessible through
mtdchar ioctls as well?


>> (3) The element 'euclean_threshold' is added to struct mtd_info.  If the driver
>>     leaves this uninitialized, mtd sets it to ecc_strength when the device or
>>     partition is registered.  This element is also exposed for reading and
>>     writing from userspace through sysfs.
> 
> Would you please rename it to bitflip_threshold. It is bearable when it
> is just a  'struct mtd_info' member, but you also export
> 'euclean_threshold' sysfs file which is really confusing from user
> perspective, I think.


OK, maybe bitflip is the better choice.


>> So basically, the meaning of -EUCLEAN is changed from "one or more bit errors
>> were corrected over the entire read operation", to "a dangerously high number of
>> bit errors were corrected on one or more writesize regions".  By default,
>> "dangerously high" is interpreted as the maximum number of correctible bit
>> errors per writesize.  Drivers can specify a different value, and the user can
>> override it if more or less caution regarding data integrity is desired.
> 
> Please, make sure we have a good comment like this in the mtd.h file as
> well. I think the one you added is not verbose enough.


OK.  Usually I have the opposite problem - comments too verbose!


>> Patch #2 touches a lot of files, but they are small changes in most cases.  If
>> you can verify the correctness of the device's ecc strength, an ACK would be
>> much appreciated!
> 
> I'd be pro-active and just CC'ed maintainers/possibly relevant people.
> scripts/get_maintainer.pl would give you the ones, I think. Just spend a
> little time and come up with a list of people and CC them.


I actually did do this, and git-send-email kept rejecting it because of "too
many recipients" or some such.  After several iterations of trying to
intelligently whittle down the CC list and getting the same result, I got
frustrated and just CC'd Ivan.  (Hope you don't mind, Ivan :) Anyone know how
many recipients git allows?

I'll forward patch #2 along with a polite request for review to the original CC
list using my regular email client.  I'll also start putting together new
patches that address your comments.

Thanks again,
Mike
