Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUvwb-0000UH-NH
 for linux-mtd@lists.infradead.org; Fri, 19 Sep 2014 11:01:42 +0000
Message-ID: <541C0CFE.2090609@nod.at>
Date: Fri, 19 Sep 2014 13:01:18 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] UBI: Fix possible deadlock in erase_worker()
References: <1410853702-11616-1-git-send-email-richard@nod.at>	
 <1410946526.28850.120.camel@sauron.fi.intel.com> <541BFB6D.3040903@nod.at>
 <1411123647.28850.138.camel@sauron.fi.intel.com>
In-Reply-To: <1411123647.28850.138.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 19.09.2014 12:47, schrieb Artem Bityutskiy:
> On Fri, 2014-09-19 at 11:46 +0200, Richard Weinberg
>> Or we apply "[PATCH 1/2] UBI: Call worker functions without work_sem held". :)
> 
> But I explained in the other e-mail that the semaphore is needed, and
> why.

Sorry, I completely misunderstood your mail.
Rereading it now.

Thanks,
//richard
