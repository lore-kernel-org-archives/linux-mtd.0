Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSaPp-0002UW-TQ
 for linux-mtd@lists.infradead.org; Fri, 21 Aug 2015 00:42:42 +0000
Message-ID: <55D67287.3000005@cn.fujitsu.com>
Date: Fri, 21 Aug 2015 08:36:23 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Dave Chinner <david@fromorbit.com>, =?ISO-8859-1?Q?Andreas_Gr=FCnba?=
 =?ISO-8859-1?Q?cher?= <andreas.gruenbacher@gmail.com>
CC: <fstests@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <richard.weinberger@gmail.com>
Subject: Re: [PATCH] fstests: link .out to correct output when we set
 USE_ATTR_SECURE=yes
References: <55D52473.7050209@cn.fujitsu.com>
 <1440032464-17626-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <CAHpGcMLZT5xYx5EUBLTPyLQd0f+jQ-g+c_f-oErsHP33m7-ROg@mail.gmail.com>
 <20150820210812.GO3902@dastard>
In-Reply-To: <20150820210812.GO3902@dastard>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/21/2015 05:08 AM, Dave Chinner wrote:
> On Thu, Aug 20, 2015 at 08:18:28AM +0200, Andreas Gr=FCnbacher wrote:
>> Dongsheng,
>>
>> 2015-08-20 3:01 GMT+02:00 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>:
>>>
>>> When we set USE_ATTR_SECURE to yes or no, the expected outputs of gener=
ic/062
>>> would be different. So we need to link the .out to different file.
>>
>> Can the tests for the different namespaces please be separated from
>> each other here (see below)?
>
> I certainly agree with this approach ;)
>
>>
>> diff --git a/tests/generic/062 b/tests/generic/062
>> index 194b638..9dd4498 100755
>> --- a/tests/generic/062
>> +++ b/tests/generic/062
>> @@ -142,6 +142,7 @@ for nsp in $ATTR_MODES; do
>>                  echo "*** final list (strings, type=3D$inode, nsp=3D$ns=
p)"
>>                  getfattr -m '.' -e hex $SCRATCH_MNT/$inode
>>
>> +               # FIXME: Remove all remaining xattrs
>>          done
>>   done
>>
>> Next, can the security namespace tests be put in their own test case
>> so that we don't need to switch between two different .out files? This
>> could be done by setting ATTR_MODES and then invoking
>> tests/generic/062 to avoid duplicating the entire test script.
>
> Just not the suggested mechanism :)
>
> We can't execute one test from another - that will lead to all sorts
> of bad juju occurring with results and timing and so on because they
> are all based on $0.  The correct way to do this is to factor the
> test internals into a common file, then wrap the common functions
> with a new test file.

Sounds good, thanx Dave and Andreas.

Yang
>
> e.g. see _test_generic_punch(), which started off as corner case
> testing the XFS_IOC_ZERORANGE ioctl in a single test, Then got
> extended to testing hole punching in a new test, then got factored
> into common functions in common/punch, and it is now called by 14
> different tests....
>
> Cheers,
>
> Dave.
>
