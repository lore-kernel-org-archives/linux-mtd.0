Received: from mail-ob0-f174.google.com ([209.85.214.174])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYnU5-0001Im-Dl
 for linux-mtd@lists.infradead.org; Wed, 23 Oct 2013 01:43:41 +0000
Received: by mail-ob0-f174.google.com with SMTP id vb8so155347obc.5
 for <linux-mtd@lists.infradead.org>; Tue, 22 Oct 2013 18:43:16 -0700 (PDT)
Date: Tue, 22 Oct 2013 18:43:13 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Wang Haitao <wang.haitao1@zte.com.cn>
Subject: Re: [PATCH]mtd: map: fixed bug in 64-bit systems
Message-ID: <20131023014313.GT23337@ld-irv-0074.broadcom.com>
References: <20130821085758.GG31788@brian-ubuntu>
 <OFED58E4A6.DD72F731-ON48257BD0.000C7F27-48257BD0.000D8AAF@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OFED58E4A6.DD72F731-ON48257BD0.000C7F27-48257BD0.000D8AAF@zte.com.cn>
Cc: artem.bityutskiy@linux.intel.com, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 23, 2013 at 10:24:07AM +0800, Wang Haitao wrote:
> Thanks for your advice.
> 
> Hardware：
>         CPU：XLP832,the 64-bit OS
>         NOR Flash:S29GL128S 128M
> Software:
>         Kernel:2.6.32.41
>         Filesystem:JFFS2
> 
> When writing files, errors appear:
>         Write len 182  but return retlen 180
>         Write of 182 bytes at 0x072c815c failed. returned -5, retlen 180
>         Write len 186  but return retlen 184
>         Write of 186 bytes at 0x072caff4 failed. returned -5, retlen 184
> These errors exist only in 64-bit systems,not in 32-bit systems. After
> analysis, we found that the left shift operation is wrong in
> map_word_load_partial. For instance：
>         unsigned char buf[3] ={0x9e,0x3a,0xea};
>         map_bankwidth(map) is 4;
> 
>         for (i=0; i < 3; i++) {
>                 int bitpos;
>                 bitpos = (map_bankwidth(map)-1-i)*8;
>                 orig.x[0] &= ~(0xff << bitpos);
>                 orig.x[0] |= buf[i] << bitpos;
>         }
> 
> The value of orig.x[0] is expected to be 0x9e3aeaff, but in this
> situation(64-bit System) we'll get the wrong value of 0xffffffff9e3aeaff
> due to the 64-bit sign extension:
> buf[i] is defined as "unsigned char" and the left-shift operation will
> convert it to the type of "signed int", so when left-shift buf[i] by 24
> bits, the final result will get the wrong value: 0xffffffff9e3aeaff.
> 
> If the left-shift bits are less than 24, then sign extension will not
> occur. Whereas the bankwidth of the nor flash we used is 4, therefore this
> BUG emerges.
> 
> Signed-off-by:Pang Xunlei <pang.xunlei@zte.com.cn>
> Signed-off-by: Zhang Yi <zhang.yi20@zte.com.cn>
> Signed-off-by:Lu Zhongjun <lu.zhongjun@zte.com.cn>
> Reviewed-by: Jiang Biao <jiang.biao2@zte.com.cn>
> Tested-by: Ma Chenggong <ma.chenggong@zte.com.cn>

Well, this still wasn't formatted correctly, but it is a good fix. I
fixed it up, added the Cc: <stable@vger.kernel.org> and applied it to
l2-mtd.git. Thanks!

Brian
