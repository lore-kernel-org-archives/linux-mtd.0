Received: from wr-out-0506.google.com ([64.233.184.235])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HjEEB-0002oZ-GS
	for linux-mtd@lists.infradead.org; Wed, 02 May 2007 08:46:41 -0400
Received: by wr-out-0506.google.com with SMTP id 55so116407wri
	for <linux-mtd@lists.infradead.org>;
	Wed, 02 May 2007 05:46:36 -0700 (PDT)
Message-ID: <e4ef6e860705020546t77a8350ds6a9eda7c66d4cc46@mail.gmail.com>
Date: Wed, 2 May 2007 18:16:32 +0530
From: MarkUrs <mark.urs@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Erase suspend operation for S29GL256N
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

Hi,

I'm working on S29GL256N on a MIPS 4Kec board on Linux 2.6.10, with
JFFS2 on the flash as root FS.
The flash is not working with the normal driver, but we have to do the
dq7 data checking for it work. With that  we are getting CRC error on
the FS
mount (first pass only) and on debugging the cause of the issue seems
to be the chip_ready() functionality in the get_chip function in
FL_ERASE state and for FL_READY mode.


2_6_10-tip/drivers/mtd/chips/cfi_cmdset_0002.c
<SNIPPED>

      case FL_ERASING:
              if (mode == FL_WRITING) /* FIXME: Erase-suspend-program
appears broken. */
                      goto sleep;

              if (!(mode == FL_READY || mode == FL_POINT
                    || !cfip
                    || (mode == FL_WRITING && (cfip->EraseSuspend & 0x2))
                    || (mode == FL_WRITING && (cfip->EraseSuspend & 0x1))))
                      goto sleep;

              /* We could check to see if we're trying to access the sector
               * that is currently being erased. However, no user will try
               * anything like that so we just wait for the timeout. */

              /* Erase suspend */
              /* It's harmless to issue the Erase-Suspend and Erase-Resume
               * commands when the erase algorithm isn't in progress. */
              map_write(map, CMD(0xB0), chip->in_progress_block_addr);
              chip->oldstate = FL_ERASING;
              chip->state = FL_ERASE_SUSPENDING;
              chip->erase_suspended = 1;
              for (;;) {
                      if (chip_ready(map, adr))
                              break;
<SNIPPED>


It seems the issue is with the erase suspend mode checking is buggy
and will cause wrong data to read. So we are looking for a erase
suspend mode check with the Dq7, 5,2 data polling. Request if anybody
has tried this to share their experience.




-- 


Thanks and regards,
Mark
