Received: from mail-vn0-x236.google.com ([2607:f8b0:400c:c0f::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YeqYI-0000z6-KB
 for linux-mtd@lists.infradead.org; Sun, 05 Apr 2015 19:49:51 +0000
Received: by vnbf1 with SMTP id f1so1885257vnb.5
 for <linux-mtd@lists.infradead.org>; Sun, 05 Apr 2015 12:49:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150405193146.GA12132@amd>
References: <1427410790-8855-1-git-send-email-david.oberhollenzer@sigma-star.at>
 <20150405193146.GA12132@amd>
Date: Sun, 5 Apr 2015 21:49:27 +0200
Message-ID: <CAFLxGvznA3m0vF=ygMsbqU0hVq7cpkDZWxCfqAQJKAutUhQj4w@mail.gmail.com>
Subject: Re: [PATCH V2] UBI: power cut emulation for testing
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset=UTF-8
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

On Sun, Apr 5, 2015 at 9:31 PM, Pavel Machek <pavel@ucw.cz> wrote:
> On Thu 2015-03-26 23:59:50, david.oberhollenzer@sigma-star.at wrote:
>> Emulate random power cuts by switching device to ro after a number of
>> writes to allow simple power cut testing with nand-sim.
>>
>> Maximum and minimum number of successful writes before power cut and
>> what kind of writes (EC header, VID header or none) to interrupt
>> configurable via debugfs.
>>
>> Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
>> ---
>> V2: Remove broken check to prevent multiple triggering
>
> Does NAND always finish write of full block during powerfail?

Not sure if I correctly understand your question.
Unless you don't have special hardware a write can be interrupted and
can cause problems.

-- 
Thanks,
//richard
