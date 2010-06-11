Received: from mail.windriver.com ([147.11.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1ON1PP-0005dT-Ve
	for linux-mtd@lists.infradead.org; Fri, 11 Jun 2010 10:24:20 +0000
Message-ID: <4C121198.5030807@windriver.com>
Date: Fri, 11 Jun 2010 18:36:08 +0800
From: "stanley.miao" <stanley.miao@windriver.com>
MIME-Version: 1.0
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Subject: Re: [PATCH 2/3] Discard the legacy interface MEMGETOOBSEL
	in	flash_eraseall
References: <1276248975-1822-1-git-send-email-stanley.miao@windriver.com>	<1276248975-1822-2-git-send-email-stanley.miao@windriver.com>
	<1276248975-1822-3-git-send-email-stanley.miao@windriver.com>
	<OFDBEF7A42.BA0205E8-ONC125773F.0034F62C-C125773F.00358229@LocalDomain>
	<OF17604B8E.95B0C75E-ONC125773F.00361B51-C125773F.00365BD5@transmode.se>
In-Reply-To: <OF17604B8E.95B0C75E-ONC125773F.00361B51-C125773F.00365BD5@transmode.se>
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Artem.Bityutskiy@nokia.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Joakim Tjernlund wrote:
> Joakim Tjernlund/Transmode wrote on 2010/06/11 11:44:27:
>   
>>> The "struct nand_oobinfo" is able to record only 32 ECC code positions,which
>>> is not enough for many big NAND chips. Therefore, this structure is replaced
>>> by "struct nand_ecclayout" in linux kernel from the version 2.6.17.
>>> Consequently, the ioctl command changed from MEMGETOOBSEL to ECCGETLAYOUT.
>>>
>>> Now update flash_eraseall to use the new ioctl command ECCGETLAYOUT. In order
>>> to keep compatible with the old linux kernel, a linux version detection
>>> function is added.
>>>
>>> Signed-off-by: Stanley.Miao <stanley.miao@windriver.com>
>>> ---
>>>  flash_eraseall.c |   71 ++++++++++++++++++++++++++++++++----------------------
>>>  1 files changed, 42 insertions(+), 29 deletions(-)
>>>
>>> diff --git a/flash_eraseall.c b/flash_eraseall.c
>>> index a22fc49..4e2108b 100644
>>> --- a/flash_eraseall.c
>>> +++ b/flash_eraseall.c
>>> @@ -43,6 +43,8 @@
>>>  #define PROGRAM "flash_eraseall"
>>>  #define VERSION "$Revision: 1.22 $"
>>>
>>> +#define LINUX_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + (c))
>>> +
>>>  static const char *exe_name;
>>>  static const char *mtd_device;
>>>  static int quiet;      /* true -- don't output progress */
>>> @@ -55,6 +57,21 @@ static void display_version (void);
>>>  static struct jffs2_unknown_node cleanmarker;
>>>  int target_endian = __BYTE_ORDER;
>>>
>>> +static int get_linux_version(void)
>>> +{
>>> +   FILE *fd;
>>> +   int a = 0, b = 0, c = 0;
>>> +
>>> +   fd = fopen("/proc/version", "r");
>>> +   if (fd) {
>>> +      fscanf(fd, "Linux version %d.%d.%d", &a, &b, &c);
>>> +      fclose(fd);
>>> +   }
>>> +
>>> +   return LINUX_VERSION(a, b, c);
>>> +}
>>> +
>>> +
>>>       
>> The fopen could fail and if it does, I think you should default to "assume
>> latest kernel"
>> Same goes for fscanf, you should at least test the return value.
>>     

I am not sure what kernel version the proc file "version" began to exist.
If the fopen failed, it must be a old kernel, so I set the default to 
the old kernel.
It is the same with the current mtd-utils.

>
> Forgot, use uname(2) instead of /proc/version
>   

Why ?

> Does the above scanf work on "2.6.31-gentoo-r6"?
>   

I didn't do the test on all the platforms. Is there any reason that 
cause it not to work ?


Thanks
Stanley.
>   Jocke
>
>
>   
