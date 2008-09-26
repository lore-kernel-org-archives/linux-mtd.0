Received: from rn-out-0910.google.com ([64.233.170.190])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kj1C3-0000Au-U2
	for linux-mtd@lists.infradead.org; Fri, 26 Sep 2008 00:28:24 +0000
Received: by rn-out-0910.google.com with SMTP id m7so307743rnd.3
	for <linux-mtd@lists.infradead.org>;
	Thu, 25 Sep 2008 17:28:23 -0700 (PDT)
Message-ID: <9c9fda240809251728u71366888s9cf81b4eac99472d@mail.gmail.com>
Date: Fri, 26 Sep 2008 09:28:22 +0900
From: "Kyungmin Park" <kmpark@infradead.org>
Sender: kyungmin78@gmail.com
To: apgmoorthy <moorthy.apg@samsung.com>
Subject: Re: [PATCH] [MTD-UTILS] Add support for 4KB page flash devices
In-Reply-To: <000001c91d6f$238a6ea0$3dd66c6b@sisodomain.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <33142758.53091221828088797.JavaMail.weblogic@epml16>
	<9c9fda240809212322h4d9ac26eqfd7c3cfb9630c97b@mail.gmail.com>
	<000001c91d6f$238a6ea0$3dd66c6b@sisodomain.com>
Cc: linux-mtd@lists.infradead.org, David.Woodhouse@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>     I find not much issue with that, but still as a fair practice , I'll
> absorb your comment in the patch. Have done the memory allocation later in
> the function to avoid unnecessary freeing code.
>     And malloced with mtdInfo.writesize instead of constants , let us know
> your comments.
>
> We can now use these utilities on 4KB devices.
>
> Signed-off-by: Rohit Hagargundgi <h.rohit@samsung.com>
> ---

Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

>  }
> --- a/include/mtd/mtd-abi.h     2008-09-23 15:36:26.000000000 +0530
> +++ b/include/mtd/mtd-abi.h     2008-09-23 15:48:48.000000000 +0530
> @@ -104,7 +104,7 @@ struct nand_oobinfo {
>        uint32_t useecc;
>        uint32_t eccbytes;
>        uint32_t oobfree[8][2];
> -       uint32_t eccpos[32];
> +       uint32_t eccpos[128];
>  };
>
>  struct nand_oobfree {
> @@ -119,7 +119,7 @@ struct nand_oobfree {
>  */
>  struct nand_ecclayout {
>        uint32_t eccbytes;
> -       uint32_t eccpos[64];
> +       uint32_t eccpos[128];
>        uint32_t oobavail;
>        struct nand_oobfree oobfree[MTD_MAX_OOBFREE_ENTRIES];
>  };
>
>
>
>
>
> -----Original Message-----
> From: kyungmin78@gmail.com [mailto:kyungmin78@gmail.com] On Behalf Of
> Kyungmin Park
> Sent: Monday, September 22, 2008 11:53 AM
> To: moorthy.apg@samsung.com
> Cc: linux-mtd@lists.infradead.org; David.Woodhouse@intel.com
> Subject: Re: [PATCH] [MTD-UTILS] Add support for 4KB page flash devices
>
> Hi,
>
> On Fri, Sep 19, 2008 at 9:41 PM, AYYANARPONNUSAMY GANGHEYAMOORTHY
> <moorthy.apg@samsung.com> wrote:
>> We can now use these utilities on 4KB devices.
>>
>> Signed-off-by: Rohit Hagargundgi <h.rohit@samsung.com>
>> ---
>> --- a/flash_otp_write.c 2008-06-27 21:51:28.000000000 +0530
>> +++ b/flash_otp_write.c 2008-07-01 16:04:12.000000000 +0530
>> @@ -18,7 +18,7 @@ int main(int argc,char *argv[])
>>        int fd, val, ret, size, wrote, len;
>>        mtd_info_t mtdInfo;
>>        off_t offset;
>> -       char *p, buf[2048];
>> +       char *p, buf[4096];
>>
>
> Is it no problem the stack overflow in application?
> How about to use malloc & free?
>
> Thank you,
> Kyungmin Park
>
>
