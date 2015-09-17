Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZcQ0K-0000KC-IO
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2015 03:37:01 +0000
Message-ID: <55FA33CB.8060900@cn.fujitsu.com>
Date: Thu, 17 Sep 2015 11:30:19 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Jan Kara <jack@suse.cz>
CC: <viro@ZenIV.linux.org.uk>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>, <linux-mtd@lists.infradead.org>,
 <linux-fsdevel@vger.kernel.org>
Subject: Re: [PATCH v3 07/39] fs: char_dev: introduce cd_acquire function
 to acquire cdev
References: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1442307754-13233-8-git-send-email-yangds.fnst@cn.fujitsu.com>
 <20150916081648.GB13325@quack.suse.cz>
In-Reply-To: <20150916081648.GB13325@quack.suse.cz>
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

On 09/16/2015 04:16 PM, Jan Kara wrote:
> On Tue 15-09-15 17:02:02, Dongsheng Yang wrote:
>> cd_acquire() works like bd_acquire() to get cdev by an inode,
>> this commit is a preparation for lookup_cdev().
>>
>> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
>
> Two comments below.
>
>> ---
>>   fs/char_dev.c | 35 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 35 insertions(+)
>>
>> diff --git a/fs/char_dev.c b/fs/char_dev.c
>> index ea06a3d..e818faa 100644
>> --- a/fs/char_dev.c
>> +++ b/fs/char_dev.c
>> @@ -439,6 +439,41 @@ static int exact_lock(dev_t dev, void *data)
>>   	return cdev_get(p) ? 0 : -1;
>>   }
>>
>> +struct cdev *cd_acquire(struct inode *inode)
>> +{
>> +	struct cdev *cdev;
>> +	struct cdev *new = NULL;
>> +
>> +	spin_lock(&cdev_lock);
>> +	cdev = inode->i_cdev;
>> +	if (!cdev) {
>> +		struct kobject *kobj;
>> +		int idx;
>
> Empty line here please to separate variable declarations from the code.

Yes,
>
>> +		spin_unlock(&cdev_lock);
>> +		kobj = kobj_lookup(cdev_map, inode->i_rdev, &idx);
>> +		if (!kobj) {
>> +			cdev = NULL;
>> +			goto out;
>> +		}
>> +		new = container_of(kobj, struct cdev, kobj);
>> +		spin_lock(&cdev_lock);
>> +		/* Check i_cdev again in case somebody beat us to it while
>> +		   we dropped the lock. */
>> +		cdev = inode->i_cdev;
>> +		if (!cdev) {
>> +			inode->i_cdev = cdev = new;
>> +			list_add(&inode->i_devices, &cdev->list);
>> +		}
>
> I think you need to put 'new' in case you didn't use it, don't you?

Oh, yes, I forgot it. will update it.

Thanx
Yang
>
>> +	}
>> +
>> +	if (!cdev_get(cdev))
>> +		cdev = NULL;
>> +	spin_unlock(&cdev_lock);
>> +
>> +out:
>> +	return cdev;
>> +}
>> +
>>   /**
>>    * cdev_add() - add a char device to the system
>>    * @p: the cdev structure for the device
>
> 								Honza
>
