Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yeqrj-0000Eu-Bp
 for linux-mtd@lists.infradead.org; Sun, 05 Apr 2015 20:09:56 +0000
Message-ID: <55219677.6090900@nod.at>
Date: Sun, 05 Apr 2015 22:09:27 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH V2] UBI: power cut emulation for testing
References: <1427410790-8855-1-git-send-email-david.oberhollenzer@sigma-star.at>
 <20150405193146.GA12132@amd>
 <CAFLxGvznA3m0vF=ygMsbqU0hVq7cpkDZWxCfqAQJKAutUhQj4w@mail.gmail.com>
 <20150405200459.GA1118@amd>
In-Reply-To: <20150405200459.GA1118@amd>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
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

Am 05.04.2015 um 22:04 schrieb Pavel Machek:
> On Sun 2015-04-05 21:49:27, Richard Weinberger wrote:
>> On Sun, Apr 5, 2015 at 9:31 PM, Pavel Machek <pavel@ucw.cz> wrote:
>>> On Thu 2015-03-26 23:59:50, david.oberhollenzer@sigma-star.at wrote:
>>>> Emulate random power cuts by switching device to ro after a number of
>>>> writes to allow simple power cut testing with nand-sim.
>>>>
>>>> Maximum and minimum number of successful writes before power cut and
>>>> what kind of writes (EC header, VID header or none) to interrupt
>>>> configurable via debugfs.
>>>>
>>>> Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
>>>> ---
>>>> V2: Remove broken check to prevent multiple triggering
>>>
>>> Does NAND always finish write of full block during powerfail?
>>
>> Not sure if I correctly understand your question.
>> Unless you don't have special hardware a write can be interrupted and
>> can cause problems.
> 
> But this only emulates fail after a full block written, no?

Emulating all aspects of real hardware is almost impossible.

Thanks,
//richard
