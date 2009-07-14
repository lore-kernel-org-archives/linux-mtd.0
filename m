Received: from an-out-0708.google.com ([209.85.132.250])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MQiwn-0001XK-LT
	for linux-mtd@lists.infradead.org; Tue, 14 Jul 2009 14:25:40 +0000
Received: by an-out-0708.google.com with SMTP id c38so1750032ana.27
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Jul 2009 07:25:32 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 14 Jul 2009 19:55:32 +0530
Message-ID: <9bde694e0907140725t66f5361dlc10c511081462eb2@mail.gmail.com>
Subject: open command fails in UBIFS when pass O_DIRECT Flag
From: naveen yadav <yad.naveen@gmail.com>
To: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I am using UBIFS file system, and i am able to read/write.
But when i use O_DIRECT flag it fails in open command. will you pls
let me know is it issue with UBIFS.
If i use jffs2 or other file system there is no problem.

Here is my test program

#define _GNU_SOURCE
#include <stdio.h>
#include <fcntl.h>
#include <sys/stat.h>

int main()
{
int w_fd=0;
if ((w_fd = open("temp.tmp", O_RDWR | O_CREAT |O_DIRECT , 0666)) < 0)
        {

                perror("fopen");

                return 0;
        }


}

Best Regards
Naveen
