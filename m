Received: from mail-oi0-x235.google.com ([2607:f8b0:4003:c06::235])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d8Cki-00027p-Go
 for linux-mtd@lists.infradead.org; Tue, 09 May 2017 21:33:06 +0000
Received: by mail-oi0-x235.google.com with SMTP id h4so15599574oib.3
 for <linux-mtd@lists.infradead.org>; Tue, 09 May 2017 14:32:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <889DB31BAC79B0408EC03BEFCB9A558011602AF6@cnshjmbx04>
References: <889DB31BAC79B0408EC03BEFCB9A558011602AF6@cnshjmbx04>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 9 May 2017 23:32:42 +0200
Message-ID: <CAFLxGvyVPig6oJpkQia8bSQ7sGtV6VhHA=ZPTur3Kr2YBKJvWg@mail.gmail.com>
Subject: Re: a bug detected in ubifs
To: ZHANG Hui P <Hui.P.Zhang@alcatel-sbell.com.cn>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 9, 2017 at 7:18 AM, ZHANG Hui P
<Hui.P.Zhang@alcatel-sbell.com.cn> wrote:
>          Then I dump the lpt, and checked the pnode at 8:24749 , it is
>
> LEB 8:24749, pnode,  0:128408:1, 0:176:0, 0:130160:1, 0:128448:1  //the print order is :        for (i = 0; i < UBIFS_LPT_FANOUT; i++) {
>                                                                                                                                   printk(KERN_CONT "%d:%d:%d", pnode.lprops[i].free,
>                                                                                                                            pnode.lprops[i].dirty,pnode.lprops[i].flags);
>
>          so the problem is the lprops[2], which dirty is 130160, howerver ,the leb_size is 129024, so it is returned "-EINVAL" while calling "validate_pnode"
>          do you see this problem before? Or can you give me some suggestion for the further investgate?

I have one issue on my radar which could be related, but not sure.
What kernel version is this?

-- 
Thanks,
//richard
