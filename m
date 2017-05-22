Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dCiy9-0006QB-GO
 for linux-mtd@lists.infradead.org; Mon, 22 May 2017 08:45:39 +0000
Subject: Re: [PATCH 4/6] ubifs: Maintain a parent pointer
To: Hyunchul Lee <hyc.lee@gmail.com>
References: <1495398051-4604-1-git-send-email-richard@nod.at>
 <1495398051-4604-5-git-send-email-richard@nod.at>
 <20170522043023.GA13501@sebu>
Cc: linux-mtd@lists.infradead.org, david@sigma-star.at, bfields@redhat.com,
 dedekind1@gmail.com, linux-kernel@vger.kernel.org, adrian.hunter@intel.com,
 leon.pollak@gmail.com, adilger.kernel@dilger.ca,
 linux-fsdevel@vger.kernel.org, marcus.folkesson@gmail.com,
 akpm@linux-foundation.org, rockdotlee@gmail.com, kernel-team@lge.com
From: Richard Weinberger <richard@nod.at>
Message-ID: <71c6f44e-ad49-d8b0-8e1c-cada1769a3be@nod.at>
Date: Mon, 22 May 2017 10:45:08 +0200
MIME-Version: 1.0
In-Reply-To: <20170522043023.GA13501@sebu>
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

Am 22.05.2017 um 06:30 schrieb Hyunchul Lee:
>> +	if (move)
>> +		old_inode_ui->parent_inum = new_dir->i_ino;
>> +
>>  	err = ubifs_jnl_rename(c, old_dir, old_inode, &old_nm, new_dir,
>>  			       new_inode, &new_nm, whiteout, sync);
> 
> I think that old_inode_ui->parent_inum could point old_dir, even though old_inode
> is a child of new_dir. this could happen that there is power-cut before
> old_inode is synced. so I guess that old_inode is needed to be written with
> rename's node group in ubifs_jnl_rename. is it right?

I assumed that the journal does this already because we change old_inode->i_ctime
in this function too.
But checking the code showed the opposite.
So, if we face a power-cut the rename can succeed but we lose the ctime change.

This needs to be addressed before we can add the parent pointer.

Thanks,
//richard
