Received: from mail-wr0-x22d.google.com ([2a00:1450:400c:c0c::22d])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAViG-0005e3-Uo
 for linux-mtd@lists.infradead.org; Mon, 23 Apr 2018 07:16:39 +0000
Received: by mail-wr0-x22d.google.com with SMTP id u18-v6so10867425wrg.3
 for <linux-mtd@lists.infradead.org>; Mon, 23 Apr 2018 00:16:25 -0700 (PDT)
Subject: Re: [PATCH 10/18] mtd: rawnand: factor nand_command_lp() into
 nand_command()
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Sam Lefebvre <sam.lefebvre@essensium.com>
Cc: linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>
References: <20180420081946.16088-1-sam.lefebvre@essensium.com>
 <20180420081946.16088-11-sam.lefebvre@essensium.com>
 <20180420223454.445a1858@bbrezillon>
From: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <24b2eb32-34d2-3573-ab53-01b8b7c112cf@mind.be>
Date: Mon, 23 Apr 2018 09:16:23 +0200
MIME-Version: 1.0
In-Reply-To: <20180420223454.445a1858@bbrezillon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 Hi Boris,

On 20-04-18 22:34, Boris Brezillon wrote:
> Hi Sam, Arnout,
> 
> On Fri, 20 Apr 2018 10:19:38 +0200
> Sam Lefebvre <sam.lefebvre@essensium.com> wrote:
> 
>> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>[snip]
>> Note that I don't have access to a small-page device, so only tested on
>> large-page devices. Also only tested on i.MX6Q (gpmi-nand).
>>
>> I only verified the lack of change in behaviour during nand_detect by
>> reading the code, so it's possible that I missed something. Testing on
>> various devices (ONFI, JEDEC, non-ONFI/JEDEC) is needed to be really
>> sure that nothing breaks.
>>
>> Note that this patch can be removed from the series without affecting
>> the rest.
> 
> Hm, I don't want to risk any regression, so I'm gonna pass on this
> patch, especially since we're trying to get rid of ->cmdfunc() in favor
> or ->exec_op().

 Absolutely. This patch was included more to show how patch 11 was constructed.
I completely agree that it's too risky.

 Regards,
 Arnout

> 
> The same goes for patch 9, sorry.
> 
> Regards,
> 
> Boris
[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
