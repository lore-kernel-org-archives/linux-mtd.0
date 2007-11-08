Received: from nz-out-0506.google.com ([64.233.162.236])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1Iq9nh-0007FX-4U
	for linux-mtd@lists.infradead.org; Thu, 08 Nov 2007 11:00:19 -0500
Received: by nz-out-0506.google.com with SMTP id z3so170696nzf
	for <linux-mtd@lists.infradead.org>;
	Thu, 08 Nov 2007 08:00:11 -0800 (PST)
Message-ID: <ad7e75d70711080800q33da2128ga94ed0af22d05821@mail.gmail.com>
Date: Thu, 8 Nov 2007 18:00:09 +0200
From: navigator.atreides@gmail.com
To: linux-mtd@lists.infradead.org
Subject: user space utility to count NAND bad block
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I want to count number of the bad blocks on the nand device, so being
inspired by ~/mtd/util/flash_eraseall.c I use follow call

int ret = ioctl(fd, MEMGETBADBLOCK, &offset);

as badness measure for block ( if (ret > 0) ).

Could you please point me out if I'm in the right direction?

Thank you in advance!
Valentine R.

p.s. scratch code is below



int main(int argc, char *argv[])
{
    int md_fd;
    int iNumOfBadBlocks = 0;
    mtd_info_t  mtd_meminfo;

    ...

    // open & get meminfo for "/dev/mtd4"
    if ((md_fd = open(mtd_device, O_RDONLY)) < 0) {
        printf("\n\n%s: %s: %s\n", exe_name, mtd4_device, strerror(errno));
        exit(1);
    }

    if (ioctl(md_fd, MEMGETINFO, &mtd_meminfo) != 0) {
        printf("\n\n%s: %s: unable to get MTD device info\n",
exe_name, mtd4_device);
        exit(1);
    }
    iNumOfBadBlocks = get_bb_number( md_fd, mtd_meminfo);
    printf("Number of the bad blocks is %d\n", iNumOfBadBlocks);
    return 0;
}

 int get_bb_number(int fd, const mtd_info_t *meminfo)
{
    int isNAND = meminfo->type == MTD_NANDFLASH ? 1 : 0;
    int ibbCounter = 0;
    erase_info_t erase;
    erase.length = meminfo->erasesize;

    for (erase.start = 0;
         erase.start < meminfo->size;
         erase.start += meminfo->erasesize)
    {

        loff_t offset = erase.start;
        int ret = ioctl(fd, MEMGETBADBLOCK, &offset);
        if (ret > 0)
        {
            ibbCounter++;
            continue;
        }
        else if (ret < 0)
        {
            if (errno == EOPNOTSUPP)
            {
                if (isNAND)
                {
                    printf("\n\n%s: %s: Bad block check not
available\n", exe_name, mtd4_device);
                    exit(1);
                }
            }
            else
            {
                printf("\n%s: %s: MTD get bad block failed: %s\n",
exe_name, mtd4_device, strerror(errno));
                exit(1);
            }
        }
    }

    return ibbCounter;
}
