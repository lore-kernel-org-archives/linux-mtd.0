Received: from relay01.pair.com ([209.68.5.15])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JXjME-0006CZ-37
	for linux-mtd@lists.infradead.org; Fri, 07 Mar 2008 20:39:58 +0000
Date: Fri, 07 Mar 2008 12:39:46 -0800
Subject: Re: Creating an Empty JFFS2 File System
From: Grant Erickson <gerickson@nuovations.com>
To: Josh Boyer <jwboyer@gmail.com>
Message-ID: <C3F6E812.DD80%gerickson@nuovations.com>
In-Reply-To: <20080307123701.55c3ebf8@weaponx>
Mime-version: 1.0
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3/7/08 10:37 AM, Josh Boyer wrote:
> On Fri, 07 Mar 2008 09:55:13 -0800
> Grant Erickson <gerickson@nuovations.com> wrote:
>> Is creating an empty JFFS2 file system supported or is this a deprecated
>> capability? The following steps seem to be incorrect or failing:
>> 
>>     # flash_eraseall -q -j /dev/mtd9
>>     # mount -t jffs2 /dev/mtdblock9 /mnt
>>     Cowardly refusing to erase blocks on filesystem with no valid JFFS2
>>     nodes
>>     empty_blocks 0, bad_blocks 0, c->nr_blocks 3840
>> 
>> Or, is the only way to accomplish this to create a NULL JFFS2 image with
>> mkfs.jffs2 and then nandwrite it?
> 
> Just erase it completely without the -j option and mount.  JFFS2 will go
> through and erase them all again and add the cleanmarkers itself.

Josh:

That technique is a no-go as well:

    # flash_eraseall -q /dev/mtd8
    # mount -t jffs2 /dev/mtdblock8 /mnt
    Cowardly refusing to erase blocks on filesystem with no valid JFFS2
    nodes
    empty_blocks 0, bad_blocks 0, c->nr_blocks 3840
    mount: mounting /dev/mtdblock8 on /mnt failed: Input/output error

Regards,

Grant
