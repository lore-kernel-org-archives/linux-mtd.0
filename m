Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XbVFX-00046G-Bi
 for linux-mtd@lists.infradead.org; Tue, 07 Oct 2014 13:56:24 +0000
Message-ID: <5433F0EB.9070207@nod.at>
Date: Tue, 07 Oct 2014 15:55:55 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Tanya Brokhman <tlinder@codeaurora.org>, dedeking1@gmail.com
Subject: Re: [RFC/PATCH 1/5] mtd: ubi: Read disturb infrastructure
References: <1411886220-8208-1-git-send-email-tlinder@codeaurora.org>
 <5427C45C.2080506@nod.at> <5427CB6E.7010007@codeaurora.org>
 <5427CCD8.2090605@nod.at> <5427E6FE.3090906@codeaurora.org>
 <5427E8CA.8000904@nod.at> <542D49FD.7040204@codeaurora.org>
 <542D5203.2080601@nod.at> <542D5657.3060208@codeaurora.org>
In-Reply-To: <542D5657.3060208@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 02.10.2014 15:42, schrieb Tanya Brokhman:
> How do you test all of your fastmap fixes? Some of them are not easy to reproduce (the pq saving for example). Besides heavy stability testing, I was testing my changes manually by
> a lot of dbg prints in the code and analyzing the logs manually. Not the optimal way....

I'm currently implementing a test framework for fastmap.
Using it I've found many issues.
I hope I can release it soon, but first some legal issues have to be resolved.

Thanks,
//richard
