Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZOAp4-0004Yt-7O
 for linux-mtd@lists.infradead.org; Sat, 08 Aug 2015 20:34:31 +0000
Subject: Re: [PATCH v2] ubifs: make ubifs_[get|set]xattr atomic
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, dedekind1@gmail.com
References: <55BABB80.9080406@cn.fujitsu.com>
 <1438305123-31675-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <55BFCEA0.7080900@nod.at> <55C444EA.7090305@cn.fujitsu.com>
Cc: linux-mtd@lists.infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <55C667BB.2040204@nod.at>
Date: Sat, 8 Aug 2015 22:34:03 +0200
MIME-Version: 1.0
In-Reply-To: <55C444EA.7090305@cn.fujitsu.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 07.08.2015 um 07:40 schrieb Dongsheng Yang:
> On 08/04/2015 04:27 AM, Richard Weinberger wrote:
>> Am 31.07.2015 um 03:12 schrieb Dongsheng Yang:
>>> This commit make the ubifs_[get|set]xattr protected by ui_mutex.
>>>
>>> Originally, there is a possibility that ubifs_getxattr to get
>>> a wrong value.
>>>
>>>      P1                    P2
>>> ----------            ----------
>>> ubifs_getxattr            ubifs_setxattr
>>>                    - kfree()
>>>     - memcpy()
>>>                    - kmemdup()
>>>
>>> Then ubifs_getxattr() would get a non-sense data. To solve this
>>> problem, this commit make the xattr of ubifs_inode updated in
>>> atomic.
>>
>> so, ui->data needs protection?
>> The comment in fs/ubifs/ubifs.h does not mention ->data.
>> I'm asking because I want to make sure that ui_mutex is the correct lock to take.
> 
> ui->data needs protection for sure, as I show above.
> Without protection, there is a problem to get wrong value.
> 
> And yes, the comment does not mention the ->data. But
> I think ui_mutex is a good choice for it. And not all fields
> which is being protected by ui_mutex are listed in the comment,
> such as xattr_names and xattr_cnt.

Yeah. ;-\
The comment needs an update. In UBI and UBIFS we try hard to document our locking.
Will you do a patch or shall I?

Thanks,
//richard
