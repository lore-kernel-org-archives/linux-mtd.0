Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dD43y-0007xo-IB
 for linux-mtd@lists.infradead.org; Tue, 23 May 2017 07:17:04 +0000
Subject: Re: [PATCH 4/6] ubifs: Maintain a parent pointer
To: Hyunchul Lee <hyc.lee@gmail.com>
References: <1495398051-4604-1-git-send-email-richard@nod.at>
 <1495398051-4604-5-git-send-email-richard@nod.at>
 <20170522043023.GA13501@sebu> <71c6f44e-ad49-d8b0-8e1c-cada1769a3be@nod.at>
 <20170522235049.GA22083@sebu>
Cc: david@sigma-star.at, bfields@redhat.com, dedekind1@gmail.com,
 rockdotlee@gmail.com, adrian.hunter@intel.com, linux-kernel@vger.kernel.org,
 kernel-team@lge.com, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, adilger.kernel@dilger.ca,
 akpm@linux-foundation.org, marcus.folkesson@gmail.com, leon.pollak@gmail.com
From: Richard Weinberger <richard@nod.at>
Message-ID: <e890499f-fe32-66bc-6a39-bc27e91d89ba@nod.at>
Date: Tue, 23 May 2017 09:16:32 +0200
MIME-Version: 1.0
In-Reply-To: <20170522235049.GA22083@sebu>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hyunchul,

Am 23.05.2017 um 01:50 schrieb Hyunchul Lee:
>> I assumed that the journal does this already because we change old_inode->i_ctime
>> in this function too.
>> But checking the code showed the opposite.
>> So, if we face a power-cut the rename can succeed but we lose the ctime change.
>>
>> This needs to be addressed before we can add the parent pointer.
> 
> Is writing old_inode->i_ctime required? I guess that it is needed only when 
> IS_SYNC(old_inode) is true, otherwise we don't need to guarantee that ctime
> is synced.

Well, rename() has to be an atomic operation. When UBIFS updates ctime during this
operation it has also to be atomic. Otherwise, after a power-cut, you can end-up with
a renamed file but a not updated ctime.
Userspace can depend on this. Think of a backup program that needs to detect changes.
It won't notice the renamed file.

AFAICT POSIX does not require ctime to be updated during rename() but suggests it.
My point is, either we do it always or never.

Just checked xfs and btrfs. Both seem to update ctime of old_inode during the rename
transaction. UBIFS should do the same.

Thanks,
//richard
