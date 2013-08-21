Received: from mail-pb0-x22b.google.com ([2607:f8b0:400e:c01::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VC4FD-00049g-GU
 for linux-mtd@lists.infradead.org; Wed, 21 Aug 2013 08:58:25 +0000
Received: by mail-pb0-f43.google.com with SMTP id md4so166543pbc.30
 for <linux-mtd@lists.infradead.org>; Wed, 21 Aug 2013 01:58:01 -0700 (PDT)
Date: Wed, 21 Aug 2013 01:57:58 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Wang Haitao <wang.haitao1@zte.com.cn>
Subject: Re: [PATCH]mtd: map: fixed bug in 64-bit systems
Message-ID: <20130821085758.GG31788@brian-ubuntu>
References: <5201f818.42ceb40a.21ae.ffffaa90SMTPIN_ADDED_BROKEN@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5201f818.42ceb40a.21ae.ffffaa90SMTPIN_ADDED_BROKEN@mx.google.com>
Cc: artem.bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Wang,

Can you please resend this patch with a few fixups?

The description below is good, but please wrap it to ~70 characters. It
is hard to read.

Also, you need to test your patch with scripts/checkpatch.pl both before
and after you email it -- all your whitespace is mangled (i.e., you use
spaces where there should be tabs).

See the kernel documentation:

  Documentation/SubmittingPatches
  Documentation/email-clients.txt

On Wed, Aug 07, 2013 at 03:34:20PM +0800, Wang Haitao wrote:
> Hardware：
>          CPU：XLP832,the 64-bit OS
>          NOR Flash:S29GL128S 128M
> Software:
>          Kernel:2.6.32.41
>          Filesystem:JFFS2
> 
> When writing files, errors appear:
>          Write len 182  but return retlen 180 
>          Write of 182 bytes at 0x072c815c failed. returned -5, retlen 180
>          Write len 186  but return retlen 184 
>          Write of 186 bytes at 0x072caff4 failed. returned -5, retlen 184 
> These errors exist only in 64-bit systems,not in 32-bit systems. After analysis, we found that the left shift operation is wrong in map_word_load_partial. For instance：
>          unsigned char buf[3] ={0x9e,0x3a,0xea};
>          map_bankwidth(map) is 4;
> 
>          for (i=0; i < 3; i++) {
>                    int bitpos;
>                    bitpos = (map_bankwidth(map)-1-i)*8;
>                    orig.x[0] &= ~(0xff << bitpos);
>                    orig.x[0] |= buf[i] << bitpos;
>          }
> 
> The value of orig.x[0] is expected to be 0x9e3aeaff, but in this situation(64-bit System) we'll get the wrong value of 0xffffffff9e3aeaff due to the 64-bit sign extension: 
> buf[i] is defined as "unsigned char" and the left-shift operation will convert it to the type of "signed int", so when left-shift buf[i] by 24 bits, the final result will get the wrong value: 0xffffffff9e3aeaff.
> 
> If the left-shift bits are less than 24, then sign extension will not occur. Whereas the bankwidth of the nor flash we used is 4, therefore this BUG emerges.
> 
> Signed-off-by:Pang Xunlei <pang.xunlei@zte.com.cn>
> Signed-off-by: Zhang Yi <zhang.yi20@zte.com.cn>
> Signed-off-by:Lu Zhongjun <lu.zhongjun@zte.com.cn>
> Reviewed-by: Jiang Biao <jiang.biao2@zte.com.cn>
> Tested-by: Ma Chenggong <ma.chenggong@zte.com.cn>

[...]

Thanks,
Brian
