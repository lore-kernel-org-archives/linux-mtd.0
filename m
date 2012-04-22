Received: from zose-mta15.web4all.fr ([176.31.217.11])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SLzU4-0007Is-VV
 for linux-mtd@lists.infradead.org; Sun, 22 Apr 2012 16:18:01 +0000
Message-ID: <4F942F27.2090807@tribudubois.net>
Date: Sun, 22 Apr 2012 18:17:43 +0200
From: Jean-Christophe DUBOIS <jcd@tribudubois.net>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] [JFFS2] check xattr data integrity during the scan.
References: <1334175816-20688-1-git-send-email-jcd@tribudubois.net>
 <1335100558.28267.11.camel@brekeke>
In-Reply-To: <1335100558.28267.11.camel@brekeke>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 22/04/2012 15:15, Artem Bityutskiy wrote:
> On Wed, 2012-04-11 at 22:23 +0200, Jean-Christophe DUBOIS wrote:
>> If the system was powered off while JFFS2 was creating or moving
>> (GC) an extended attribute node, it might happen at next reboot
>> that the node CRC is OK but the data (name and value) might be
>> incomplete and therefore corrupted.
>>
>> During the mount scan we need to check the xattr data integrity to
>> weed out bad ones and keep good ones (whith an earlier version).
>>
>> Whitout this check the xattr data integrity problem was detected
>> a lot later and was not cured automatically (-EIO was returned).
>>
>> Signed-off-by: Jean-Christophe DUBOIS<jcd@tribudubois.net>
>> ---
> AFAIR, the whole idea of having 2 CRC checksums in JFFS2 nodes is to
> speed up scanning. E.g., if we hit an inode node, we check only
> "node_crc" to validate the "metadata", insert the inode to the in-memory
> data structures, and read the next node. We do not check the data CRC
> (data_crc), otherwise scanning would be much slower. If the data are
> corrupted, we notice this later, wen reading it.
>
> The same is done for xattrs - during scanning we do not check the data
> payload.
In case of attributes, JFFS2 do detect that they are corrupted later but 
it is too late. At that time we have lost reference to earlier 
"versions" of the attribute and I think we would need to rescan the all 
partition to find it back (assuming it has not been deleted in the mean 
time as I am not sure how GC deals with earlier versions of the 
attributes). So it seems better to do it in the first place.

You also have to consider that attributes are generally "short" (unlike 
the file content) and there is not much data associated to them. so the 
overhead implied by the attribute data scanning is not very important 
(considering the attribute data is already in memory). But it is true 
that there is an overhead added by this patch.

What happen for now is that if an attribute is corrupted, then we will 
not be able to ever read it again (JFFS2 returns a negative/recoverable 
error on corruption detection on any access and does not try to cure the 
problem). JFFS2 will not be able to recover an earlier version of the 
attribute if one exists and we are basically stuck. The only way to 
recover for now seems to be to delete the file associated to the 
attribute and then recreate both the file and the attribute. I don't 
think it is a very desirable behavior especially on an embedded system 
(the main target for JFFS2) where I would like the file system to 
recover by itself if possible.

So if any of you thinks it is possible to get back to an earlier 
"version" of the attribute past the scan time so that JFFS2 can recover 
from corrupted attributes I might try implementing this instead (but I 
would appreciate some initial hints). But for now I am not sure how to 
do it with the actual code.
>
> I do not say this is ideal design, but it is how it is. So I do not
> think your patch should be merged.
This patch allows JFFS2 to recover from corrupted attributes (at least 
in my test case). This might be at the expense of a slight overhead at 
scan time but for my system (embedded system with no admin console) this 
is a trade off I am happy to consider for now as I don't have an 
alternate solution and I need to use attribute.

BTW I am wondering what would happen if a "security attribute" (SElinux, 
IMA, ...) was getting corrupted. It seems to me the result would be 
quite annoying.
