Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byZEc-0003vT-RX
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 06:59:51 +0000
Subject: Re: [PATCH 25/26] ubifs: Implement UBIFS_FLG_ENCRYPTION
To: Eric Biggers <ebiggers@google.com>
References: <1477054121-10198-1-git-send-email-richard@nod.at>
 <1477054121-10198-26-git-send-email-richard@nod.at>
 <20161021183012.GC90712@google.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dedekind1@gmail.com, adrian.hunter@intel.com,
 tytso@mit.edu, jaegeuk@kernel.org, david@sigma-star.at, wd@denx.de,
 sbabic@denx.de, dengler@linutronix.de
From: Richard Weinberger <richard@nod.at>
Message-ID: <58235996-2da6-259c-a02c-9e7fcb499d62@nod.at>
Date: Mon, 24 Oct 2016 08:59:26 +0200
MIME-Version: 1.0
In-Reply-To: <20161021183012.GC90712@google.com>
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

Eric,

On 21.10.2016 20:30, Eric Biggers wrote:
> On Fri, Oct 21, 2016 at 02:48:40PM +0200, Richard Weinberger wrote:
>> @@ -190,6 +191,10 @@ long ubifs_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>>  				   sizeof(policy)))
>>  			return -EFAULT;
>>  
>> +		err = ubifs_enable_encryption(c);
>> +		if (err)
>> +			return err;
>> +
>>  		err = fscrypt_process_policy(file, &policy);
> 
> Is ubifs_enable_encryption() being done with proper locking and authorization?

Anyone can encrypted files when UBIFS is build with that feature. Locking is fine
since the operation is atomic. (UBI LEB change).

> As-is, anyone can call this at any time if they can open some file on UBIFS.

That's what I had in mind.

> FYI, the approach being taken for ext4 is that the encryption feature flag has
> to be explicitly turned on before FS_IOC_SET_ENCRYPTION_POLICY will work.

So, on ext4 (f2fs too?) root has to enable to feature first before users
can use it?
IOW for ext4 the encryption flag means "file encryption is allowed", for UBIFS it
means "at least one file got encrypted on this fs".

I think I'll do what ext4 does to have common policies.
BTW: Are these policies documented somewhere?

Thanks,
//richard
