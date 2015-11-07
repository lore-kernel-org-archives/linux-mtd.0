Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZuvLh-0000Cb-5M
 for linux-mtd@lists.infradead.org; Sat, 07 Nov 2015 04:43:33 +0000
Message-ID: <563D7FB8.60600@cn.fujitsu.com>
Date: Sat, 7 Nov 2015 12:36:08 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>, <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v4] ubifs: make ubifs_[get|set]xattr atomic
References: <1439872716-4810-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1439887431.31419.110.camel@gmail.com>
In-Reply-To: <1439887431.31419.110.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/18/2015 04:43 PM, Artem Bityutskiy wrote:
> On Tue, 2015-08-18 at 12:38 +0800, Dongsheng Yang wrote:
>> This commit make the ubifs_[get|set]xattr protected by ui_mutex.
>>
>> Originally, there is a possibility that ubifs_getxattr to get
>> a wrong value.
>>
>>    P1                                  P2
>> ----------                  	----------
>> ubifs_getxattr                      ubifs_setxattr
>> 					- kfree()
>> - memcpy()
>> 					- kmemdup()
>>
>> Then ubifs_getxattr() would get a non-sense data. To solve this
>> problem, this commit make the xattr of ubifs_inode updated in
>> atomic.
>
> Picked this one, thanks!

Hi Artem and Richard,
	I did not find this one in linux-ubifs.git, is that
planed for 4.4?

Yang

> .
>
