Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctXEk-0001UC-Vr
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 10:23:29 +0000
Subject: Re: [PATCH] ubifs: Fix O_TMPFILE corner case in ubifs_link()
To: Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org
References: <1490864181-2192-1-git-send-email-richard@nod.at>
 <cd165532-9425-bc93-a28e-b7d383508b62@intel.com>
 <ab0a0797-7074-d53b-5863-38a84ca2a594@nod.at>
Cc: linux-kernel@vger.kernel.org, dedekind1@gmail.com,
 stable@vger.kernel.org, Ralph Sennhauser <ralph.sennhauser@gmail.com>,
 Amir Goldstein <amir73il@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <4c7a176b-6132-7936-a04f-d4def5e56320@nod.at>
Date: Thu, 30 Mar 2017 12:23:01 +0200
MIME-Version: 1.0
In-Reply-To: <ab0a0797-7074-d53b-5863-38a84ca2a594@nod.at>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 30.03.2017 um 11:49 schrieb Richard Weinberger:
> Am 30.03.2017 um 11:32 schrieb Adrian Hunter:
>>> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
>>> index 0858213a4e63..0139155045fe 100644
>>> --- a/fs/ubifs/dir.c
>>> +++ b/fs/ubifs/dir.c
>>> @@ -748,6 +748,11 @@ static int ubifs_link(struct dentry *old_dentry, struct inode *dir,
>>>  		goto out_fname;
>>>  
>>>  	lock_2_inodes(dir, inode);
>>> +
>>> +	/* Handle O_TMPFILE corner case, it is allowed to link a O_TMPFILE. */
>>> +	if (inode->i_nlink == 0)
>>> +		ubifs_delete_orphan(c, inode->i_ino);
>>
>> Isn't there also a deletion inode in the journal?  If the recovery sees that
>> won't it delete the file data?
> 
> Yes, but ubifs_link() adds a new journal entry which revives the inode.
> This should cancel out the deletion, right?
> You know the UBIFS journal better than I do. :-)

Reading deeper into the proved that I was wrong.
AFAIKT UBIFS' journal has currently no way to revive a deleted inode.
So, we have to think about a new solution.

Thanks,
//richard
