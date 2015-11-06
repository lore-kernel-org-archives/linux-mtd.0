Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZudH7-0005n3-EM
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2015 09:25:38 +0000
Subject: Re: [PATCH v6] ubifs: introduce UBIFS_ATIME_SUPPORT to ubifs
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, dedekind1@gmail.com
References: <1440126626-18446-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <56101FC5.6090900@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <563C71F7.9050004@nod.at>
Date: Fri, 6 Nov 2015 10:25:11 +0100
MIME-Version: 1.0
In-Reply-To: <56101FC5.6090900@nod.at>
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

Am 03.10.2015 um 20:34 schrieb Richard Weinberger:
> Am 21.08.2015 um 05:10 schrieb Dongsheng Yang:
>> To make ubifs support atime flexily, this commit introduces
>> a Kconfig option named as UBIFS_ATIME_SUPPORT.
>>
>> With UBIFS_ATIME_SUPPORT=n:
>> 	ubifs keeps the full compatibility to no_atime from
>> the start of ubifs.
>> =================UBIFS_ATIME_SUPPORT=n=======================
>> -o - no atime
>> -o atime - no atime
>> -o noatime - no atime
>> -o relatime - no atime
>> -o strictatime - no atime
>> -o lazyatime - no atime
>>
>> With UBIFS_ATIME_SUPPORT=y:
>> 	ubifs supports the atime same with other main stream
>> file systems.
>> =================UBIFS_ATIME_SUPPORT=y=======================
>> -o - default behavior (relatime currently)
>> -o atime - atime support
>> -o noatime - no atime support
>> -o relatime - relative atime support
>> -o strictatime - strict atime support
>> -o lazyatime - lazy atime support
>>
>> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
>> ---
>> 	-v2:
>> 		implement update_time for ubifs
>> 	-v3:
>> 		Oops, forgot to assign update_time for
>> 		ubifs_dir_inode_operations.
>> 	-v4:
>> 		drop the patch to change 'Y' to 'N' in
>> 		Kconfig
>> 	-v5:
>> 		simplify the warning in atime supporting
>> 	-v6:
>> 		* replace ubifs_warn with ubifs_msg
>> 		* rewrite the messages in Kconfig as Artem suggested
>> 		* remove S_VERSION related code
>>  fs/ubifs/Kconfig | 15 +++++++++++++++
>>  fs/ubifs/dir.c   |  3 +++
>>  fs/ubifs/file.c  | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>>  fs/ubifs/super.c | 12 ++++++++++--
>>  fs/ubifs/ubifs.h |  1 +
>>  5 files changed, 77 insertions(+), 2 deletions(-)
>>
>> diff --git a/fs/ubifs/Kconfig b/fs/ubifs/Kconfig
>> index ba66d50..7ff7712 100644
>> --- a/fs/ubifs/Kconfig
>> +++ b/fs/ubifs/Kconfig
>> @@ -35,3 +35,18 @@ config UBIFS_FS_ZLIB
>>  	default y
>>  	help
>>  	  Zlib compresses better than LZO but it is slower. Say 'Y' if unsure.
>> +
>> +config UBIFS_ATIME_SUPPORT
>> +	bool "Access time support" if UBIFS_FS
>> +	depends on UBIFS_FS
>> +	default n
>> +	help
>> +	  Originally UBIFS did not support atime, because it looked like a bad idea due
>> +	  increased flash wear. This option adds atime support and it is disabled by default
>> +	  to preserve the old behavior. If you enable this option, UBIFS starts updating atime,
>> +	  which means that file-system read operations will cause writes (inode atime
>> +	  updates). This may affect file-system performance and increase flash device wear,
>> +	  so be careful. How often atime is updated depends on the selected strategy:
>> +	  strictatime is the "heavy", relatime is "lighter", etc.
>> +
>> +	  If unsure, say 'N'
>> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
>> index 27060fc..8d93427 100644
>> --- a/fs/ubifs/dir.c
>> +++ b/fs/ubifs/dir.c
>> @@ -1187,6 +1187,9 @@ const struct inode_operations ubifs_dir_inode_operations = {
>>  	.getxattr    = ubifs_getxattr,
>>  	.listxattr   = ubifs_listxattr,
>>  	.removexattr = ubifs_removexattr,
>> +#ifdef CONFIG_UBIFS_ATIME_SUPPORT
>> +	.update_time = ubifs_update_time,
>> +#endif
>>  };
>>  
>>  const struct file_operations ubifs_dir_operations = {
>> diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
>> index 35efc10..423ce6b 100644
>> --- a/fs/ubifs/file.c
>> +++ b/fs/ubifs/file.c
>> @@ -1364,6 +1364,45 @@ static inline int mctime_update_needed(const struct inode *inode,
>>  }
>>  
>>  /**
>> + * ubifs_update_time - update time of inode.
>> + * @inode: inode to update
>> + *
>> + * This function updates time of the inode.
>> + */
>> +int ubifs_update_time(struct inode *inode, struct timespec *time,
>> +			     int flags)
> 
> This function should be under an "#ifdef CONFIG_UBIFS_ATIME_SUPPORT".
> 
> Beside of that,
> Reviewed-by: Richard Weinberger <richard@nod.at>
> 
> I think we can queue it for v4.4. Artem, what do you think?

Yang, ping?
Artem and I would like to have this in v4.4.

Thanks,
//richard
