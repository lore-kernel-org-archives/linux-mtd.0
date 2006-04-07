Received: from mga03.intel.com ([143.182.124.21] helo=azsmga101-1.ch.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FRmET-0000HJ-8G
	for linux-mtd@lists.infradead.org; Fri, 07 Apr 2006 04:22:28 -0400
Message-ID: <4436211B.7020004@intel.com>
Date: Fri, 07 Apr 2006 12:21:47 +0400
From: Alexander Belyakov <alexander.belyakov@intel.com>
MIME-Version: 1.0
To: Sascha Hauer <s.hauer@pengutronix.de>
References: <20060406135055.BE6FA43AA1@ws5-1.us4.outblaze.com>	<200604070828.33546.h.schurig@mn-solutions.de>
	<20060407081220.GE10831@localhost.localdomain>
In-Reply-To: <20060407081220.GE10831@localhost.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Holger Schurig <h.schurig@mn-solutions.de>, linux-mtd@lists.infradead.org
Subject: Re: Problem of "JFFS2 summary"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sascha Hauer wrote:
> On Fri, Apr 07, 2006 at 08:28:33AM +0200, Holger Schurig wrote:
>   
>>> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at
>>> 0x00080000: 0x00b0 instead jffs2_scan_eraseblock(): Magic bitmask
>>> 0x1985 not found at 0x00080004: 0x00b0 instead
>>>       
>> I got similar problems with stock kernel 2.6.16.1 and sumtool from 
>> mtd-utils, CVSDATE 2006-02-23.
>>
>> After this, I thought "nice idea", recompiled my kernel without 
>> CONFIG_JFFS2_SUMMARY and flashed the normal jffs2 image to get a 
>> working system.
>>     
>
> Just for the sake of completeness: I too tried it yesterday with
> 2.6.16-git and sumtool from mtd cvs and got the same errors.
> Continued to work without summary support then.
>
> Sascha
>   

I came across the same problem with wrong magic bitmarks, CRC error and 
finally Kernel panic at rootfs mount time. I  used sumtool-processed 
rootfs image and recompiled kernel with CONFIG_JFFS2_SUMMARY enabled 
(MTD snapshot 20060315 on 2.6.15.6 kernel).

Brief code analysis showed that I do not understand some summary feature 
related code in jffs2_scan_eraseblock() function.

...
    if (!buf_size) {
        buf_len = c->sector_size;

        if (jffs2_sum_active()) {
            /* must reread because of summary test */
            err = jffs2_flash_read_safe(c, buf_ofs, buf_len, buf);
            if (err)
                return err;
        }

    }
...

Here jffs2_flash_read_safe() uses buffer (unsigned char *buf) to read 
to, despite pointer to that buffer has been assigned by point() function 
in jffs2_scan_medium() routine. Is this correct?

I have disabled that code and got my rootfs successfully mounted with 
JFFS2_SUMMARY enabled..

...
    if (!buf_size) {
        buf_len = c->sector_size;

#if 0
        if (jffs2_sum_active()) {
            /* must reread because of summary test */
            err = jffs2_flash_read_safe(c, buf_ofs, buf_len, buf);
            if (err)
                return err;
        }
#endif

    }
...

Probably someone who is in charge of JFFS2_SUMMARY feature can elaborate 
on this.

Regards,
Alexander Belyakov
