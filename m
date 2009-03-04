Received: from mail-ew0-f172.google.com ([209.85.219.172])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lesrv-0005vC-L8
	for linux-mtd@lists.infradead.org; Wed, 04 Mar 2009 15:18:50 +0000
Received: by ewy20 with SMTP id 20so3081189ewy.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 04 Mar 2009 07:18:46 -0800 (PST)
Message-ID: <49AE9BD5.8000107@gmail.com>
Date: Wed, 04 Mar 2009 16:18:45 +0100
From: Roel Kluin <roel.kluin@gmail.com>
MIME-Version: 1.0
To: Adrian Hunter <adrian.hunter@nokia.com>
Subject: Re: [PATCH] onenand: test before subtraction on unsigned
References: <49AE8BA0.7060903@gmail.com> <49AE950C.60907@nokia.com>
In-Reply-To: <49AE950C.60907@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adrian Hunter wrote:
> Roel Kluin wrote:
>> len is unsigned so will wrap around when sizeof(struct otp_info) is
>> greater than
>> len.

>> -            len -= sizeof(struct otp_info);
>> -            if (len <= 0) {
>> +            if (len <= sizeof(struct otp_info)) {
>> +                len = 0;
> 
> len is not used anymore, so no need to set it to zero.

Right, updated patch below.

>>                  ret = -ENOSPC;
>>                  break;
>>              }
>> +            len -= sizeof(struct otp_info);

> So is there somewhere that is passing a buffer too small for all the
> opt_info?

I don't know, I found it by code inspection.
------------------------------>8-------------8<---------------------------------
len is unsigned so will wrap around when sizeof(struct otp_info) is greater than
len.

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 529af27..1219a18 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -2296,11 +2296,11 @@ static int onenand_otp_walk(struct mtd_info *mtd, loff_t from, size_t len,
 		if (!action) {	/* OTP Info functions */
 			struct otp_info *otpinfo;
 
-			len -= sizeof(struct otp_info);
-			if (len <= 0) {
+			if (len <= sizeof(struct otp_info)) {
 				ret = -ENOSPC;
 				break;
 			}
+			len -= sizeof(struct otp_info);
 
 			otpinfo = (struct otp_info *) buf;
 			otpinfo->start = from;
