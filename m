Received: from mail-vn0-x22d.google.com ([2607:f8b0:400c:c0f::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yg7v0-0005pc-Ab
 for linux-mtd@lists.infradead.org; Thu, 09 Apr 2015 08:34:35 +0000
Received: by vnbf1 with SMTP id f1so20819163vnb.0
 for <linux-mtd@lists.infradead.org>; Thu, 09 Apr 2015 01:34:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1427410790-8855-1-git-send-email-david.oberhollenzer@sigma-star.at>
References: <1427410790-8855-1-git-send-email-david.oberhollenzer@sigma-star.at>
Date: Thu, 9 Apr 2015 10:34:10 +0200
Message-ID: <CAFLxGvywkhhb+KjMfLwtoNMZ+yvJZw+rHpz5ekkb_XH8wCpVUw@mail.gmail.com>
Subject: Re: [PATCH V2] UBI: power cut emulation for testing
From: Richard Weinberger <richard.weinberger@gmail.com>
To: david.oberhollenzer@sigma-star.at
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 26, 2015 at 11:59 PM,  <david.oberhollenzer@sigma-star.at> wrote:
> Emulate random power cuts by switching device to ro after a number of
> writes to allow simple power cut testing with nand-sim.
>
> Maximum and minimum number of successful writes before power cut and
> what kind of writes (EC header, VID header or none) to interrupt
> configurable via debugfs.
>
> Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
> ---
> V2: Remove broken check to prevent multiple triggering

Applied and pushed to linux-ubifs.git/master!

-- 
Thanks,
//richard
