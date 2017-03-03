Received: from lgeamrelo13.lge.com ([156.147.23.53])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cjkc0-0001In-FN
 for linux-mtd@lists.infradead.org; Fri, 03 Mar 2017 10:39:02 +0000
Message-ID: <58B947A9.5020007@gmail.com>
Date: Fri, 03 Mar 2017 19:38:33 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>
CC: kernel-team@lge.com, Artem Bityutskiy <dedekind1@gmail.com>,
 adrian.hunter@intel.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Hyunchul Lee <cheol.lee@lge.com>
Subject: Re: [PATCH] ubifs: add CONFIG_UBIFS_FS_SECURITY to disable/enable
 security labels
References: <1488527043-7195-1-git-send-email-hyc.lee@gmail.com>
 <e1ee0413-9c20-b511-5cb8-453e4b0c107a@nod.at>
In-Reply-To: <e1ee0413-9c20-b511-5cb8-453e4b0c107a@nod.at>
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

Hi, Richard

On 03/03/2017 04:56 PM, Richard Weinberger wrote:
> Hyunchul Lee,
> 
> Am 03.03.2017 um 08:44 schrieb Hyunchul Lee:
>> From: Hyunchul Lee <cheol.lee@lge.com>
>>
>> When write syscall is called, every time security label is searched to
>> determine that file's privileges should be changed.
>> If LSM(Linux Security Model) is not used, this is useless.
>>
>> So introduce CONFIG_UBIFS_SECURITY to disable security labels. it's default
>> value is "y".
> 
> Can you please explain what the benefit is and why UBIFS needs this (and why not
> all other filesystems)?
> I guess some performance issue, do you have numbers?

no, i don't have issues and profile result. but, every time when i write
4KB blocks, ubifs_xattr_get is called with "security.capabilties" for
each 4KB write.  so i think that it is useless if LSM isn't used.

<7>[92028.334484] xattr_get:610: UBIFS DBG gen (pid 25746): xattr 'capability', ino 70 ('rand_5'), buf size 0
<7>[92028.334485] ubifs_lookup_level0:1183: UBIFS DBG tnc (pid 25746): search key (70, xentry, 0x10888ae6)
<7>[92028.334486] ubifs_lookup_level0:1221: UBIFS DBG tnc (pid 25746): found 0, lvl 0, n 6 

and some file system such as ext4 and f2fs have a kernel config to               
disable security labels. (EXT4_FS_SECURITY, F2FS_FS_SECURITY)

> 
> Thanks,
> //richard
> 

Thanks,
Hyunchul
