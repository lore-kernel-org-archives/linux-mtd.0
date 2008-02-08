Received: from rv-out-0910.google.com ([209.85.198.185])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JNQXg-0003t3-Df
	for linux-mtd@lists.infradead.org; Fri, 08 Feb 2008 10:33:18 +0000
Received: by rv-out-0910.google.com with SMTP id c24so4349039rvf.42
	for <linux-mtd@lists.infradead.org>;
	Fri, 08 Feb 2008 02:33:04 -0800 (PST)
Message-ID: <47AC2F9B.60009@gmail.com>
Date: Fri, 08 Feb 2008 16:01:55 +0530
From: Max Stirling <vicky.irobot@gmail.com>
MIME-Version: 1.0
To: Sergei Sharonov <sergei.sharonov@halliburton.com>
Subject: Re: mtdblock mount issue
References: <47A71EF4.2090202@gmail.com>
	<loom.20080207T155530-907@post.gmane.org>
In-Reply-To: <loom.20080207T155530-907@post.gmane.org>
Content-Type: multipart/mixed; boundary="------------050000080004040503080108"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------050000080004040503080108
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Sergei Sharonov wrote:
>> I am trying to mount a cramfs partition from flash. 
>>     
>
> A word of warning. CRAMFS is broken in kernels < 2.6.18. As far as I can tell,
> under heavy load (e.g. reading multiple files in parallel that are not cached)
> it may fail with decompression errors. I think the issue is not exactly with
> cramfs but with some interaction with page cache. Backporting just cramfs files
> to 2.6.15 did not help. If you have drop_caches interface (kernel > 2.6.16 or
> just backport it) it is easy to reproduce. Otherwise it happens _very_
> infrequently because most of the time files are already cached. However the
> consequences are severe - corrupted executables, etc.
> Here is a script to reproduce the problem:
>
> ===============================================
> # Copy large file from cramfs to tmpfs
> cp /bin/smbd /tmp/
>
> # First concurrent access to files/directories 
> while [ 1 ]; do cat /bin/* > /dev/null; done &
>
> # Second concurrent access to test file and cache flush
> for((i=0;i<99999;i++)) do echo -n "cycle=$i "; 
>   cmp /bin/smbd /tmp/smbd ; 
>   echo 3 > /proc/sys/vm/drop_caches ; 
> done
> ===============================================
>
> Note that /bin is in cramfs. smbd can be any large file.
> I've also seen statements that drop_caches interface is not 100% reliable.
> Nevertheless I have experienced decompression errors even without forcing 
> cache purge.
> Above script has caused failures on PowerPC/2.6.16 and ARM9/2.6.15.
> 2.6.18 and 2.6.23 seem ok.
>
> Regards,
>
> Sergei 
>
> P.S. Yes, cramfs has little to do with MTD but since ppl here use it with flash
> I felt it was a good idea to post this warning.
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>   
thanks for the info. I think I will check out squashfs then.

But before that I wanted to fix the issue that I am seeing. There might 
be something wrong in my implementation?

BTW I thought this was the right mailing list, since I am trying to 
mount cramfs image using MTD. Can you point me to the right mailing list?


--------------050000080004040503080108
Content-Type: text/x-vcard; charset=utf-8;
 name="vicky_irobot.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="vicky_irobot.vcf"

begin:vcard
fn:M S
n:S;M
version:2.1
end:vcard


--------------050000080004040503080108--
