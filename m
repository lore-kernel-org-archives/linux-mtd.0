Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c0PZG-0001Im-M1
 for linux-mtd@lists.infradead.org; Sat, 29 Oct 2016 09:04:47 +0000
Subject: Re: [PATCH] ubifs: Fix regression in ubifs_readdir()
To: =?UTF-8?Q?J=c3=b6rg_Krause?= <joerg.krause@embedded.rocks>,
 linux-mtd@lists.infradead.org
References: <1477648432-9543-1-git-send-email-richard@nod.at>
 <1477671544.8927.1.camel@embedded.rocks>
 <c542e099-0404-be8e-ebeb-d4265d3204d6@nod.at>
 <1477693395.31471.1.camel@embedded.rocks>
Cc: dedekind1@gmail.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, adrian.hunter@intel.com, ralph.sennhauser@gmail.com,
 peda@axentia.se
From: Richard Weinberger <richard@nod.at>
Message-ID: <0e2d577d-aa17-2b83-3e6c-4de950d2d02d@nod.at>
Date: Sat, 29 Oct 2016 11:04:18 +0200
MIME-Version: 1.0
In-Reply-To: <1477693395.31471.1.camel@embedded.rocks>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 29.10.2016 00:23, Jörg Krause wrote:
>> Does reverting c83ed4c9dbb35 help?
>> And are you 100% sure you applied the fix?
> 
> I double double checked. The fix was applied on the git tree, but the
> compiler cache (I am using Buildroot with this option enabled) fooled
> me by using an old copy. After disabling the compiler cache I got a
> fixed build of the kernel. The panic is gone! Thanks!

Thanks for letting me know.
Let's get this fix into -rc3 then. :-)

Thanks,
//richard
