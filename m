Received: from mail-wg0-x235.google.com ([2a00:1450:400c:c00::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UfUP1-0002pq-4p
 for linux-mtd@lists.infradead.org; Thu, 23 May 2013 12:13:52 +0000
Received: by mail-wg0-f53.google.com with SMTP id m15so2104769wgh.20
 for <linux-mtd@lists.infradead.org>; Thu, 23 May 2013 05:13:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <OF6992CC88.316C799B-ON48257B74.0040CED8-48257B74.0041FF6F@zte.com.cn>
References: <CAFLxGvxfzHudUMRc7VkgWMO9RJAkyh1iuouRAV-0s-5eaLqfEQ@mail.gmail.com>
 <OFE7F9663A.1F3DE1BE-ON48257B60.00045684-48257B60.001360DF@zte.com.cn>
 <CAFLxGvzKw1_L3Nm4J5GM_wr0sFe6umN0yLzDnK=DM_AJ7GpaaQ@mail.gmail.com>
 <OF6992CC88.316C799B-ON48257B74.0040CED8-48257B74.0041FF6F@zte.com.cn>
Date: Thu, 23 May 2013 14:13:27 +0200
Message-ID: <CAFLxGvw5gj-dfQeMKQVJpHPAXi4ZeNTaG3u3yXOAkshJRavXVA@mail.gmail.com>
Subject: Re: Re: Re: Re: [PATCH] UBI: fix memory leak when use fastmap
From: richard -rw- weinberger <richard.weinberger@gmail.com>
To: wang.bo116@zte.com.cn
Content-Type: text/plain; charset=ISO-8859-1
Cc: liu.dong3@zte.com.cn,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, cui.yunfeng@zte.com.cn
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 23, 2013 at 2:00 PM,  <wang.bo116@zte.com.cn> wrote:
> richard -rw- weinberger <richard.weinberger@gmail.com>  2013-05-13
> 16:08:35:
>
>>
>> I tried to apply/test your patch.
>> It has lots of white spaces damages.
>> Can you please resend it using git send-email?
>> And also run checkpatch.pl before sending.
>>
>> --
>> Thanks,
>> //richard
>
> hello:
>         I use git to remake a patch, and pass the checkpatch.pl's test.
> But my email client is lotus notes, and the patch's format may be damage
> by the client.

This explains the broken patch.
You can also send me the patch as attachment. :)

--
Thanks,
//richard
