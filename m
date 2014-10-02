Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XZgHM-0006FL-0g
 for linux-mtd@lists.infradead.org; Thu, 02 Oct 2014 13:18:44 +0000
Message-ID: <542D50A0.1080802@nod.at>
Date: Thu, 02 Oct 2014 15:18:24 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Tanya Brokhman <tlinder@codeaurora.org>, dedekind1@gmail.com
Subject: Re: [PATCH 1/4] UBI: Ensure that all fastmap work is done upon WL
 shutdown
References: <1412029248-22454-1-git-send-email-richard@nod.at>
 <1412029248-22454-2-git-send-email-richard@nod.at>
 <542D4D95.6000503@codeaurora.org>
In-Reply-To: <542D4D95.6000503@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 02.10.2014 15:05, schrieb Tanya Brokhman:
>> +#ifdef CONFIG_MTD_UBI_FASTMAP
>> +    flush_work(&ubi->fm_work);
> 
> flush_work returns bool. It might be useful to print that value for debugging.

Why would this be useful?
The sole purpose of this flush is having a barrier.
If flush_work() had to wait (returns true) for a pending work, fine.
If where was no work (returns false) to wait for, also fine. :)

Thanks,
//richard
