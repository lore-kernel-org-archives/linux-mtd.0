Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZoM3c-0005Ul-Rb
 for linux-mtd@lists.infradead.org; Tue, 20 Oct 2015 01:49:46 +0000
Message-ID: <56259C0A.6020201@cn.fujitsu.com>
Date: Tue, 20 Oct 2015 09:42:34 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v2 3/3] mtd: tests: introduce a erase test
References: <20150930002958.GC143959@google.com>
 <1443574881-12319-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1443574881-12319-4-git-send-email-yangds.fnst@cn.fujitsu.com>
 <20151020011813.GD13239@google.com> <20151020012028.GE13239@google.com>
In-Reply-To: <20151020012028.GE13239@google.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/20/2015 09:20 AM, Brian Norris wrote:
> On Mon, Oct 19, 2015 at 06:18:13PM -0700, Brian Norris wrote:
>> + others
>
> really +others this time!
>
>> On Wed, Sep 30, 2015 at 09:01:21AM +0800, Dongsheng Yang wrote:
>>> This test will test the below cases.
>>>
[...]
>>> +
>>> +MODULE_DESCRIPTION("Erase test module");
>>> +MODULE_AUTHOR("Dongsheng Yang");
>>> +MODULE_LICENSE("GPL");
>>
>> Overall, I'm not sure if this test is really that useful. It does a few
>> sanity checks on the API, but it doesn't really test the erase function
>> itself. If anyone else thinks this test is interesting though, I suppose
>> there's not much harm in putting it into mtd-utils tests/.

Yes, I found the erase problem about mtdram in my debugging. Then
I was wondering why we did not find it by running mtd/tests. Finally
I found there is no testing about it in mtd/tests. So write one and
send it out here.

As you said, it's much more proper to put them in mtd-utils. I am
totally agree with that. would port it to userspace.

Thanx
Yang
>>
>> Brian
> .
>
