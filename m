Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SDZQ8-0004W0-J6
 for linux-mtd@lists.infradead.org; Fri, 30 Mar 2012 10:51:05 +0000
Received: by pbcun4 with SMTP id un4so1693266pbc.36
 for <linux-mtd@lists.infradead.org>; Fri, 30 Mar 2012 03:51:02 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 30 Mar 2012 11:51:02 +0100
Message-ID: <CAFbHwiTfaXOFX-WYWeyisK4WCiXBRv_LpEcoR=v8qvsLAO7FJQ@mail.gmail.com>
Subject: Oops with mtd_dataflash driver in 3.3
From: Will Newton <will.newton@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I'm seeing an oops in mtd_dataflash.c with Linux 3.3. What appears to
be happening is that otp_select_filemode calls mtd_read_fact_prot_reg
with -1 for offset and length and a NULL buffer to test if OTP
operations are supported. This finds its way down to otp_read in
mtd_dataflash.c and causes an oops when memcpying the returned data
into the NULL buf.

None of the checks in otp_read catches the negative length and offset.
Changing the length of the dummy read to 0 prevents the oops, but I'm
not sure if it is the preferred solution. Would this change be
acceptable?

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 50c6a1e..853744d 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -369,7 +369,7 @@ static int otp_select_filemode(struct
mtd_file_info *mfi, int mode)
         * Make a fake call to mtd_read_fact_prot_reg() to check if OTP
         * operations are supported.
         */
-       if (mtd_read_fact_prot_reg(mtd, -1, -1, &retlen, NULL) == -EOPNOTSUPP)
+       if (mtd_read_fact_prot_reg(mtd, -1, 0, &retlen, NULL) == -EOPNOTSUPP)
                return -EOPNOTSUPP;

        switch (mode) {

Thanks,
