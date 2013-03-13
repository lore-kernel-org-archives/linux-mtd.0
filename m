Received: from mercuryimc.plus.com ([80.229.200.144]
 helo=centos1.newflow.co.uk)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UFjkm-0007dt-7Z
 for linux-mtd@lists.infradead.org; Wed, 13 Mar 2013 11:21:52 +0000
Message-ID: <5140614D.2060102@mimc.co.uk>
Date: Wed, 13 Mar 2013 11:21:49 +0000
From: Mark Jackson <mpfj-list@mimc.co.uk>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: MTD : Kernel oops when remounting ubifs as read/write
References: <5134CEF9.5070502@mimc.co.uk>
 <1363087506.3348.62.camel@sauron.fi.intel.com> <51405F3A.3090901@mimc.co.uk>
 <1363173638.11441.24.camel@sauron.fi.intel.com>
In-Reply-To: <1363173638.11441.24.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, adrian.hunter@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 13/03/13 11:20, Artem Bityutskiy wrote:
> On Wed, 2013-03-13 at 11:12 +0000, Mark Jackson wrote:
>>> -	if (c->space_fixup) {
>>> -		err = ubifs_fixup_free_space(c);
>>> -		if (err)
>>> -			goto out;
>>> -	}
>>> -
>>>  	mutex_unlock(&c->umount_mutex);
>>>  	return err;
>>>
>>
>> Sorry ... this just locks up the unit.
> 
> Am I right that to reproduce it I need any image with the 'fixup' flag
> set, then I should put it on the flash, mount it R/O and then remount
> R/W. Right?
> 

Yes ... this is on a custom AM335x board, where the ubi image must be created
with the "-F" flag.

Cheers
Mark J.
