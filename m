Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c03FN-0004UG-A0
 for linux-mtd@lists.infradead.org; Fri, 28 Oct 2016 09:14:46 +0000
Subject: Re: [PATCH] UBI: fastmap: Fix add_vol() return value test in
 ubi_attach_fastmap()
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
References: <1477645724-17654-1-git-send-email-boris.brezillon@free-electrons.com>
 <20161028111210.4515249a@bbrezillon>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <2bcac0ef-2937-f3c9-0f22-4a3b727bf150@nod.at>
Date: Fri, 28 Oct 2016 11:14:19 +0200
MIME-Version: 1.0
In-Reply-To: <20161028111210.4515249a@bbrezillon>
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

On 28.10.2016 11:12, Boris Brezillon wrote:
> On Fri, 28 Oct 2016 11:08:44 +0200
> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> 
>> Commit e96a8a3bb671 ("UBI: Fastmap: Do not add vol if it already
>> exists") introduced a bug by changing the possible error codes returned
>> by add_vol():
>> - this functions no longer returns NULL in case of allocation failure
> 
> 	 ^ function
> 
>>   but return ERR_PTR(-ENOMEM)
>> - when a duplicate entry in the volume RB tree is found it returns
>>   ERR_PTR(-EEXIST) instead of ERR_PTR(-EINVAL)
>>
>> Fix the tests done of add_vol() return value accordingly.
> 
> "Fix the tests done on add_vol() return val to match this new behavior."
> 
> Do you want me to send a new version fixing the commit message?

Nope, I can fixup it myself. :-)

Thanks,
//richard
