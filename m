Received: from mail2.megatrends.com ([155.229.80.16]
	helo=atl-ms1.megatrends.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BG9Il-0006JK-9A
	for linux-mtd@lists.infradead.org; Wed, 21 Apr 2004 05:25:35 +0100
Message-ID: <8CCBDD5583C50E4196F012E79439B45C04C9A3B8@atl-ms1.megatrends.com>
From: Vinesh Christopher <vineshc@ami.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Wed, 21 Apr 2004 00:25:53 -0400
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01C42758.BBEB6CB0"
cc: "'dave.jiang@intel.com'" <dave.jiang@intel.com>
cc: "'dsaxena@mvista.com'" <dsaxena@mvista.com>
Subject: MTD - Reboot parser Fix
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01C42758.BBEB6CB0
Content-Type: text/plain

Reboot FIS parser in mtd in kernel 2.6.5 has a bug. 
The parsing routine assumes that all the used Fis entries are 
contiguous and a Fis entry with 0xFF at first byte terminates 
the parsing.

Attached is a fixed source file from 2.6.5. Line 87 "break" 
changed to "continue"

-----------------------------------------------------------------
 Here is the actual scenario where the problem happens
 
 a) Initial FIS directory has 
 	Redboot
 	Redboot Config
 	FIS Directory
 	
 	Reboot and Linux MTD shows 3
 
 b) I added a new FIS entry called Install
 	Reboot and Linux MTD shows 4
 
 c) I added two more entry called zImage and initrd
 	Redboot and Linux MTD shows 6
 
 d) Deleted Install entry
 	Redboot shows 5, but Linux MTD shows 3 (Redboot, Config and FIS)
 
 What happened is in the fis directory, the 4th entry is now 
 "0xFF"nstall - 'I' of Install is replaced by 0xFF to denote it is not 
 used. Redboot MTD parser sees this and thinks it is end of FIS entries 
 and breaks out of the parse loop.
 

 Vinesh	



------_=_NextPart_000_01C42758.BBEB6CB0
Content-Type: application/octet-stream;
	name="redboot.c"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="redboot.c"

/*=0A=
 * $Id: redboot.c,v 1.11 2003/05/21 10:39:26 dwmw2 Exp $=0A=
 *=0A=
 * Parse RedBoot-style Flash Image System (FIS) tables and=0A=
 * produce a Linux partition array to match.=0A=
 */=0A=
