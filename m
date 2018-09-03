Received: from mout.gmx.net ([212.227.15.19])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fwouN-0000nz-VF
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2018 13:28:49 +0000
Subject: Re: [PATCH] jffs2: add additinal sanity check for
 jffs2_acl_from_medium()
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>
References: <20180902154443.4776-1-cgxu519@gmx.com>
 <CAFLxGvyVmdDk8RqK5y8Q2eDxx4kLPhOJJ8e6TUpx=_E7_u+d-w@mail.gmail.com>
From: cgxu519 <cgxu519@gmx.com>
Message-ID: <56f970fc-ac3b-94d8-0f00-5db3fa68ca65@gmx.com>
Date: Mon, 3 Sep 2018 21:28:31 +0800
MIME-Version: 1.0
In-Reply-To: <CAFLxGvyVmdDk8RqK5y8Q2eDxx4kLPhOJJ8e6TUpx=_E7_u+d-w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/03/2018 04:45 PM, Richard Weinberger wrote:
> On Sun, Sep 2, 2018 at 5:45 PM Chengguang Xu <cgxu519@gmx.com> wrote:
>> In the case ACL_USER and ACL_GROUP we check if value has exceeded end,
>> add same check in the case ACL_OTHER as well.
> Did you hit a problem in that area or was this found by review?
>  From looking at the code I'd say it is fine as is.
> In the ACL_MASK/_OTHER case we don't look into the entry object like
> ACL_USER/_GROUP
> do, we immediately break the switch and run another round in the for loop.
> And here we do:
>                  entry = value;
>                  if (value + sizeof(struct jffs2_acl_entry_short) > end)
>                          goto fail;
>
> Which is what your additional check does. So, we'd check twice.
> What do I miss?

You are right, it is actually not needed. Sorry, please just drop the patch.
