Received: from dd6426.kasserver.com ([85.13.131.52])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f3Seg-00015U-HU
 for linux-mtd@lists.infradead.org; Tue, 03 Apr 2018 20:35:48 +0000
Subject: Re: UBIFS - ubifs_get_pnode.part.4: error -22 reading pnode
To: richard.weinberger@gmail.com
References: <95F51F4B902CAC40AF459205F6322F01B80E921AE3@BMK019S01.emtrion.local>
 <CAFLxGvz=_x2NWhz_T_TqKc5JnRC+fGkD37daf+zks-pnyydMyw@mail.gmail.com>
 <s1l9q5oc97q87j6d75pkp49b.1522781343251@email.android.com>
Cc: linux-mtd@lists.infradead.org
From: Frank Erdrich <frank@erdrich.net>
Message-ID: <c3a2d38b-a789-81e6-bf3f-7a573778a054@erdrich.net>
Date: Tue, 3 Apr 2018 22:26:32 +0200
MIME-Version: 1.0
In-Reply-To: <s1l9q5oc97q87j6d75pkp49b.1522781343251@email.android.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Richard,

thanks for your quick response. And sorry for writing from another 
Mail-account, I hope that will not break the thread. Our setup at work 
is a little bit weird and I need an admin to send messages to a mailing 
list (disclaimer removal and stuff like that).

> Frank,
> 
> On Tue, Apr 3, 2018 at 10:28 AM, Erdrich, Frank
> <Frank.Erdrich@emtrion.de> wrote:
>  > Hello,
>  >
>  > we are encountering an error on UBIFS that prevents mounting of a 
> partition. Maybe one of you can tell me the directly the reason for that 
> or can help me hunting this error down.
> 
> UBIFS got confused wrt. free space accounting.
> Can you tell me more on your setup? Do you use Fastmap? fscrypt? xattr?

We use only extended attributes. fastmap and fscrypt are not used. That 
are the kernel options we have set:

CONFIG_MTD_UBI=y
CONFIG_MTD_UBI_WL_THRESHOLD=4096
CONFIG_MTD_UBI_BEB_LIMIT=20
# CONFIG_MTD_UBI_FASTMAP is not set
# CONFIG_MTD_UBI_GLUEBI is not set
# CONFIG_MTD_UBI_BLOCK is not set
CONFIG_UBIFS_FS=y
CONFIG_UBIFS_FS_ADVANCED_COMPR=y
CONFIG_UBIFS_FS_LZO=y
CONFIG_UBIFS_FS_ZLIB=y
# CONFIG_UBIFS_ATIME_SUPPORT is not set

The Flash itself is divided into three mtd partitions to get some sort 
of separation of critical data against other data. The partition that 
shows that error is a logging partition which is, of course, written on 
a regular base. We are not using the sync mount option at the moment. 
Writeback timers (for dirty data) are on default value.

>  > I'm not deep enough in the ubifs system to completely understand what 
> is happening here but for me it seems that there are more dirty data to 
> write than the size of the LEB.
>  > -> 3: free 507904 dirty 524128 flags 34 lnum 0
>  > I've seen that the values are checked in validate_pnode() where the 
> -EINVAL (-22) comes from. The question is, how can dirty data bigger 
> that the LEB size?
> 
> Yes, this can happen. That's why UBIFS does in some cases a fixup of
> the used/free numbers.
> These numbers are not always updated immediately and when a power-cut
> happens their state might be inconsistent.

I'm totally fine with that behaviour as a power-cut can happen anytime 
in an embedded system but I would assume that the ubifs-recovery would 
bring back the system to a operable state. Or is there an error in my 
reasoning?

Please let me know if you need more information or if I should do 
special testing.


Best regards,
Frank Erdrich
