Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cFGW9-0005xU-PN
 for linux-mtd@lists.infradead.org; Fri, 09 Dec 2016 08:26:59 +0000
Subject: Re: [PATCH V2] nandwrite: Factor out buffer checking code
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marex@denx.de>
References: <20161209014741.15609-1-marex@denx.de>
 <20161209084904.28d1e914@bbrezillon>
Cc: linux-mtd@lists.infradead.org, Kees Trommel <ctrommel@aimvalley.nl>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <7f4c3ff4-10e7-e34f-388f-6d02bf6bcb21@sigma-star.at>
Date: Fri, 9 Dec 2016 09:25:20 +0100
MIME-Version: 1.0
In-Reply-To: <20161209084904.28d1e914@bbrezillon>
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

On 12/09/2016 08:49 AM, Boris Brezillon wrote:
> On Fri,  9 Dec 2016 02:47:41 +0100
> Marek Vasut <marex@denx.de> wrote:
> 
>> Pull the buffer content checking code into separate function and
>> simplify the code invoking it slightly.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Looks good to me too.

On 12/09/2016 02:49 AM, Marek Vasut wrote:
> OK, done and V2 out. But it'd be great if someone could actually test it
> :-) Kees ?
> 
> 

>From looking at the code, it looks perfectly reasonable and I don't see
why it shouldn't work.

Anyway, I took the code snippet and ran an exhaustive test on all 32 bit
integers. It appears to work as intended.

Applied to mtd-utils.git.


Thanks,

David
