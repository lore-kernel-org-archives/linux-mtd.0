Received: from mail-la0-x230.google.com ([2a00:1450:4010:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YXYkK-0003gM-4F
 for linux-mtd@lists.infradead.org; Mon, 16 Mar 2015 17:24:09 +0000
Received: by ladw1 with SMTP id w1so46038952lad.0
 for <linux-mtd@lists.infradead.org>; Mon, 16 Mar 2015 10:23:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <OF33DDCDFD.DB6F1A9D-ON48257E0A.0023416A-48257E0A.00267E79@zte.com.cn>
References: <OFDCFAD872.747A8A9B-ON48257E05.002FA55F-48257E06.000A13B0@zte.com.cn>
 <A3BA58D2-27E5-423A-97FE-F193367A6E03@gmail.com>
 <OF33DDCDFD.DB6F1A9D-ON48257E0A.0023416A-48257E0A.00267E79@zte.com.cn>
Date: Mon, 16 Mar 2015 13:23:44 -0400
Message-ID: <CAPDOMVj=rqiTpDzX-2G=y+akQFiUDRwANyzgMFzE0hptMhPGnA@mail.gmail.com>
Subject: Re: JFFS2: unaligned accesses may happen in jffs2_sum_process_sum_data
From: Nick Krause <xerofoify@gmail.com>
To: wang.bo116@zte.com.cn
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 16, 2015 at 3:00 AM,  <wang.bo116@zte.com.cn> wrote:
>
>
>
> Nicholas Krause <xerofoify@gmail.com> wrote on 2015-03-13 00:23:27:
>
>> From: Nicholas Krause <xerofoify@gmail.com>
>> To: wang.bo116@zte.com.cn, linux-mtd@lists.infradead.org, dwmw2@infradead.org,
>> Cc: cui.yunfeng@zte.com.cn, wang.haitao1@zte.com.cn, liu.song11@zte.com.cn, deng.chao1@zte.com.cn
>> Date: 2015-03-13 00:23
>> Subject: Re: JFFS2: unaligned accesses may happen in jffs2_sum_process_sum_data
>>
>>
>>
>> On March 11, 2015 9:50:01 PM EDT, wang.bo116@zte.com.cn wrote:
>> >
>> >   In JFFS2 summary, "#define JFFS2_SUMMARY_DIRENT_SIZE(x) (sizeof(struct
>> >jffs2_sum_dirent_flash) + (x))",because of x here is dir's name, the
>> >result of JFFS2_SUMMARY_DIRENT_SIZE may be unaligned. So in function
>> >"jffs2_sum_process_sum_data", may access unaligned pointer "sp" when
>> >excute "switch (je16_to_cpu(((struct jffs2_sum_unknown_flash
>> >*)sp)->nodetype))".
>> >
>> >   Some machine not allowed unaligned accesses, for example, in linux
>> >mips systerms, unaligned accesses may cause a exception,but luckly,in
>> >linux, function "handle_adel" can handle it well.But when JFFS2 use in
>> >other operating systerm, this unaligned accesses may be a problem.
>> >
>> >   To fix it,the simple way is redefine JFFS2_SUMMARY_DIRENT_SIZE like
>> >"#define JFFS2_SUMMARY_DIRENT_SIZE(x) PAD((sizeof(struct
>> >jffs2_sum_dirent_flash) + (x)))",make it aligned.But the problem is
>> >that SUMMARY became incompatible!
>> >
>> >
>> >
>> >
>> >Are you stating that this is a build issue or causing a bug with hardware that needs this marco unaligned.
>> Nick
Wang,
>
>
> I think this may causing a bug with hardware that needs address aligned,and lose some efficiency.
>
Wang,
I looked into it and you may be right but I don't have flash to test
this on. The best way to find out is testing on a actual system that
requires hardware aligned flash
as this is hard for me to guess out. Other wise I would be able to
tell you off the bat to fix this.
Nick
