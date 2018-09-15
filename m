Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g14ln-0008Bx-2s
 for linux-mtd@lists.infradead.org; Sat, 15 Sep 2018 07:13:33 +0000
From: Richard Weinberger <richard@nod.at>
To: Koen Vandeputte <koen.vandeputte@ncentric.com>
Cc: OpenWrt Development List <openwrt-devel@lists.openwrt.org>,
 linux-mtd@lists.infradead.org
Subject: Re: UBIFS issues within kernel 4.14.69?
Date: Sat, 15 Sep 2018 09:13:09 +0200
Message-ID: <18519120.7jNkZpEG5c@blindfold>
In-Reply-To: <daa753bf-8572-f2d4-847a-e7a87e49333d@ncentric.com>
References: <d3f55a2a-dd98-1bc6-272a-9a7b9a318b76@ncentric.com>
 <daa753bf-8572-f2d4-847a-e7a87e49333d@ncentric.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Koen,

Am Dienstag, 11. September 2018, 16:26:34 CEST schrieb Koen Vandeputte:
> 
> On 2018-09-11 15:46, Koen Vandeputte wrote:
> > Hi Richard,
> ...
> 
> > I'm only seeing these issues on UBIFS enabled volumes.
> >
> > It seems it's related to one of your 5 commits, but I'm still in the 
> > process of bisecting to find the actual culprit.
> > As soon as I've found it, I'll let you know, but maybe you already 
> > have an idea here?
> >
> Reverting ("ubifs: xattr: Don't operate on deleted inodes") fixes the 
> weird issues.

Thanks for finding that bad commit!
I fear by fixing one bug I've uncovered another one.

So, I guess you are using overlayfs?
Which overlayfs features are you using?

Thanks,
//richard
