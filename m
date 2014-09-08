Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XQvzl-00007d-GB
 for linux-mtd@lists.infradead.org; Mon, 08 Sep 2014 10:16:26 +0000
Message-ID: <540D81E2.5010203@nod.at>
Date: Mon, 08 Sep 2014 12:16:02 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com, jean-philippe francois <jp.francois@cynove.com>
Subject: Re: Ubi patch proposition for 3.10.y
References: <CAGGh5h0KjexqaoEt8vvVXAEqCr625675XG4d71KdEuhrQVPr3w@mail.gmail.com>
 <1410170318.10764.119.camel@sauron.fi.intel.com>
In-Reply-To: <1410170318.10764.119.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 stable@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 08.09.2014 11:58, schrieb Artem Bityutskiy:
> On Fri, 2014-08-29 at 14:26 +0200, jean-philippe francois wrote:
>> Hi,
>>
>> I think commit 4b3e0a25... [1] (UBI: Call scan_all() with correct
>> offset in error case) should be added to 3.10.y stable branch.
> 
> This is the "fastmap" fix, and fastmap is called experimental. We do not
> have enough confidence it is production ready. Specifically, I'd like to
> hear someone doing extensive power-cut testing with this feature. The
> power-cut tolerance is one of the "selling features" of UBI/UBIFS, after
> all.
> 
> Therefore I never added fastmap fixes to the stable queue.
> 
> But if someone is willing to put all the fastmap fixes together, add the
> "stable tags" with the right kernel version "markings", and test for few
> older kernels, then I will recommend them to be included to the stable.
> Although I am not sure the stable maintainers would like accept them.

I'll take care of that from now on.

Thanks,
//richard
