Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bRdwG-000100-Gk
 for linux-mtd@lists.infradead.org; Mon, 25 Jul 2016 11:20:51 +0000
Subject: Re: [PATCH 2/2] ubi: attach: do not return -EINVAL if the
 mtd->numeraseregions is 1
To: Rajeev Kumar <rajeev_kumar@mentor.com>, dwmw2@infradead.org,
 computersforpeace@gmail.com
References: <1469440019-29358-1-git-send-email-rajeev_kumar@mentor.com>
 <1469440019-29358-2-git-send-email-rajeev_kumar@mentor.com>
 <5795EA8B.2040209@nod.at> <5795F529.2060807@mentor.com>
Cc: dedekind1@gmail.com, linux-mtd@lists.infradead.org, stable@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <5795F5F9.7090801@nod.at>
Date: Mon, 25 Jul 2016 13:20:25 +0200
MIME-Version: 1.0
In-Reply-To: <5795F529.2060807@mentor.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Rajeev,

Am 25.07.2016 um 13:16 schrieb Rajeev Kumar:
>> So, if your MTD erase regions with the same size, it should be 0.
>>
>> IIRC we had such a discussion already on linux-mtd and it was not clear
>> whether numeraseregions of 0 and 1 are equal or not.
>>
> 
> Could you please pass the link
> Thanks in advance

http://lmgtfy.com/?q=numeraseregions+ubi+linux-mtd :-)

*scnr*,
//richard