=0A=
#include <linux/kernel.h>=0A=
#include <linux/slab.h>=0A=
#include <linux/init.h>=0A=
=0A=
#include <linux/mtd/mtd.h>=0A=
#include <linux/mtd/partitions.h>=0A=
=0A=
struct fis_image_desc {=0A=
    unsigned char name[16];      // Null terminated name=0A=
    unsigned long flash_base;    // Address within FLASH of image=0A=
    unsigned long mem_base;      // Address in memory where it =
executes=0A=
    unsigned long size;          // Length of image=0A=
    unsigned long entry_point;   // Execution entry point=0A=
    unsigned long data_length;   // Length of actual data=0A=
    unsigned char _pad[256-(16+7*sizeof(unsigned long))];=0A=
    unsigned long desc_cksum;    // Checksum over image descriptor=0A=
    unsigned long file_cksum;    // Checksum over image data=0A=
};=0A=
=0A=
struct fis_list {=0A=
	struct fis_image_desc *img;=0A=
	struct fis_list *next;=0A=
};=0A=
=0A=
static inline int redboot_checksum(struct fis_image_desc *img)=0A=
{=0A=
	/* RedBoot doesn't actually write the desc_cksum field yet AFAICT =
*/=0A=
	return 1;=0A=
}=0A=
=0A=
static int parse_redboot_partitions(struct mtd_info *master, =0A=
                             struct mtd_partition **pparts,=0A=
                             unsigned long fis_origin)=0A=
{=0A=
	int nrparts =3D 0;=0A=
	struct fis_image_desc *buf;=0A=
	struct mtd_partition *parts;=0A=
	struct fis_list *fl =3D NULL, *tmp_fl;=0A=
	int ret, i;=0A=
	size_t retlen;=0A=
	char *names;=0A=
	char *nullname;=0A=
	int namelen =3D 0;=0A=
	static char nullstring[] =3D "unallocated";=0A=
=0A=
	buf =3D kmalloc(PAGE_SIZE, GFP_KERNEL);=0A=
=0A=
	if (!buf)=0A=
		return -ENOMEM;=0A=
=0A=
	/* Read the start of the last erase block */=0A=
	ret =3D master->read(master, master->size - master->erasesize,=0A=
			   PAGE_SIZE, &retlen, (void *)buf);=0A=
=0A=
	if (ret)=0A=
		goto out;=0A=
=0A=
	if (retlen !=3D PAGE_SIZE) {=0A=
		ret =3D -EIO;=0A=
		goto out;=0A=
	}=0A=
=0A=
	/* RedBoot image could appear in any of the first three slots */=0A=
	for (i =3D 0; i < 3; i++) {=0A=
		if (!memcmp(buf[i].name, "RedBoot", 8))=0A=
			break;=0A=
	}=0A=
	if (i =3D=3D 3) {=0A=
		/* Didn't find it */=0A=
		printk(KERN_NOTICE "No RedBoot partition table detected in %s\n",=0A=
		       master->name);=0A=
		ret =3D 0;=0A=
		goto out;=0A=
	}=0A=
=0A=
	for (i =3D 0; i < PAGE_SIZE / sizeof(struct fis_image_desc); i++) {=0A=
		struct fis_list *new_fl, **prev;=0A=
=0A=
		if (buf[i].name[0] =3D=3D 0xff)=0A=
//			break;	=0A=
			continue;	/* Skip this unused fis entry */				if =
(!redboot_checksum(&buf[i]))=0A=
			break;=0A=
=0A=
		new_fl =3D kmalloc(sizeof(struct fis_list), GFP_KERNEL);=0A=
		namelen +=3D strlen(buf[i].name)+1;=0A=
		if (!new_fl) {=0A=
			ret =3D -ENOMEM;=0A=
			goto out;=0A=
		}=0A=
		new_fl->img =3D &buf[i];=0A=
                if (fis_origin) {=0A=
                        buf[i].flash_base -=3D fis_origin;=0A=
                } else {=0A=
                        buf[i].flash_base &=3D master->size-1;=0A=
                }=0A=
=0A=
		/* I'm sure the JFFS2 code has done me permanent damage.=0A=
		 * I now think the following is _normal_=0A=
		 */=0A=
		prev =3D &fl;=0A=
		while(*prev && (*prev)->img->flash_base < new_fl->img->flash_base)=0A=
			prev =3D &(*prev)->next;=0A=
		new_fl->next =3D *prev;=0A=
		*prev =3D new_fl;=0A=
=0A=
		nrparts++;=0A=
	}=0A=
	if (fl->img->flash_base)=0A=
		nrparts++;=0A=
=0A=
	for (tmp_fl =3D fl; tmp_fl->next; tmp_fl =3D tmp_fl->next) {=0A=
		if (tmp_fl->img->flash_base + tmp_fl->img->size + master->erasesize < =
tmp_fl->next->img->flash_base)=0A=
			nrparts++;=0A=
	}=0A=
	parts =3D kmalloc(sizeof(*parts)*nrparts + sizeof(nullstring) + =
namelen, GFP_KERNEL);=0A=
=0A=
	if (!parts) {=0A=
		ret =3D -ENOMEM;=0A=
		goto out;=0A=
	}=0A=
=0A=
	memset(parts, 0, sizeof(*parts)*nrparts + namelen);=0A=
=0A=
	/* FIXME: Include nullname only if it's used */=0A=
	nullname =3D (char *)&parts[nrparts];=0A=
	sprintf(nullname, nullstring);=0A=
	names =3D nullname + sizeof(nullstring);=0A=
=0A=
	i=3D0;=0A=
=0A=
	if (fl->img->flash_base) {=0A=
	       parts[0].name =3D nullname;=0A=
	       parts[0].size =3D fl->img->flash_base;=0A=
	       parts[0].offset =3D 0;=0A=
	}=0A=
	for ( ; i<nrparts; i++) {=0A=
		parts[i].size =3D fl->img->size;=0A=
		parts[i].offset =3D fl->img->flash_base;=0A=
		parts[i].name =3D names;=0A=
=0A=
		strcpy(names, fl->img->name);=0A=
		names +=3D strlen(names)+1;=0A=
=0A=
		if(fl->next && fl->img->flash_base + fl->img->size + =
master->erasesize < fl->next->img->flash_base) {=0A=
			i++;=0A=
			parts[i].offset =3D parts[i-1].size + parts[i-1].offset;=0A=
			parts[i].size =3D fl->next->img->flash_base - parts[i].offset;=0A=
			parts[i].name =3D nullname;=0A=
		}=0A=
		tmp_fl =3D fl;=0A=
		fl =3D fl->next;=0A=
		kfree(tmp_fl);=0A=
	}=0A=
	ret =3D nrparts;=0A=
	*pparts =3D parts;=0A=
 out:=0A=
	while (fl) {=0A=
		struct fis_list *old =3D fl;=0A=
		fl =3D fl->next;=0A=
		kfree(old);=0A=
	}=0A=
	kfree(buf);=0A=
	return ret;=0A=
}=0A=
=0A=
static struct mtd_part_parser redboot_parser =3D {=0A=
	.owner =3D THIS_MODULE,=0A=
	.parse_fn =3D parse_redboot_partitions,=0A=
	.name =3D "RedBoot",=0A=
};=0A=
=0A=
static int __init redboot_parser_init(void)=0A=
{=0A=
	return register_mtd_parser(&redboot_parser);=0A=
}=0A=
=0A=
static void __exit redboot_parser_exit(void)=0A=
{=0A=
	deregister_mtd_parser(&redboot_parser);=0A=
}=0A=
=0A=
module_init(redboot_parser_init);=0A=
module_exit(redboot_parser_exit);=0A=
=0A=
MODULE_LICENSE("GPL");=0A=
MODULE_AUTHOR("Red Hat, Inc. - David Woodhouse =
<dwmw2@cambridge.redhat.com>");=0A=
MODULE_DESCRIPTION("Parsing code for RedBoot Flash Image System (FIS) =
tables");=0A=

------_=_NextPart_000_01C42758.BBEB6CB0--
