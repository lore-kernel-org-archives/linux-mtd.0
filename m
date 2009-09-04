Received: from mail.bittware.com ([208.82.132.157]
	helo=olympus.corp.bittware.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MjeJU-0005C0-S2
	for linux-mtd@lists.infradead.org; Fri, 04 Sep 2009 19:19:17 +0000
Subject: MTD writes
From: Dennis McLeod <dmcleod@bittware.com>
To: linux-mtd@lists.infradead.org
Date: Fri, 04 Sep 2009 15:19:05 -0400
Message-Id: <1252091945.9490.22.camel@lusitania>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
        I am having trouble writing to flash through MTD. I am trying to
open /dev/mtd5 for reading/writing, seek to a given offset, write 4
bytes and then close. This same exact code worked on an older kernel
with the same exact flash chip, so I can't understand what I might have
done wrong. 

/> cat /proc/mtd
dev:    size   erasesize  name
mtd0: 08000000 00020000 "dummy"
mtd1: 08000000 00020000 "dummy1"
mtd2: 07700000 00020000 "rwfs"
mtd3: 08000000 00020000 "dummy2"
mtd4: 00800000 00020000 "kernel"
mtd5: 00100000 00020000 "cfg"
mtd6: 08000000 00020000 "dummy3"
mtd7: 08000000 00020000 "dummy4"
mtd8: 08000000 00020000 "dummy5"


/> ls -al /dev/mtd*
crw-r-----  1 0        0         90,   0  Nov 29 16:00 /dev/mtd0
crw-r-----  1 0        0         90,   2  Nov 29 16:00 /dev/mtd1
crw-r-----  1 0        0         90,   4  Nov 29 16:00 /dev/mtd2
crw-r-----  1 0        0         90,   6  Nov 29 16:00 /dev/mtd3
crw-r-----  1 0        0         90,   8  Nov 29 16:00 /dev/mtd4
crw-r-----  1 0        0         90,  10  Nov 29 16:00 /dev/mtd5
crw-r-----  1 0        0         90,  12  Nov 29 16:00 /dev/mtd6
crw-r-----  1 0        0         90,  14  Nov 29 16:00 /dev/mtd7
crw-r-----  1 0        0         90,  16  Nov 29 16:00 /dev/mtd8
crw-r-----  1 0        0         90,  18  Nov 29 16:00 /dev/mtd9
brw-r-----  1 0        0         31,   0  Nov 29 16:00 /dev/mtdblock0
brw-r-----  1 0        0         31,   1  Nov 29 16:00 /dev/mtdblock1
brw-r-----  1 0        0         31,   2  Nov 29 16:00 /dev/mtdblock2
brw-r-----  1 0        0         31,   3  Nov 29 16:00 /dev/mtdblock3
brw-r-----  1 0        0         31,   4  Nov 29 16:00 /dev/mtdblock4
brw-r-----  1 0        0         31,   5  Nov 29 16:00 /dev/mtdblock5
brw-r-----  1 0        0         31,   6  Nov 29 16:00 /dev/mtdblock6
brw-r-----  1 0        0         31,   7  Nov 29 16:00 /dev/mtdblock7
brw-r-----  1 0        0         31,   8  Nov 29 16:00 /dev/mtdblock8
brw-r-----  1 0        0         31,   9  Nov 29 16:00 /dev/mtdblock9


Here's the code: 

        FILE* f;
        int cfgdata[2];
        char* dev = "/dev/mtdblock5"; // "/dev/mtd5";
        if(f = fopen(dev, "wb")) // open config space
        {
                fseek(f,0x94,SEEK_SET);
                memset((void*)cfgdata, 0, 2 * sizeof(int));
                count = fread((void*)cfgdata, 2, sizeof(int), f);
                cfgdata[0] = 0x01234567; 
                cfgdata[1] = 0x89abcdef;                
                count = fseek(f,0x94,SEEK_SET);
                printf("fseek returned %d\n", count);
                count = fwrite((void*)cfgdata, sizeof(int), 2, f); 
                printf("fwrite returned %d\n", count);
                fclose(f);
        }
        else
        {
                perror( dev );
        }


If i set dev to "/dev/mtdblock5" (as it is above), fopen fails and
perror says "/dev/mtdblock5 : no such device or address".. 

If i set dev to "/dev/mtd5", fopen succeeds and my two printfs say: 
"fseek returned 0"
"fwrite returned 2"
and everything "appears" to have succeeded, but my changes are not
written. So peeking at dmesg, I see this line at the bottom: 
"MTD do_write_buffer(): software timeout"

Any suggestions? 


-  
=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
= Dennis McLeod                   =
= Software Engineer               =
= BittWare, Inc.                  =
= 603.226.0404 ext 514            =
=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
** BittWare Celebrates 20 Years Delivering COTS Signal Processing Solutions 1989 - 2009 **
