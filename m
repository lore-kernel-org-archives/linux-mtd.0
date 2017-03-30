Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctXQO-0006LX-TW
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 10:35:29 +0000
Received: by mail-oi0-x242.google.com with SMTP id b187so3945466oif.3
 for <linux-mtd@lists.infradead.org>; Thu, 30 Mar 2017 03:35:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4c7a176b-6132-7936-a04f-d4def5e56320@nod.at>
References: <1490864181-2192-1-git-send-email-richard@nod.at>
 <cd165532-9425-bc93-a28e-b7d383508b62@intel.com>
 <ab0a0797-7074-d53b-5863-38a84ca2a594@nod.at>
 <4c7a176b-6132-7936-a04f-d4def5e56320@nod.at>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 30 Mar 2017 13:35:06 +0300
Message-ID: <CAOQ4uxi0sJrZX22nNW23PnJ9AgzC=EeBOjOp=wb1taXSySYUrA@mail.gmail.com>
Subject: Re: [PATCH] ubifs: Fix O_TMPFILE corner case in ubifs_link()
To: Richard Weinberger <richard@nod.at>
Cc: Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 "stable [v4.9]" <stable@vger.kernel.org>,
 Ralph Sennhauser <ralph.sennhauser@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 30, 2017 at 1:23 PM, Richard Weinberger <richard@nod.at> wrote:
> Am 30.03.2017 um 11:49 schrieb Richard Weinberger:
>> Am 30.03.2017 um 11:32 schrieb Adrian Hunter:
>>>> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
>>>> index 0858213a4e63..0139155045fe 100644
>>>> --- a/fs/ubifs/dir.c
>>>> +++ b/fs/ubifs/dir.c
>>>> @@ -748,6 +748,11 @@ static int ubifs_link(struct dentry *old_dentry, struct inode *dir,
>>>>             goto out_fname;
>>>>
>>>>     lock_2_inodes(dir, inode);
>>>> +
>>>> +   /* Handle O_TMPFILE corner case, it is allowed to link a O_TMPFILE. */
>>>> +   if (inode->i_nlink == 0)
>>>> +           ubifs_delete_orphan(c, inode->i_ino);
>>>
>>> Isn't there also a deletion inode in the journal?  If the recovery sees that
>>> won't it delete the file data?
>>
>> Yes, but ubifs_link() adds a new journal entry which revives the inode.
>> This should cancel out the deletion, right?
>> You know the UBIFS journal better than I do. :-)
>
> Reading deeper into the proved that I was wrong.
> AFAIKT UBIFS' journal has currently no way to revive a deleted inode.
> So, we have to think about a new solution.
>

Not that I know anything about ubifs, but why do you need the deleted
inode record in the first place for an O_TMPFILE.
vfs ensures you that you can only link back an O_TMPFILE, not a deleted
inode.

It does not appear to be the right thing to do to pass deletion=1 to
ubifs_jnl_update(), but deletion=0 doesn't look right as well..
