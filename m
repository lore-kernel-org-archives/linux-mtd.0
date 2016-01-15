Received: from mail-ob0-x22a.google.com ([2607:f8b0:4003:c01::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aKAlt-0003CY-N8
 for linux-mtd@lists.infradead.org; Fri, 15 Jan 2016 20:14:58 +0000
Received: by mail-ob0-x22a.google.com with SMTP id vt7so119407682obb.1
 for <linux-mtd@lists.infradead.org>; Fri, 15 Jan 2016 12:14:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAO3V0Grneh8P053k=1eVucuSkW0oq5qf16-5k3mi6xAtcSY5bA@mail.gmail.com>
References: <CAO3V0Grneh8P053k=1eVucuSkW0oq5qf16-5k3mi6xAtcSY5bA@mail.gmail.com>
Date: Fri, 15 Jan 2016 21:14:35 +0100
Message-ID: <CAFLxGvw7o+omS5qtsjP6SXvXyyg4MbX-paw7KX1=JZZJL0_bSA@mail.gmail.com>
Subject: Re: UBIFS - read only file system
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Tiago Trota <tiagofgdt@gmail.com>
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

Hi!

On Fri, Jan 15, 2016 at 6:24 PM, Tiago Trota <tiagofgdt@gmail.com> wrote:
> I have a system with ARM which is using a NAND flash to store kernel
> and file system.
> After a reboot  I get these errors and the UBIFS file system becomes
> read-only. I can't revert this situation and it was the first time
> this happened. Is there anyhing I can do to repair it?

The more interesting question is, why could this happen?
Did you see some other errors before that?
Is this a recent kernel?

> UBIFS error (pid 454): ubifs_iget: failed to read inode 41930, error -2
> UBIFS error (pid 454): ubifs_lookup: dead directory entry 'snmpd.pid', error -2
> UBIFS warning (pid 454): ubifs_ro_mode: switched to read-only mode, error -2

This is:
        inode = ubifs_iget(dir->i_sb, le64_to_cpu(dent->inum));
        if (IS_ERR(inode)) {
                /*
                 * This should not happen. Probably the file-system needs
                 * checking.
                 */
                err = PTR_ERR(inode);
                ubifs_err(c, "dead directory entry '%pd', error %d",
                          dentry, err);
                ubifs_ro_mode(c, err);
                goto out;
        }

Can you share the filesystem?

-- 
Thanks,
//richard
