Received: from [164.164.83.132] (helo=arianne.in.ishoni.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16MaAT-0003u5-00
	for <linux-mtd@lists.infradead.org>; Fri, 04 Jan 2002 19:38:17 +0000
Received: from leonoid.in.ishoni.com (leonoid.in.ishoni.com [192.168.1.12])
	by arianne.in.ishoni.com (8.11.6/8.11.4/Ishonir2) with ESMTP id g04JnHe09430
	for <linux-mtd@lists.infradead.org>; Sat, 5 Jan 2002 01:19:17 +0530
Message-ID: <AEBCF149D99ED5118F1C0002A519EA30C54EFE@leonoid.in.ishoni.com>
From: Sanjay Kumar <sanjayk@ishoni.com>
To: "'Geoffrey Espin'" <espin@idiom.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>,
   "'Vipin Malik'" <Vipin.Malik@daniel.com>,
   "'David Woodhouse'"
	 <dwmw2@infradead.org>
Subject: RE: linux-mtd digest, Vol 1 #323 - 3 msgs
Date: Sat, 5 Jan 2002 01:21:24 +0530 
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01C19559.30C2B820"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01C19559.30C2B820
Content-Type: text/plain;
	charset="iso-8859-1"

Thanks Geoffrey. It solved my problem. 
Sanjay


-----Original Message-----
From: Geoffrey Espin [mailto:espin@idiom.com]
Sent: Friday, January 04, 2002 10:21 PM
To: linux-mtd@lists.infradead.org
Subject: Re: linux-mtd digest, Vol 1 #323 - 3 msgs


> From: "Sanjay Kumar" <sankumar96@lycos.com>
> Subject: Problem in changing  the starting location of JFFS2 for AMD flash
> I am using AMD flash of 4M size and keeping starting 1/2 MB for RAW data.
Then for the remaining I want to use JFFS2. That is JFF2 will start from 0.5
MB to 4MB. For that I am making changes in super.c of JFFS2 for function
jffs2_read_super. The changes are -    
> c->free_size = c->mtd->size - jffs2_start_addr;
> c->flash_size = c->mtd->size - jffs2_start_addr;
> c->nr_blocks = c->flash_size / c->sector_size;
> c->blocks[i].offset = i * c->sector_size + jffs2_start_addr;
> where am keeping jffs2_start_addr = 0x80000.
> I am using linux 2.4.2.
> Now I am able to mount the jffs2 file system and able to create a empty
file.
> But when I go for writing into the created empty file, it is crashing.

As someone already has replied, don't mess with sources like super.c.

In linux/.config, have these options on:

    CONFIG_MTD=y
    CONFIG_MTD_PARTITIONS=y
    CONFIG_MTD_CHAR=y
    CONFIG_MTD_BLOCK=y
    CONFIG_MTD_<myboard>=y

Under linux/drivers/mtd/maps/ you must create your myboard-flash.c
(and add to Makefile), which has the partition table in it, e.g.:

    #define WINDOW_ADDR 0xbfc00000  /* default 4M part */
    #define WINDOW_SIZE 0x00400000
    ...
    static struct mtd_partition myboard_partitions[] = {
	    {
		    name: "bootstrap and kernel",
		    size: WINDOW_SIZE / 4,  /* 0.5M */
		    offset: 0,
	    },{
		    name: "filesystem",
		    size: MTDPART_SIZ_FULL, /* 2M */
		    offset: MTDPART_OFS_APPEND,
	    }
    };

Then from shell you can:

    # mtd_debug erase /dev/mtd/0 ${OFFSET} ${SIZE}   # 0 is entire device
    # cp empty.jffs2 /dev/mtd/2                      # 2 is second partition
    # mount -t jffs2 /dev/mtdblock/2 /mnt

Where 'empty.jffs2' is a stub file created by mkfs.jffs2,
and OFFSET & SIZE are whatever boundaries you've setup.

You might need to drop in later mtd files into 2.4.2.

Geoff
-- 
Geoffrey Espin
espin@idiom.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

------_=_NextPart_000_01C19559.30C2B820
Content-Type: application/ms-tnef
Content-Transfer-Encoding: base64

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
CAAAAFNBTkpBWUsAAwAZQAAAAAADAP0/5AQAAAMAgBD/////AgFHAAEAAAAvAAAAYz1VUzthPSA7
cD1pc2hvbmk7bD1MRU9OT0lELTAyMDEwNDE5NTEyNFotNjQ2MQAAAgH5PwEAAABOAAAAAAAAANyn
QMjAQhAatLkIACsv4YIBAAAAAAAAAC9PPUlTSE9OSS9PVT1JU0hPTklJTkRJQS9DTj1SRUNJUElF
TlRTL0NOPVNBTkpBWUsAAAAeAPg/AQAAAA0AAABTYW5qYXkgS3VtYXIAAAAAHgA4QAEAAAAIAAAA
U0FOSkFZSwACAfs/AQAAAE4AAAAAAAAA3KdAyMBCEBq0uQgAKy/hggEAAAAAAAAAL089SVNIT05J
L09VPUlTSE9OSUlORElBL0NOPVJFQ0lQSUVOVFMvQ049U0FOSkFZSwAAAB4A+j8BAAAADQAAAFNh
bmpheSBLdW1hcgAAAAAeADlAAQAAAAgAAABTQU5KQVlLAEAABzC6bCWtWJXBAUAACDCwvbQ1WZXB
AR4APQABAAAABQAAAFJFOiAAAAAAHgAdDgEAAAAmAAAAbGludXgtbXRkIGRpZ2VzdCwgVm9sIDEg
IzMyMyAtIDMgbXNncwAAAB4ANRABAAAAPwAAADxBRUJDRjE0OUQ5OUVENTExOEYxQzAwMDJBNTE5
RUEzMEM1NEVGRUBsZW9ub2lkLmluLmlzaG9uaS5jb20+AAALACkAAAAAAAsAIwAAAAAAAwAGEBfu
IcEDAAcQ0wYAAAMAEBAAAAAAAwAREAAAAAAeAAgQAQAAAGUAAABUSEFOS1NHRU9GRlJFWUlUU09M
VkVETVlQUk9CTEVNU0FOSkFZLS0tLS1PUklHSU5BTE1FU1NBR0UtLS0tLUZST006R0VPRkZSRVlF
U1BJTk1BSUxUTzpFU1BJTkBJRElPTUNPAAAAAAIBfwABAAAAPwAAADxBRUJDRjE0OUQ5OUVENTEx
OEYxQzAwMDJBNTE5RUEzMEM1NEVGRUBsZW9ub2lkLmluLmlzaG9uaS5jb20+AAC9cQ==

------_=_NextPart_000_01C19559.30C2B820--
