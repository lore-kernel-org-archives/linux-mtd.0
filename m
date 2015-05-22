Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yvum9-000875-7Q
 for linux-mtd@lists.infradead.org; Fri, 22 May 2015 21:46:42 +0000
Message-ID: <555FA3A5.7070600@nod.at>
Date: Fri, 22 May 2015 23:46:13 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Fabian Frederick <fabf@skynet.be>
Subject: Re: [PATCH 6/6 linux-next] ubifs: remove else after return
References: <1431726240-4675-1-git-send-email-fabf@skynet.be>
 <1431726240-4675-6-git-send-email-fabf@skynet.be>
 <CAFLxGvy=QWcaHbgQyk+WjH1KX__u1Ye6eZ+W4NR7RTifQy3CWQ@mail.gmail.com>
 <1796356142.534811.1432057342188.open-xchange@webmail.nmp.proximus.be>
 <555B797B.90309@nod.at>
 <357577728.30474.1432330663780.open-xchange@webmail.nmp.proximus.be>
In-Reply-To: <357577728.30474.1432330663780.open-xchange@webmail.nmp.proximus.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Cc: Adrian Hunter <adrian.hunter@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 22.05.2015 um 23:37 schrieb Fabian Frederick:
> 
> 
>> On 19 May 2015 at 19:57 Richard Weinberger <richard@nod.at> wrote:
>>
>>
>> Am 19.05.2015 um 19:42 schrieb Fabian Frederick:
>>>          All was compiled but untested.
>>
>> Can you please test your changes too?
>> Trivial looking changes introduce sometimes issues and having them
>> tested would be wonderful.
>>
>> You can test UBIFS using nandsim or mtdram on any Linux
>> system.
>> See: http://www.linux-mtd.infradead.org/faq/nand.html#L_nand_nandsim
> 
> I guess the following patches can be applied without testing ?

Let me put it to you this way, refusing to test your patches does not
increase the possibility to get them merged. :-)

Really, test your patches and don't become a patch bot.

Thanks,
//richard
