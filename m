Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZiUMH-0003kh-1G
 for linux-mtd@lists.infradead.org; Sat, 03 Oct 2015 21:28:46 +0000
Subject: Re: [PATCH] ubi: fastmap: Implement produce_free_peb()
To: linux-mtd@lists.infradead.org
References: <1439328464-5521-1-git-send-email-richard@nod.at>
Cc: linux-kernel@vger.kernel.org, joerg.krause@embedded.rocks
From: Richard Weinberger <richard@nod.at>
Message-ID: <5610486D.7090207@nod.at>
Date: Sat, 3 Oct 2015 23:28:13 +0200
MIME-Version: 1.0
In-Reply-To: <1439328464-5521-1-git-send-email-richard@nod.at>
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

Am 11.08.2015 um 23:27 schrieb Richard Weinberger:
> If fastmap requests a free PEB for a pool and UBI is busy
> with erasing PEBs we need to offer a function to wait for one.
> We can reuse produce_free_peb() from the non-fastmap WL code
> but with different locking semantics.
> 
> Reported-and-tested-by: Jörg Krause <joerg.krause@embedded.rocks>
> Signed-off-by: Richard Weinberger <richard@nod.at>

Applied.

Thanks,
//richard
