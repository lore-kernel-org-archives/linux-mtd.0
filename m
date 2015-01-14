Received: from mail-vc0-x229.google.com ([2607:f8b0:400c:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBSn0-00012d-RS
 for linux-mtd@lists.infradead.org; Wed, 14 Jan 2015 18:35:35 +0000
Received: by mail-vc0-f169.google.com with SMTP id hy10so3421672vcb.0
 for <linux-mtd@lists.infradead.org>; Wed, 14 Jan 2015 10:35:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAAK6Zt29rv0CSC42BbpULP=rwzSGUWcxBC=ewg5aX03JoCjzCg@mail.gmail.com>
References: <1421206498-28826-1-git-send-email-dehrenberg@chromium.org>
 <alpine.DEB.2.02.1501140846310.27318@lnxricardw1.se.axis.com>
 <CAAK6Zt29rv0CSC42BbpULP=rwzSGUWcxBC=ewg5aX03JoCjzCg@mail.gmail.com>
Date: Wed, 14 Jan 2015 19:35:11 +0100
Message-ID: <CAFLxGvztZ6drUmEMTXcnoAWPPg6mWRc7w-LkubWcHHXV2TsqKQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: Add config option to skip scanning bad blocks in
 partitions
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Daniel Ehrenberg <dehrenberg@google.com>
Content-Type: text/plain; charset=UTF-8
Cc: "gwendal@chromium.org" <gwendal@chromium.org>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>,
 "grundler@chromium.org" <grundler@chromium.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "ezequiel@vanguardiasur.com.ar" <ezequiel@vanguardiasur.com.ar>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 14, 2015 at 7:08 PM, Daniel Ehrenberg <dehrenberg@google.com> wrote:
> To initialize the partitions, it takes me 3.5s with this config option
> turned on and .2s with the config option turned off. So a large
> proportion of the NAND startup time (not counting ubi coming up) is
> comes from this bad block scan. It takes about 1.87s to scan over the
> device, and I have my partitioning set up so there's an extra
> partition covering the whole device in addition to the individual
> partitions.

3.5seconds?! Wow.

-- 
Thanks,
//richard
