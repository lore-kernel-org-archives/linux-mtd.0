Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cMWOO-0006T3-6l
 for linux-mtd@lists.infradead.org; Thu, 29 Dec 2016 08:48:57 +0000
Subject: Re: [PATCH 6/6] ubifs: Wire up NFS support
To: "J. Bruce Fields" <bfields@fieldses.org>
References: <1480629741-18375-1-git-send-email-richard@nod.at>
 <1480629741-18375-7-git-send-email-richard@nod.at>
 <20161229025650.GB21325@fieldses.org>
Cc: linux-mtd@lists.infradead.org, david@sigma-star.at, tytso@mit.edu,
 dedekind1@gmail.com, adrian.hunter@intel.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, adilger.kernel@dilger.ca,
 akpm@linux-foundation.org, linux-ext4@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <af4b2ea5-e2fa-b454-a77e-10c62174ecff@nod.at>
Date: Thu, 29 Dec 2016 09:48:25 +0100
MIME-Version: 1.0
In-Reply-To: <20161229025650.GB21325@fieldses.org>
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

Bruce,

On 29.12.2016 03:56, J. Bruce Fields wrote:
>> -	 * Note, d_splice_alias() would be required instead if we supported
>> -	 * NFS.
>> -	 */
>> -	d_add(dentry, inode);
>> +
>> +	d_splice_alias(inode, dentry);
>>  	return NULL;
> 
> I'm pretty sure that should be 
> 
> 	return d_splice_alias(inode, dentry);

You are right.
/me assumed d_splice_alias() is consistent with d_add(). :-(

Thanks,
//richard
