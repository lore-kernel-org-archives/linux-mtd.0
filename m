Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAH6m-0004pd-0Z
 for linux-mtd@lists.infradead.org; Fri, 25 Nov 2016 14:04:08 +0000
Subject: Re: [RESEND PATCH v5 2/5] mtd: ubi: use 'max_bad_blocks' to compute
 bad_peb_limit if available
To: Brian Norris <computersforpeace@gmail.com>, Zach Brown <zach.brown@ni.com>
References: <1479757899-6849-1-git-send-email-zach.brown@ni.com>
 <1479757899-6849-3-git-send-email-zach.brown@ni.com>
 <20161122184215.GA77253@google.com>
 <b6fe6ae4-7ef2-ed61-3bb4-dd00f92524f8@nod.at>
Cc: dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 dedekind1@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <5e6be8fb-1787-ff25-7e35-a264de86db6d@nod.at>
Date: Fri, 25 Nov 2016 15:03:45 +0100
MIME-Version: 1.0
In-Reply-To: <b6fe6ae4-7ef2-ed61-3bb4-dd00f92524f8@nod.at>
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

On 25.11.2016 14:37, Richard Weinberger wrote:
>> Are you sure you want to even override the user-provided
>> max_beb_per1024 value taken from the mtd= line? I'd think if someone
>> went as far as to specify this in the kernel command line, they don't
>> expect it to get overridden. Just my two cents.
> 
> I agree. With this patch applied the limit can be set via Kconfig, cmdline and automatically.
> IMHO the automatic value via mtd_max_bad_blocks and over-writeable via cmdline and Kconfig.

s/and/should be/

Thanks,
//richard
