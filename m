Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dFbw8-0002Mu-S9
 for linux-mtd@lists.infradead.org; Tue, 30 May 2017 07:51:31 +0000
Subject: Re: [PATCH] ubifs: Add freeze support
To: Hyunchul Lee <hyc.lee@gmail.com>
References: <1495755004-17036-1-git-send-email-hyc.lee@gmail.com>
 <20170527082338.GC32125@infradead.org> <20170529004346.GA10215@sebu>
 <20170529022444.GA11814@sebu> <8e61baf3-a78e-d17f-ebe2-cd56d6c52259@nod.at>
 <20170530023740.GA15808@sebu>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, kernel-team@lge.com,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <11d60b1c-7c9a-709e-4d51-7e89fabba6a0@nod.at>
Date: Tue, 30 May 2017 09:51:00 +0200
MIME-Version: 1.0
In-Reply-To: <20170530023740.GA15808@sebu>
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

Am 30.05.2017 um 04:37 schrieb Hyunchul Lee:
>> UBIFS is designed to be power-cut tolerant.
>> So, UBIFS must not corrupt in any case.
>>
>> Which failure are you facing?
>>
>> I have the feeling that you try to paper over some other issue. :-)
> 
> The failure hasn't happened. I wondered the following situation
> should be handled.
> 
> ubifs_create
>   ubifs_jnl_update
>     write_head
>     ubifs_tnc_add_nm  /* (1) add dentry to TNC */
>     ubifs_tnc_add     /* (2) add new inode to TNC */
>     ubifs_tnc_add     /* (3) add parent inode to TNC */
> 
> If ubifs_tnc_add(2) fails, TNC would have the index of a dentry 
> which points to an invalid inode. So, though ubifs_readdir
> emits the dentry, this inode cannot be accessed. Becasue
> there isn't the index of the inode.

Well, to make ubifs_jnl_update() more robust wrt. such unlikely failures
please rework the journal code.
Adding freeze support does not fix the root cause.
UBIFS treats unrecoverable errors in ubifs_jnl_* since ever as fatal.

Thanks,
//richard
