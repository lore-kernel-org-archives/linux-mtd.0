Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cClDG-0005mG-7T
 for linux-mtd@lists.infradead.org; Fri, 02 Dec 2016 10:37:08 +0000
Subject: Re: [PATCH 4/6] ubifs: Maintain a parent pointer
To: Marcus Folkesson <marcus.folkesson@gmail.com>
References: <1480629741-18375-1-git-send-email-richard@nod.at>
 <1480629741-18375-5-git-send-email-richard@nod.at>
 <20161202092840.i67lhgglzlnugwpd@gmail.com>
Cc: linux-mtd@lists.infradead.org, david@sigma-star.at, tytso@mit.edu,
 dedekind1@gmail.com, adrian.hunter@intel.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, adilger.kernel@dilger.ca,
 akpm@linux-foundation.org, linux-ext4@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <c8633ae8-9f17-8366-aae1-4bdbe4b8b141@nod.at>
Date: Fri, 2 Dec 2016 11:36:37 +0100
MIME-Version: 1.0
In-Reply-To: <20161202092840.i67lhgglzlnugwpd@gmail.com>
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

On 02.12.2016 10:28, Marcus Folkesson wrote:
> On Thu, Dec 01, 2016 at 11:02:19PM +0100, Richard Weinberger wrote:
>>  
>> +	if (new_dir != old_dir) {
>> +		fst_inode_ui->parent_inum = new_dir->i_ino;
>> +		snd_inode_ui->parent_inum = old_dir->i_ino;
>> +	}
>> +
>>  	if (old_dir != new_dir) {
>>  		if (S_ISDIR(fst_inode->i_mode) && !S_ISDIR(snd_inode->i_mode)) {
>>  			inc_nlink(new_dir);
> 
> Insignificant thing, but use the existing if-statment instead?

Of course.
I moved the line around and oversaw the existing branch. :)

Thanks,
//richard
