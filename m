Received: from fmr05.intel.com ([134.134.136.6] helo=hermes.jf.intel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1850G8-0004Yk-00
	for <linux-mtd@lists.infradead.org>; Fri, 25 Oct 2002 09:56:01 +0100
Received: from petasus.jf.intel.com (petasus.jf.intel.com [10.7.209.6])
	by hermes.jf.intel.com (8.11.6/8.11.6/d: outer.mc,v 1.51 2002/09/23 20:43:23 dmccart Exp $) with ESMTP id g9P9NYe24146
	for <linux-mtd@lists.infradead.org>; Fri, 25 Oct 2002 09:23:34 GMT
Received: from pdsmsxvs01.pd.intel.com (pdsmsxvs01.pd.intel.com [172.16.12.122])
	by petasus.jf.intel.com (8.11.6/8.11.6/d: inner.mc,v 1.27 2002/10/16 23:46:59 dmccart Exp $) with SMTP id g9P9MY729247
	for <linux-mtd@lists.infradead.org>; Fri, 25 Oct 2002 09:22:35 GMT
Message-ID: <957BD1C2BF3CD411B6C500A0C944CA2601499D5F@pdsmsx32.pd.intel.com>
From: "Yuan, Cain" <cain.yuan@intel.com>
To: "'dwmw2@infradead.org'" <dwmw2@infradead.org>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: New flash type support questions.
Date: Fri, 25 Oct 2002 17:23:31 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
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

Hi all,
	I am now work on a new flash. Normally   after reset  flash chips
will be in  "Read Array"  status but  this one is not. It is in  "Init
Status"  after powered on or reset, I must write an command to it  to let it
into "Read Array" status. unfortunatlly I can't find the support code in
MTD. 

In  function  static inline int do_read_onechip(struct map_info *map, struct
flchip *chip, loff_t adr, size_t len, u_char *buf)
{
    .......
    switch (chip->state) {
    case FL_ERASING:
      . . . . .
        cfi_write(map, CMD(0x70), cmd_addr);
        chip->oldstate = FL_ERASING;
        chip->state = FL_ERASE_SUSPENDING;

    case FL_READY:
        break;

    case FL_CFI_QUERY:
    case FL_JEDEC_QUERY:
        cfi_write(map, CMD(0x70), cmd_addr);
        chip->state = FL_STATUS;

  . . . . .
}

Since there is no   FL_INIT  status defined  and no code ready for this kind
of  status  I  think I  need to add an FL_INIT into
typedef enum {
    FL_READY,
    . . . . .
    FL_UNLOCKING,
    FL_UNKNOWN
} flstate_t;

Also I nned to add  some code like 

case   FL_INIT
	/*   procssing code */
	break;

to  those  functions such as do_read_onechip, do_write_oneword,etc.

Also I should  initially let  chip->state = FL_INIT  but I can't locate the
position where  chip->state are assigned.  would you please give me some
hints? 
Thanks a lot!


Best regards.

--Cain
