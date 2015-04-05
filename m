Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YerFS-0001Gx-16
 for linux-mtd@lists.infradead.org; Sun, 05 Apr 2015 20:34:26 +0000
Message-ID: <55219C3A.2060603@nod.at>
Date: Sun, 05 Apr 2015 22:34:02 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH V2] UBI: power cut emulation for testing
References: <1427410790-8855-1-git-send-email-david.oberhollenzer@sigma-star.at>
 <20150405193146.GA12132@amd>
 <CAFLxGvznA3m0vF=ygMsbqU0hVq7cpkDZWxCfqAQJKAutUhQj4w@mail.gmail.com>
 <20150405200459.GA1118@amd> <55219677.6090900@nod.at>
 <20150405202559.GA3500@amd>
In-Reply-To: <20150405202559.GA3500@amd>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 david.oberhollenzer@sigma-star.at, LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 05.04.2015 um 22:25 schrieb Pavel Machek:
> I guess so. So maybe warning in the documentation somewhere that real
> hardware is nastier than designed-to-be-nasty emulation would be
> nice..?

Yeah, that's a good idea. David, can you please create a patch
against mtd-www.git?
Please also cover the existing powercut emulation of UBIFS.

The reason why David added emulation for UBI was to stress-test
UBI fastmap. The crucial operation of UBI changing the mapping between
LEB and PEBs. This is why this emulation intercepts writes to the UBI
VID header. For the sake of completeness interception of EC writes
is also possible.

Thanks,
//richard
