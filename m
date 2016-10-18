Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bwa1X-0006NW-K8
 for linux-mtd@lists.infradead.org; Tue, 18 Oct 2016 19:26:08 +0000
Subject: Re: [PATCH][V2] ubi: fix swapped arguments to call to ubi_alloc_aeb
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Colin King <colin.king@canonical.com>
References: <20161015160011.27600-1-colin.king@canonical.com>
 <20161016173856.11d486aa@bbrezillon>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <3b4f59d5-0795-c8fe-0a5e-3f36813b8133@nod.at>
Date: Tue, 18 Oct 2016 21:25:43 +0200
MIME-Version: 1.0
In-Reply-To: <20161016173856.11d486aa@bbrezillon>
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

On 16.10.2016 17:38, Boris Brezillon wrote:
> On Sat, 15 Oct 2016 17:00:11 +0100
> Colin King <colin.king@canonical.com> wrote:
> 
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Static analysis by CoverityScan detected the ec and pnum
>> arguments are in the wrong order on a call to ubi_alloc_aeb.
>> Swap the order to fix this.
>>
>> Fixes: 91f4285fe389a27 ("UBI: provide helpers to allocate and free aeb elements")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Applied. :)

Thanks,
//richard
