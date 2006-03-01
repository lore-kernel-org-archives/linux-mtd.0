Received: from petasus.ims.intel.com ([62.118.80.130])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FEVR5-000701-Rk
	for linux-mtd@lists.infradead.org; Wed, 01 Mar 2006 12:48:55 -0500
Received: from MSSMSXVS01.ccr.corp.intel.com (MSSMSXVS01.ccr.corp.intel.com
	[10.125.2.23])
	by petasus.ims.intel.com (8.12.9-20030918-01/8.12.10/d: small-solo.mc,
	v 1.2 2004/09/17 18:05:04 root Exp $) with SMTP id k21I32Sd029199
	for <linux-mtd@lists.infradead.org>; Wed, 1 Mar 2006 18:03:02 GMT
Received: from mssmsx331.ccr.corp.intel.com ([10.125.2.16])
	by MSSMSXVS01.ccr.corp.intel.com (SAVSMTP 3.1.7.47) with SMTP id
	M2006030120482119443
	for <linux-mtd@lists.infradead.org>; Wed, 01 Mar 2006 20:48:21 +0300
Message-ID: <4405DE64.4060807@intel.com>
Date: Wed, 01 Mar 2006 20:48:20 +0300
From: "Alexey, Korolev" <alexey.korolev@intel.com>
MIME-Version: 1.0
To: "Korolev, Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org
References: <F92C2EFE7C3BA745855BF7036E1F3F9A01A06023@NNSMSX401>
In-Reply-To: <F92C2EFE7C3BA745855BF7036E1F3F9A01A06023@NNSMSX401>
Content-Type: multipart/mixed; boundary="------------010804000606000401070906"
Cc: 
Subject: Re: [PATCH] cfi: Fixup of write errors on XIP
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------010804000606000401070906
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi all.

Several days ago I sent this patch to the list. I wonder has anybody 
complains about it?
I my opinion the patch shouldn't break anything. It just fixes up write 
errors I saw in our tests.
If you don't mind I will commit it.

Thanks,
Alexey

>  
> Here is fixup of issue I have seen on XIP configuration.
> Sometimes I received write errors with message "buffer write error
> (status timeout)" on test  which did read write and erase on several
> volumes at the same time.
>  
> I investigated the issue.
> The scenario of the issue is following:
>  
> 1. do_write_buffer
> 2. Waiting for write complete in xip_udelay
> 3. System Interrupt
> 4. Write suspend
> 5. Rescheduling
> 6. Block erasing by other process. ( This operation typically took
> rather long time )
> 7. Complete, rescheduling
> 8. Return to write (write is not complete due to suspend ).
> 9. Check timeout. Time is up.
> 10. Error.
>  
> I made small fixup for these issue. Please see patch below.
>


--------------010804000606000401070906
Content-Type: text/plain;
 name="XIP_wr_errors_fixup.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="XIP_wr_errors_fixup.diff"

--- c/drivers/mtd/chips/cfi_cmdset_0001.c	2006-02-22 20:58:05.869203280 +0300
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c	2006-02-22 20:55:42.272033368 +0300
@@ -1571,6 +1571,7 @@
 	/* GO GO GO */
 	map_write(map, CMD(0xd0), cmd_adr);
 	chip->state = FL_WRITING;
+	chip->write_suspended = 0;
 
 	INVALIDATE_CACHE_UDELAY(map, chip, cmd_adr,
 				adr, len,
@@ -1592,6 +1593,12 @@
 			continue;
 		}
 
+		/* Somebody suspended write. We should reset timeo. */
+		if (chip->write_suspended) {
+			chip->write_suspended = 0;
+			timeo = jiffies + (HZ/2);
+		}
+		
 		status = map_read(map, cmd_adr);
 		if (map_word_andequal(map, status, status_OK, status_OK))
 			break;

--------------010804000606000401070906--
