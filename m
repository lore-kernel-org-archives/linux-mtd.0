Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zv0pp-0006E3-QA
 for linux-mtd@lists.infradead.org; Sat, 07 Nov 2015 10:35:03 +0000
Subject: Re: [PATCH v4] ubifs: make ubifs_[get|set]xattr atomic
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, dedekind1@gmail.com
References: <1439872716-4810-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1439887431.31419.110.camel@gmail.com> <563D7FB8.60600@cn.fujitsu.com>
Cc: linux-mtd@lists.infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <563DD3B8.3080908@nod.at>
Date: Sat, 7 Nov 2015 11:34:32 +0100
MIME-Version: 1.0
In-Reply-To: <563D7FB8.60600@cn.fujitsu.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 07.11.2015 um 05:36 schrieb Dongsheng Yang:
> On 08/18/2015 04:43 PM, Artem Bityutskiy wrote:
>> On Tue, 2015-08-18 at 12:38 +0800, Dongsheng Yang wrote:
>>> This commit make the ubifs_[get|set]xattr protected by ui_mutex.
>>>
>>> Originally, there is a possibility that ubifs_getxattr to get
>>> a wrong value.
>>>
>>>    P1                                  P2
>>> ----------                      ----------
>>> ubifs_getxattr                      ubifs_setxattr
>>>                     - kfree()
>>> - memcpy()
>>>                     - kmemdup()
>>>
>>> Then ubifs_getxattr() would get a non-sense data. To solve this
>>> problem, this commit make the xattr of ubifs_inode updated in
>>> atomic.
>>
>> Picked this one, thanks!
> 
> Hi Artem and Richard,
>     I did not find this one in linux-ubifs.git, is that
> planed for 4.4?

Hmm, it should. Artem, forgot to push?
Anyway, I've added it now to linux-ubifs.git master.

Thanks,
//richard
