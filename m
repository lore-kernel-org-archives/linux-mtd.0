Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SmL3x-000396-HQ
 for linux-mtd@lists.infradead.org; Wed, 04 Jul 2012 08:35:54 +0000
Message-ID: <4FF4005E.1070106@nod.at>
Date: Wed, 04 Jul 2012 10:35:42 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: Re: [PATCH 0/5] ubi: Fix bad PEBs reserve caclulation
References: <1341389164-24409-1-git-send-email-shmulik.ladkani@gmail.com>
In-Reply-To: <1341389164-24409-1-git-send-email-shmulik.ladkani@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04.07.2012 10:05, Shmulik Ladkani wrote:
> Shmulik Ladkani (5):
>    ubi: introduce ubi->bad_peb_limit
>    ubi: Limit amount of reserved eraseblocks for bad PEB handling
>    ubi: kill CONFIG_MTD_UBI_BEB_RESERVE
>    ubi: trivial: fix comment of ubi_calculate_reserved()
>    ubi: harmonize the update of ubi->beb_rsvd_pebs

Has this patch set an impact on UBI fastmap?
...wondering why I'm CC'd. :-)

Thanks,
//richard
