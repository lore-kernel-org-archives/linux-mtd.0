Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YbWX8-0006R6-RF
 for linux-mtd@lists.infradead.org; Fri, 27 Mar 2015 15:50:56 +0000
Message-ID: <55157C3B.20500@nod.at>
Date: Fri, 27 Mar 2015 16:50:19 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: "Morand, Guy" <Guy.Morand@comet.ch>
Subject: Re: UBIFS corruption and UBI + unstable bit questions
References: <68AC191B3EB2874F99C36CD9CA3A6D42195CB0@cgpmbx01.comet.ch>
 <CAFLxGvzqfmFqRLts5Swa-tintZzJksb6PsRXaNBX9KaRBpXMvg@mail.gmail.com>
 <68AC191B3EB2874F99C36CD9CA3A6D42195ED8@cgpmbx01.comet.ch>
 <55144D47.3000203@nod.at>
 <68AC191B3EB2874F99C36CD9CA3A6D42196181@cgpmbx01.comet.ch>
In-Reply-To: <68AC191B3EB2874F99C36CD9CA3A6D42196181@cgpmbx01.comet.ch>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 27.03.2015 um 14:30 schrieb Morand, Guy:
> Hi,
> 
> Thanks for clarifying!
> 
>> But it depends on the type of the corruption.
> What do you mean by "type of the corruption". Is it about a PEB containing the 
> volume table corrupting every volumes on the MTD device? I can't imagine a PEB
> containing "regular data" corrupting the whole MTD device or correct me if I'm 
> wrong! I guess this should be extremely rare as we don't update the volume table 
> every day ...

We save the volume table twice. But you can't expect that UBI or UBIFS will
survive perfectly fine if random PEBs tun out of the sudden bad.

>> Okay. That's what I thought. I've never seen the issue on serious hardware.
> Serious hardware, does that mean with seriously select components?

Yes.

Thanks,
//richard
