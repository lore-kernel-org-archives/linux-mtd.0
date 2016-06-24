Received: from mail-it0-x244.google.com ([2607:f8b0:4001:c0b::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bGYI9-0002W9-CH
 for linux-mtd@lists.infradead.org; Fri, 24 Jun 2016 21:05:34 +0000
Received: by mail-it0-x244.google.com with SMTP id y93so3862761ita.0
 for <linux-mtd@lists.infradead.org>; Fri, 24 Jun 2016 14:05:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5694616.oYyysJP9uD@wuerfel>
References: <1466382443-11063-1-git-send-email-deepa.kernel@gmail.com>
 <1466382443-11063-8-git-send-email-deepa.kernel@gmail.com>
 <5694616.oYyysJP9uD@wuerfel>
From: Deepa Dinamani <deepa.kernel@gmail.com>
Date: Fri, 24 Jun 2016 14:05:11 -0700
Message-ID: <CABeXuvqieDuioh7xBEpVhMGGYhRpdgswdjWd7nBZdRagftUHkA@mail.gmail.com>
Subject: Re: [PATCH v2 07/24] fs: ubifs: Replace CURRENT_TIME_SEC with
 current_time
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>, "Theodore Ts'o" <tytso@mit.edu>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 y2038 Mailman List <y2038@lists.linaro.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> @@ -84,6 +84,8 @@ static int create_default_filesystem(struct ubifs_info *c)
>>         int min_leb_cnt = UBIFS_MIN_LEB_CNT;
>>         long long tmp64, main_bytes;
>>         __le64 tmp_le64;
>> +       __le32 tmp_le32;
>> +       struct timespec ts;
>>
>>         /* Some functions called from here depend on the @c->key_len filed */
>>         c->key_len = UBIFS_SK_LEN;
>> @@ -297,13 +299,17 @@ static int create_default_filesystem(struct ubifs_info *c)
>>         ino->ch.node_type = UBIFS_INO_NODE;
>>         ino->creat_sqnum = cpu_to_le64(++c->max_sqnum);
>>         ino->nlink = cpu_to_le32(2);
>> -       tmp_le64 = cpu_to_le64(CURRENT_TIME_SEC.tv_sec);
>> +
>> +       ktime_get_real_ts(&ts);
>> +       ts = timespec_trunc(ts, DEFAULT_TIME_GRAN);
>> +       tmp_le64 = cpu_to_le64(ts.tv_sec);
>>         ino->atime_sec   = tmp_le64;
>>         ino->ctime_sec   = tmp_le64;
>>         ino->mtime_sec   = tmp_le64;
>> -       ino->atime_nsec  = 0;
>> -       ino->ctime_nsec  = 0;
>> -       ino->mtime_nsec  = 0;
>> +       tmp_le32 = cpu_to_le32(ts.tv_nsec);
>> +       ino->atime_nsec  = tmp_le32;
>> +       ino->ctime_nsec  = tmp_le32;
>> +       ino->mtime_nsec  = tmp_le32;
>
> This part of the patch seems independent of the rest, as you don't actually
> use current_time() here, or assign the timespec to an inode.
>
> I'd suggest either leaving this part out of the patch series for now,
> or making it a separate patch that uses timespec64 directly.

This is actually the root inode which is created and written to disk.
We actually want to use current_time() here, but this is not cached.
So we don't have a vfs inode.

struct ubifs_ino_node represents inode format on the disk.
I thought it would be odd to fill this with timespec64 only here.
My plan was to switch it over to timespec64 when all of ubifs changes
to use timespec64.
This also was helping the current series as it let me delete
CURRENT_TIME macros.
I can add a comment to suggest this in code.

But, what you suggest should also work fine since the on disk
representation is big enough to use timespec64 already.
Let me know if you want me to drop this change for now as we delete
CURRENT_TIME macros after rc1 now.

-Deepa
