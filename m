Received: from gateway.digitalview.com.hk
	([152.101.51.1] helo=janus.hk.panelx.com ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18UMGF-0003ZS-00
	for <linux-mtd@lists.infradead.org>; Fri, 03 Jan 2003 07:28:55 +0000
Message-ID: <000201c2b2fd$dc75c190$9000010a@paulwong>
From: "Paul Wong" <paul.wong@digitalview.com>
To: <linux-mtd@lists.infradead.org>
Subject: compile error when using MEMREADOOB in do_mounts.c.
Date: Fri, 3 Jan 2003 15:56:29 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: 7bit
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

Dear All,

    I modified the init/do_mounts.c to want to skip the invalid block. and
than make bzImage, that result say: undefined reference to 'ioctl'. What is
the problem?

Thank you.
best regards,
Paul

****** part of init/do_mounts.c *********

#include <linux/mtd/mtd.h>

static int __init fill_inbuf(void)
{
 static unsigned long curptr=0L;
 if (exit_code) return -1;

#if 1 // for mtd read and check valid block
{
 #define MTDBLOCKSIZE 16384
 unsigned char oobbuf[16];
 struct mtd_oob_buf oob;

 oob.length = 16;
 oob.ptr = (unsigned char*)&oobbuf;
 for (;(curptr%MTDBLOCKSIZE)==0;
  curptr =lseek(crd_infd,MTDBLOCKSIZE,1))
 {
  oob.start = curptr;
  if (ioctl(crd_infd, MEMREADOOB, &oob) != 0)
  {
    return  -1;
  }
  if (oobbuf[5] == 0xFF)
   break;
  }
}
#endif
 insize = read(crd_infd, inbuf, INBUFSIZ);

 if (insize == 0) return -1;
 curptr += insize;
 inptr = 1;

 return inbuf[0];
}
