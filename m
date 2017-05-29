Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dFGGa-0006kP-JJ
 for linux-mtd@lists.infradead.org; Mon, 29 May 2017 08:43:11 +0000
Subject: Re: [PATCH] ubifs: Add freeze support
To: Hyunchul Lee <hyc.lee@gmail.com>
References: <1495755004-17036-1-git-send-email-hyc.lee@gmail.com>
 <20170527082338.GC32125@infradead.org> <20170529004346.GA10215@sebu>
 <20170529022444.GA11814@sebu>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, kernel-team@lge.com,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <8e61baf3-a78e-d17f-ebe2-cd56d6c52259@nod.at>
Date: Mon, 29 May 2017 10:42:37 +0200
MIME-Version: 1.0
In-Reply-To: <20170529022444.GA11814@sebu>
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

Hyunchul,

Am 29.05.2017 um 04:24 schrieb Hyunchul Lee:
>>> This is just broken.  First ubifs should still properly propagate
>>> the errors, and second freezing/unfreezing read only file systems is
>>> perfectly valid, 
>>
>> it is right.
> 
> if updating TNC is failed, ubifs might become inconsistant and be switched to 
> read-only mode. for example, when ubifs_jnl_update is called to create a file, 
> if inserting a znode for new inode is failed, TNC has only a znode for 
> new dentry. and this can be only recoverd by replay.
> 
> is it required to fix this?

UBIFS is designed to be power-cut tolerant.
So, UBIFS must not corrupt in any case.

Which failure are you facing?

I have the feeling that you try to paper over some other issue. :-)

Thanks,
//richard
