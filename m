Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fhEEk-0007pX-27
 for linux-mtd@lists.infradead.org; Sun, 22 Jul 2018 13:17:23 +0000
Received: by mail-wr1-x442.google.com with SMTP id s11-v6so15282052wra.13
 for <linux-mtd@lists.infradead.org>; Sun, 22 Jul 2018 06:17:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <b2b2e3e0-14b7-9f46-434d-2134d1d0cfad@alliedtelesis.co.nz>
References: <cover.1532043059.git.theuns.verwoerd@alliedtelesis.co.nz>
 <f1c6c3cc0c8850e143594afd57b50d30cd8bb5f8.1532043059.git.theuns.verwoerd@alliedtelesis.co.nz>
 <20180720000431.GA30522@ZenIV.linux.org.uk>
 <b2b2e3e0-14b7-9f46-434d-2134d1d0cfad@alliedtelesis.co.nz>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 22 Jul 2018 15:17:07 +0200
Message-ID: <CAFLxGvyTmz8JQVn-OJFSVdns74o49XgdWbhGpPsqYe5S2uahYg@mail.gmail.com>
Subject: Re: [PATCH 2/2] jffs2: Provide jffs2_sync files to track gc POLL
 progress
To: Theuns Verwoerd <Theuns.Verwoerd@alliedtelesis.co.nz>,
 Al Viro <viro@zeniv.linux.org.uk>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[fixing CC list]

On Fri, Jul 20, 2018 at 2:54 AM, Theuns Verwoerd
<Theuns.Verwoerd@alliedtelesis.co.nz> wrote:
>
> On 07/20/2018 12:04 PM, Al Viro wrote:
>> On Fri, Jul 20, 2018 at 11:50:12AM +1200, Theuns Verwoerd wrote:
>>
>>> +ssize_t jffs2_sync_file_read(struct file *f,
>>> +          char __user *b, size_t len, loff_t *ofs)
>>> +{
>>> +    struct jffs2_sb_info *c = file_inode(f)->i_private;
>>> +
>>> +    while (c->tidemark)
>>> +            schedule();
>>> +
>>> +    return 0;
>>> +}
>> Brilliant.  So when that gets called with c->tidemark being true and
>> need_resched() - false, we shall...
> By my reading, schedule() will happily force a reschedule (once) when
> need_resched() is false.  Every time the process is granted a time
> slice, it'll check the condition and surrender if not ready.
>
> What do you believe will happen?
>> Bonus question: what happens if that is called after that jffs2_sb_info
>> gets freed?
> That is probably a valid critique - if jffs2_kill_sb() gets called the
> cleanup in exit_jffs2_fs() is not sufficient.

Beside of that, IMHO this debugfs file is a gross hack.
Did you look into the possibility to add the GC phase into the unlink code?

-- 
Thanks,
//richard
